package com.ericsson.vxmlunit.vo;

import org.w3c.dom.Element;

import com.ericsson.vxmlunit.vo.base.NonFormItem;

public class Property extends NonFormItem{

	public Property(Element element) {
		
		setName("property");
	}
}
