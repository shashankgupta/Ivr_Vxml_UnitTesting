package com.ericsson.vxmlunit.vo;

import org.w3c.dom.Element;

import com.ericsson.vxmlunit.vo.base.NonFormItem;

public class Else extends NonFormItem {

	//private String condition;
	public static final String NODE_NAME = "else";
	
	public Else(Element element) {
		//setCondition(element.getAttribute("cond"));
		setName("else");
	}

	@Override
	public String toString() {
		return "Else {" + "}";
	}
}
