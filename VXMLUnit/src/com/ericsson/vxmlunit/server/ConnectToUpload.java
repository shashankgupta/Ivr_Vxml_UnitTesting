package com.ericsson.vxmlunit.server;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.util.Hashtable;
import java.util.Map;

import javax.management.MBeanServerConnection;
import javax.management.ObjectName;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;
import javax.xml.xpath.XPath;
import javax.xml.xpath.XPathConstants;
import javax.xml.xpath.XPathExpression;
import javax.xml.xpath.XPathExpressionException;
import javax.xml.xpath.XPathFactory;

import org.w3c.dom.Document;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;
import org.xml.sax.SAXException;

import com.jcraft.jsch.Channel;
import com.jcraft.jsch.ChannelSftp;
import com.jcraft.jsch.JSch;
import com.jcraft.jsch.Session;



public class ConnectToUpload {

	private String localPath;
	private String remotePath;
	private String localPathPart1;
	private String localPathPart2;
	private String remotePathPart1;
	private String remotePathPart2 = "/server/default/deploy/prod-app.war/";
	private String remotePathPart3;
	private String read_url;
	private String url;
	private String host;
	private String port;
	private String type;
	private String userName;
	private String password;
	Boolean exist = false;

	public ConnectToUpload() {
	}

	public Boolean checkEnvVar() {
		String jbossPath = "JBOSS_HOME";
		Boolean flag = false;


		Map<String, String> env = System.getenv();
		for(Map.Entry<String, String> entry : env.entrySet()) {
			String key = entry.getKey();
			String value = entry.getValue();
			if(key.equals(jbossPath)) {
				this.remotePathPart1 = value;
				flag = true;
			}
		}
		if(flag) {
			File file = new File(remotePathPart1);
			if(file.exists()) {
				this.exist = true;
			}
		}

		return flag;
	}

	void transferLocal(File src, File dst) throws IOException {

		//Runtime.getRuntime().exec(command);
		FileInputStream in = new FileInputStream(src);
		OutputStream out = new FileOutputStream(dst);

		// Transfer bytes from in to out
		byte[] buf = new byte[1024];
		int len;
		while ((len = in.read(buf)) > 0) {
			out.write(buf, 0, len);
		}
		System.out.println("write Complete");
		in.close();
		out.close();
	}

	public void transferRemote(File src) {
		String SFTPHOST = this.host;
		int    SFTPPORT = 22;
		String SFTPUSER = this.userName;
		String SFTPPASS = this.password;
		this.remotePathPart3 = localPathPart2.substring(localPathPart2.indexOf("jspfiles"), localPathPart2.lastIndexOf("\\"));
		String SFTPWORKINGDIR = "opt/vxml-ivr/env_prod/deploy-app/" + remotePathPart3.replace("\\", "/");

		Session 	session 	= null;
		Channel 	channel 	= null;
		ChannelSftp channelSftp = null;

		try{
			JSch jsch = new JSch();
			session = jsch.getSession(SFTPUSER,SFTPHOST,SFTPPORT);
			session.setPassword(SFTPPASS);
			java.util.Properties config = new java.util.Properties();
			config.put("StrictHostKeyChecking", "no");
			session.setConfig(config);
			session.connect();
			channel = session.openChannel("sftp");
			channel.connect();
			channelSftp = (ChannelSftp)channel;
			channelSftp.cd(SFTPWORKINGDIR);
			File f = new File(src.toString().replace("\\", "/"));
			channelSftp.put(new FileInputStream(f), f.getName());
			channelSftp.disconnect();
			System.out.println("disconnect");
		}catch(Exception ex){
			ex.printStackTrace();
		}
	}

	public File constructLocalPath() {
		try {

			File localdir = new File(".");
			this.localPathPart1 = localdir.getCanonicalPath(); 
			this.localPath =  this.localPathPart1 + this.localPathPart2;

		} catch (Exception e) {
			e.printStackTrace();
		}
		System.out.println(localPath);
		File lfile = new File(localPath);
		return lfile;
	}

