package com.ericsson.vxmlunit.vo;

import org.w3c.dom.Element;
import com.ericsson.vxmlunit.vo.base.AbstractBaseItem;

public class Form extends AbstractBaseItem {

	private String id;

	public Form(Element element) {
		setId(element.getAttribute("id"));
		setName("form");

	}
	
	@Override
	public void setCatchStack() {
		catchStack = getParent().getCatchStack();
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	@Override
	public String toString() {
		return "FORM {" + id + "}";
	}
	
	
}
