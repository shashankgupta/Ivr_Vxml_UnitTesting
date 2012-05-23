package com.ericsson.vxmlunit.server;

import java.io.File;
import java.io.FileInputStream;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;

import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;

public class ReadXML {
	
	public static void main(String[] args) throws Exception {
		
		DocumentBuilderFactory dbf = DocumentBuilderFactory.newInstance();
		dbf.setValidating(false);
    	DocumentBuilder db = dbf.newDocumentBuilder();
    	Document doc = db.parse(new FileInputStream(new File("C:/Documents and Settings/Administrator/Desktop/propertyxml.xml")));
    	
    	Element channelNode = (Element) doc.getElementsByTagName("vxmlunit").item(0);
    	
    	Node titleNode = (Node) channelNode.getElementsByTagName("host");
//    	String title = titleNode.getFirstChild().getNodeValue();
    	System.out.println("Title: " + titleNode);

//    	Node languageNode = channelNode.getElementsByTagName("language").item(0);
//    	String language = languageNode.getFirstChild().getNodeValue();
//    	System.out.println("Language: " + language);
//    	
//    	NodeList itemsList = doc.getElementsByTagName("item");
//    	
//    	int itemsCount = itemsList.getLength();
    	
//    	for (int i = 0; i<itemsCount; i++) {	
//    		
//    		System.out.println("Item: ");
//			
//    		Node itemNode = itemsList.item(i);
//			Element item = (Element) itemNode;
//			
//			Node itemTitleNode = item.getElementsByTagName("title").item(0);
//			String itemTitle = itemTitleNode.getFirstChild().getNodeValue();
//	    	System.out.println("\tTitle: " + itemTitle);			
//			
//			Node linkNode = item.getElementsByTagName("link").item(0);
//			String link = linkNode.getFirstChild().getNodeValue();
//	    	System.out.println("\tLink: " + link);		
//			
//			Node pubDateNode = item.getElementsByTagName("pubDate").item(0);
//			String pubDate = pubDateNode.getFirstChild().getNodeValue();
//	    	System.out.println("\tPubDate: " + pubDate);
//			
//		}
		
	}

}