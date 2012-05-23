package com.ericsson.vxmlunit.server;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;

public class TestUpload {

	/**
	 * @param args
	 * @throws IOException 
	 */
	public static void main(String[] args) throws IOException {
		
		
		
		URL url = new URL("http://localhost:8080/testUpload/test.txt");
	    HttpURLConnection con = (HttpURLConnection) url.openConnection();
	    try {
	        con.setDoOutput(true);
	        con.setRequestMethod("POST");
//	        con.addRequestProperty("Authorization", "Basic " + encode64("admin" + ":" + "password"));
	        OutputStream out = con.getOutputStream();
	        try {
	            InputStream in = new FileInputStream("/Users/Shank/Downloads/t1.txt");
	            try {
	                byte buffer[] = new byte[4096];
	                for (int n = in.read(buffer); n > 0; n = in.read(buffer)) {
	                    out.write(buffer, 0, n);
	                }
	            } finally {
	                in.close();
	            }
	        } finally {
	            out.close();
	        }
	        int code = con.getResponseCode();
	        if (code != HttpURLConnection.HTTP_OK) {
	            String msg = con.getResponseMessage();
	            throw new IOException("HTTP Error " + code + ": " + msg);
	        }
	    } finally {
	        con.disconnect();
	    }

	}

}
