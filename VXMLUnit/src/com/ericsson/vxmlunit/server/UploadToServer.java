package com.ericsson.vxmlunit.server;

import java.io.*;

public class UploadToServer {

	boolean result = false;
	
	public void uploadFile(String localPath, String remotePath) {

		File localFile = new File(localPath);
		File remoteFile = new File(remotePath);
		try {
			copy(localFile, remoteFile);
			result = true;
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			result = false;

			// System.out.println("copying xml file to remote:" +
			// renameLocaltempFileToRemote);
		}
	}

	void copy(File src, File dst) throws IOException {

		FileInputStream in = new FileInputStream(src);
		new File(dst.getParent()).mkdirs();
		OutputStream out = new FileOutputStream(dst);
		
		// Transfer bytes from in to out
		byte[] buf = new byte[1024];
		int len;
		while ((len = in.read(buf)) > 0) {
			out.write(buf, 0, len);
		}
		in.close();
		out.close();
	}
	
	public static void main(String[] args) {
		String localpath = "/Users/Shank/Downloads/t1.txt";
		String remotepath = "/Library/tomcat/webapps/testUpload/jt.txt";
		
		UploadToServer uts = new UploadToServer();
		uts.uploadFile(localpath, remotepath);
	}
}
