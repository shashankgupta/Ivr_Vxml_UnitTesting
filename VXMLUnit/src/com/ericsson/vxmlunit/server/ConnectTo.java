/**
 *
 */
package com.ericsson.vxmlunit.server;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.OutputStream;

import com.jcraft.jsch.Channel;
import com.jcraft.jsch.ChannelSftp;
import com.jcraft.jsch.JSch;
import com.jcraft.jsch.Session;

/**
 * @author vigilance
 *
 */
public class ConnectTo {

	/**
	 *
	 */
	public ConnectTo() {

	}

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		String SFTPHOST = "localhost";
		int    SFTPPORT = 8080;
		String SFTPUSER = "admin";
		String SFTPPASS = "password";
		String SFTPWORKINGDIR = "/testUpload/";

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
			File f = new File("/Users/Shank/Downloads/lecture40.pdf");
			channelSftp.put(new FileInputStream(f), f.getName());
		}catch(Exception ex){
			ex.printStackTrace();
		}

	}

}