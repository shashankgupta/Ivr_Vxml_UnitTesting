package com.ericsson.vxmlunit.vo;

import com.ericsson.vxmlunit.vo.base.NonFormItem;
import org.w3c.dom.Element;

public class Value extends NonFormItem{
	
	private String valueExp;
	
	public Value(Element element){
		valueExp = element.getAttribute("expr");
		setValueExp(valueExp);
		setName("value");
	}

	public String getValueExp() {
		return valueExp;
	}

	public void setValueExp(String valueExp) {
		this.valueExp = valueExp;
	}

}