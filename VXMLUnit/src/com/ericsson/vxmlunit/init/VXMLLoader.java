package com.ericsson.vxmlunit.init;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.swing.JOptionPane;
import javax.xml.XMLConstants;
import javax.xml.transform.Source;
import javax.xml.transform.dom.DOMSource;
import javax.xml.validation.Schema;
import javax.xml.validation.SchemaFactory;
import javax.xml.validation.Validator;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;

import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.xml.sax.SAXException;
import com.ericsson.vxmlunit.init.SaxErrorHandler;
import com.ericsson.vxmlunit.exception.VXMLException;
import com.ericsson.vxmlunit.exception.VXMLScriptException;
import com.ericsson.vxmlunit.interpreter.VXMLInterpreter;
import com.ericsson.vxmlunit.script.ScriptUtil;
import com.ericsson.vxmlunit.vo.Catch;
import com.ericsson.vxmlunit.vo.Else;
import com.ericsson.vxmlunit.vo.ElseIf;
import com.ericsson.vxmlunit.vo.Field;
import com.ericsson.vxmlunit.vo.Filled;
import com.ericsson.vxmlunit.vo.If;
import com.ericsson.vxmlunit.vo.Script;
import com.ericsson.vxmlunit.vo.Subdialog;
import com.ericsson.vxmlunit.vo.Vxml;
import com.ericsson.vxmlunit.vo.base.AbstractBaseItem;
import com.ericsson.vxmlunit.vo.factory.VXMLItemFactory;

public class VXMLLoader{

	/**
	 * @param args
	 */

	private Vxml vxml;
	public String prefixUrl;

	public VXMLLoader(String url, VXMLInterpreter interpreter) throws VXMLException {

		Document document = null;
		try {
			extractURL(url);
			//        	String content = getContentUrl(url);
			//        	System.out.println(content);
			//        	InputStream stream = new FileInputStream(url);
			DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();

			factory.setNamespaceAware(true);
			factory.setExpandEntityReferences(true);
			//factory.setValidating(true);
			SchemaFactory schemaFactory = SchemaFactory.newInstance(XMLConstants.W3C_XML_SCHEMA_NS_URI );
			schemaFactory.setErrorHandler(new SaxErrorHandler());
//			Schema schemaXSD = schemaFactory.newSchema( new File ( "C:/workspace/VXMLUnit/schema/vxml.xsd" ) );
//			Validator validator = schemaXSD.newValidator();

			DocumentBuilder builder = factory.newDocumentBuilder();
			System.out.println(url);
			document = builder.parse(url);
//			validator.validate(new DOMSource(document));
			//			document = builder.parse(content);
		} catch (ParserConfigurationException e) {
			throw new VXMLException("ParserConfigurationException = " + e.getMessage());
		} catch (FileNotFoundException e) {
			throw new VXMLException("FileNotFoundException = " + e.getMessage());
		} catch (SAXException e) {
			throw new VXMLException("SAXException = " + e.getMessage());
		} catch (IOException e) {
			throw new VXMLException("IOException = " + e.getMessage());
		}

		if(document != null) {
			Element vxmlElement = document.getDocumentElement();
			if(vxmlElement != null) {	

				vxml = new Vxml(vxmlElement);
				vxml.setUrlprefix(getPrefixUrl());
				String application = vxml.getApplication();
				try {
					ScriptUtil.executeAppVar();
				} catch (VXMLScriptException e) {
					e.printStackTrace();
				}

				if((!application.isEmpty() && !application.trim().equals(getPrefixUrl().trim()))) {
					VXMLLoader rootLoader = new VXMLLoader(application, interpreter);
					Vxml rootVxml = rootLoader.getVxml();

					interpreter.initializeVariables(rootVxml);
					interpreter.initializeScript(rootVxml);

				}
				loadItem(vxml, vxmlElement.getFirstChild());
			}
		}
	}

	public Vxml getVxml() {
		return vxml;
	}

	public void setVxml(Vxml vxml) {
		this.vxml = vxml;
	}

