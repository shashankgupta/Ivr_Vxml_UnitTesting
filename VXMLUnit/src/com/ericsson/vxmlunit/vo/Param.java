package com.ericsson.vxmlunit.vo;

import org.w3c.dom.Element;

import com.ericsson.vxmlunit.vo.base.NonFormItem;

public class Param extends NonFormItem{

	public Param(Element element) {
		
		setName("param");
	}
}

