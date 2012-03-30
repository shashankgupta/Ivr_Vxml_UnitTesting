package com.ericsson.vxmlunit.vo;

import com.ericsson.vxmlunit.vo.base.AbstractBaseItem;
import com.ericsson.vxmlunit.vo.base.SortedStack;

import org.w3c.dom.Element;


public class Vxml extends AbstractBaseItem {

	public String application;
	public String content;
	
	public Vxml(Element element) {
		application = element.getAttribute("application");
//		content = getContentUrl(application);
		setApplication(application);
		setName("vxml");
		
		catchStack = new SortedStack<Catch>();
	}

//	public String getContent() {
//		return content;
//	}
//
//	public void setContent(String content) {
//		this.content = content;
//	}

	public String getApplication() {
		return application;
	}

	public void setApplication(String application) {
		this.application = application;
	}
	
	@Override
	public String toString() {
		return "Vxml {Application = " + application + "}";
	}
	
}