	//	private void setParentChildRelationship(AbstractBaseItem parent, AbstractBaseItem child) {
	//		parent.getChildren().add(child);
	//		child.setParent(parent);
	//	}

	private List<If> currentIfNodeList = new ArrayList<If>();

	private AbstractBaseItem loadItem(AbstractBaseItem parent, Node currentNode) throws VXMLException {

		AbstractBaseItem current = null;
		AbstractBaseItem sibling = null;
		AbstractBaseItem firstChild = null;

		if(currentNode != null) {
			if(currentNode.getNodeType() == Node.ELEMENT_NODE) {
				Element element = (Element) currentNode;

				current = VXMLItemFactory.getItem(element.getTagName(), element, parent);

				if(current.getName().equals("if")) {
					currentIfNodeList.add((If) current);
				}
				if(current.getName().equals("elseif")) {
					If currentIf = currentIfNodeList.get(currentIfNodeList.size() - 1);
					ElseIf elseIfElement = (ElseIf) current;
					elseIfElement.setIndex(currentIf.getListElseIf().size());
					currentIf.getListElseIf().add(elseIfElement);
				}
				if(current.getName().equals("else")){
					If currentElse = currentIfNodeList.get(currentIfNodeList.size() - 1);
					currentElse.setElseItem((Else) current);
				}

				//System.out.println(current);
				if(current != null) {
					//setParentChildRelationship(parent, current);
					firstChild = loadItem(current, element.getFirstChild()); // Loading Children

					if(current.getName().equals("if")) {
						currentIfNodeList.remove(currentIfNodeList.size() - 1);
					}
					else if(current.getName().equals("catch")) {
						Catch catchItem = (Catch) current;
						if(catchItem.getParent().getName().equals("field")){
							catchItem.setScope(Catch.SCOPE_FIELD);
							current.getParent().getCatchStack().add(catchItem);
						}
						if(catchItem.getParent().getName().equals("form")){
							catchItem.setScope(Catch.SCOPE_FORM);
							current.getParent().getCatchStack().add(catchItem);
						}
						if(catchItem.getParent().getName().equals("vxml")){
							catchItem.setScope(Catch.SCOPE_VXML);
							current.getParent().getCatchStack().add(catchItem);
						}
						if(catchItem.getParent().getName().equals("vxml")){
							catchItem.setScope(Catch.SCOPE_ROOT);
							current.getParent().getCatchStack().add(catchItem);
						}
					}
					else if(current.getName().equals("filled")) {
						if(current.getParent() instanceof Field) {
							Field fieldItem = (Field) current.getParent();
							fieldItem.setFilled((Filled) current);
						}
					}
					else if(current.getName().equals("filled")) {
						if(current.getParent() instanceof Subdialog) {
							Subdialog subdItem = (Subdialog) current.getParent();
							subdItem.setFilled((Filled) current);
						}
					}

					if(current.getName().equals("script")) {
						Script script = (Script) current;
						script.setUrlprefix(getPrefixUrl());
					}

					if(current.getName().equals("nomatch") && current.getParent().getName().equals("field")){
						Field parentField = (Field) current.getParent();
						parentField.getNomatchStack().add((Catch) current);
					}

					sibling = loadItem(parent, currentNode.getNextSibling()); // Loading Siblings

					current.setNextSibling(sibling);
					current.setFirstChild(firstChild);

					if(current.getName().equals("field")) {
						Field fieldItem = (Field) current;
						fieldItem.reorderChildren();
					}
				}
				//				else 
				//					return loadItem(parent, currentNode.getNextSibling());
			} else {
				return loadItem(parent, currentNode.getNextSibling());
			}
		}

		return current;

	}

	public void extractURL(String url) {
		if(url != null ){
			String[] a = url.split("V");
			String s = a[0].substring(0, a[0].length() - 1);
			setPrefixUrl(s);
		}
	}

	public String getPrefixUrl() {
		return prefixUrl;
	}

	public void setPrefixUrl(String prefixUrl) {
		this.prefixUrl = prefixUrl;
	}


}
