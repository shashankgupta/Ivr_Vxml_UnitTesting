package com.ericsson.vxmlunit.init;

// this is the example of first using httpunit and then using xml unit for schema validating against the generated file using httpunit
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.PrintStream;

import org.custommonkey.xmlunit.Validator;
import org.xml.sax.InputSource;

import com.meterware.httpunit.GetMethodWebRequest;
import com.meterware.httpunit.HttpUnitOptions;
import com.meterware.httpunit.WebConversation;
import com.meterware.httpunit.WebRequest;
import com.meterware.httpunit.WebResponse;


public class vxmlServer {
	public static void main(String[] params) {
		FileOutputStream out;
		PrintStream p;
		InputSource is;
		try {
			//httpunit for vxml file starts  here
			// create the conversation object which will maintain state for us
			WebConversation wc = new WebConversation();
			//set the proxy server for vxml file
			wc.setProxyServer("localhost", 8080);
			// give the url of a vxml file
			String url = "http://localhost:8080/JSP/Sample_copy.jsp";
			//set scripting enabled or disabled in vxml file
			HttpUnitOptions.setScriptingEnabled(false);
			//The GetMethodWebRequest(String url) creates an HTTP request using the GET method.
			WebRequest request = new GetMethodWebRequest(url);
			//The response may now be manipulated either as pure text (via the getText() method), as a DOM (via the getDOM() method)
			WebResponse response = wc.getResponse(request);
			//save the vxml file on a hard disk
			out = new FileOutputStream("/Users/Shank/Workspace/VXMLUnit/retVXML/a.vxml");
			p = new PrintStream(out);
			p.println(response.getText());
			p.close();
			//after saving close the vxml file and print vxml written
			System.out.println("vxml written");
			//httpunit ends
			//httpunit for schema file starts here
			//set the proxy server for schema file
			//			wc.setProxyServer("www-proxy.ericsson.se", 8080);
			// give the url of a schema file
//			String url1 = "http://www.w3.org/TR/voicexml20/vxml.xsd";
			String url1 = "http://schemas.stylusstudio.com/voicexml20/u1fa4064b/index.html";
			WebRequest req = new GetMethodWebRequest(url1);
			WebResponse resp = wc.getResponse(req);
			//save the schema file
			out = new FileOutputStream("/Users/Shank/Workspace/VXMLUnit/retVXML/b.vxml");
			p = new PrintStream(out);
			p.println(resp.getText());
			p.close();
			//close the shema file and print schema written
			System.out.println("schema written");
			//httpunit ends here.
			//xml unit starts here.
			//check here whether schema is valid or invalid using a validator
			//give the location of vxml file where the vxml was saved using httpunuit
			is = new InputSource(new FileInputStream("/Users/Shank/Workspace/VXMLUnit/retVXML/a.vxml"));
			Validator v;
			v = new Validator(is);
			v.useXMLSchema(true);
			//the schema file location
			v.setJAXP12SchemaSource(new File("/Users/Shank/Workspace/VXMLUnit/retVXML/b.vxml"));
			boolean isValid = v.isValid();
			System.out.println(isValid);
			//xml unit ends here
			//print whether the vxml is valid or not

			if(isValid==false)
			{
				//if schema is not valid delete both the vxml and schema file 
				File f1 = new File("/Users/Shank/Workspace/VXMLUnit/a.vxml");
				f1.delete();
				System.out.println("vxml file Deleted");
				File f2 = new File("/Users/Shank/Workspace/VXMLUnit/b.vxml");
				f2.delete();
				System.out.println("schema file Deleted");


			}
			else { 
				//if schema is valid delete only schema file
				File f2 = new File("/Users/Shank/Workspace/VXMLUnit/b.vxml");
				f2.delete();
				System.out.println("schema file Deleted");
			}
		}
		catch (Exception e) {
			System.err.println("Exception: " + e.getMessage());
			e.printStackTrace();
		}
	}

}


