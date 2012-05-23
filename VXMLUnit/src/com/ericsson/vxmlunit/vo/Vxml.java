package com.ericsson.vxmlunit.vo;

import java.util.PriorityQueue;

import com.ericsson.vxmlunit.init.VXMLLoader;
import com.ericsson.vxmlunit.vo.base.AbstractBaseItem;
import com.ericsson.vxmlunit.vo.base.SortedStack;
import org.w3c.dom.Element;


public class Vxml extends AbstractBaseItem {

	public String application;
	public String content;
	public String Urlprefix;

	public Vxml(Element element) {
		application = element.getAttribute("application");
		setName("vxml");
		
		catchStack = new PriorityQueue<Catch>();
	}

	public String getApplication() {
		return getUrlprefix() + application;
	}

	public void setApplication(String application) {
		this.application = application;
	}
	
	public String getUrlprefix() {
		return Urlprefix;
	}

	public void setUrlprefix(String urlprefix) {
		Urlprefix = urlprefix;
	}
	@Override
	public String toString() {
		return "Vxml {Application = " + application + "}";
	}
	
}
