package com.ericsson.vxmlunit.vo;

import org.w3c.dom.Element;

import com.ericsson.vxmlunit.vo.base.NonFormItem;

public class Prompt extends NonFormItem{
	
	private String timeout;
	private String inText;
	
	public Prompt(Element element) {
		
		timeout = element.getAttribute("timeout");
		if(timeout == null || timeout.equals("")) 
			setTimeout(element.getAttribute("expr"));
		else
			setTimeout(timeout);
		
		inText = element.getTextContent();
		setInText(inText);
		
		setName("prompt");
	}
	
	public String getTimeout() {
		return timeout;
	}

	public void setTimeout(String timeout) {
		this.timeout = timeout;
	}

	public String getInText() {
		return inText;
	}

	public void setInText(String inText) {
		this.inText = inText;
	}

	@Override
	public String toString() {
		return "Prompt {timeout = " + timeout + " :  Underlying Text  = " +  inText + "}";
	}
}