	public File contructLocalServerPath() {
		this.remotePathPart3 = localPathPart2.substring(localPathPart2.indexOf("jspfiles"), localPathPart2.length());
		Boolean flag = checkEnvVar();
		if(flag && exist.booleanValue()) {
			this.remotePath = remotePathPart1 + remotePathPart2 + remotePathPart3;
		}
		System.out.println(remotePath);
		File rfile = new File(remotePath);
		return rfile;
	}

	public void readXML(String modulename) throws ParserConfigurationException, SAXException, IOException, XPathExpressionException{
		DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
		factory.setNamespaceAware(true);
		DocumentBuilder builder;
		Document doc = null;
		XPathExpression expr = null;
		builder = factory.newDocumentBuilder();
		doc = builder.parse("/Users/Shank/git_repo/Ivr_Vxml_UnitTesting/VXMLUnit/schema/propertyxml.xml");
		XPathFactory xFactory = XPathFactory.newInstance();
		XPath xpath = xFactory.newXPath();

		expr = xpath.compile("vxmlunit/host");
		String ht = (String) expr.evaluate(doc, XPathConstants.STRING);
		this.host = ht;

		expr = xpath.compile("vxmlunit/port");
		String pt = (String) expr.evaluate(doc, XPathConstants.STRING);
		this.port = pt;

		expr = xpath.compile("vxmlunit/type");
		String ty = (String) expr.evaluate(doc, XPathConstants.STRING);
		this.type = ty;

		expr = xpath.compile("vxmlunit/username");
		String us = (String) expr.evaluate(doc, XPathConstants.STRING);
		this.userName = us;

		expr = xpath.compile("vxmlunit/password");
		String pw = (String) expr.evaluate(doc, XPathConstants.STRING);
		this.password = pw;

		expr = xpath.compile("vxmlunit/module[@name='"+ modulename + "']/node()");
		Object result = expr.evaluate(doc, XPathConstants.NODESET);
		NodeList nodes = (NodeList) result;
		for (int i=0; i<nodes.getLength();i++){
			Node node = nodes.item(i);
			if((node.getNodeType() == Node.ELEMENT_NODE)) {
				if(node.getNodeName().equals("localpath"))
					this.localPathPart2 = node.getTextContent();
				else if(node.getNodeName().equals("url"))
					this.read_url = node.getTextContent();
			}
		}

		if(this.type.equals("local")) {
			transferLocal(constructLocalPath(), contructLocalServerPath());
			restartServer();
			constructURL();
		}
		else if(this.type.equals("remote")){
			transferRemote(constructLocalPath());
			restartServer();
			constructURL();
		}
	}

	public void restartServer() {
		try {
			Hashtable<String, String> env = new Hashtable<String, String>();
			env.put(Context.INITIAL_CONTEXT_FACTORY, "org.jnp.interfaces.NamingContextFactory");
			env.put(Context.PROVIDER_URL, "jnp://" + this.host + ":1099");
			env.put(Context.URL_PKG_PREFIXES, "org.jboss.naming:org.jnp.interfaces");

			Context ctx = new InitialContext(env);
			MBeanServerConnection mconn =(MBeanServerConnection)ctx.lookup("jmx/invoker/RMIAdaptor");
			ObjectName name = new ObjectName("jboss.web.deployment:war=/VXMLIVR");
			mconn.invoke(name, "stop", null, null);
			mconn.invoke(name, "start", null, null);
		} catch (Exception e) {
			e.printStackTrace();
		} 
	}

	public void constructURL() {
		this.url = ("http://" + host + ":" + port + "/VXMLIVR/" + read_url);
	}

	public String getUrl() {
		return this.url;
	}

//	public static void main(String[] args) {
//		ConnectToUpload ctu = new ConnectToUpload();
//		try {
//			try {
//				ctu.readXML("StandardVoucherRefill");
//			} catch (XPathExpressionException e) {
//				// TODO Auto-generated catch block
//				e.printStackTrace();
//			} catch (ParserConfigurationException e) {
//				// TODO Auto-generated catch block
//				e.printStackTrace();
//			} catch (SAXException e) {
//				// TODO Auto-generated catch block
//				e.printStackTrace();
//			}
//			//			ctu.transfer(ctu.constructLocalPath(), ctu.contructRemotePath());
//		} catch (IOException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
//
//	}
}