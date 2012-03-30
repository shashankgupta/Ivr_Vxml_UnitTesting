package com.ericsson.vxmlunit.vo;

import java.util.ArrayList;
import java.util.List;
import java.util.TreeMap;

import org.w3c.dom.Element;

import com.ericsson.vxmlunit.exception.VXMLException;
import com.ericsson.vxmlunit.exception.VXMLScriptException;
import com.ericsson.vxmlunit.script.ScriptUtil;
import com.ericsson.vxmlunit.vo.base.NonFormItem;

public class Audio extends NonFormItem {

	private String src;
	private String expr;
	protected List<Audio> listaudio = new ArrayList<Audio>();
	private TreeMap<String, String> dataMap;

	private static final String KEY_SRC = "src";
	private static final String KEY_EXPR = "expr";

	public Audio(Element element) throws VXMLException {
		dataMap = new TreeMap<String, String>();

		String src = element.getAttribute("src");
		String expr = element.getAttribute("expr");
		
		

			if(src != null && src.trim().length() > 0){
				dataMap.put(KEY_SRC, src);
			}
			if(expr != null && expr.trim().length() > 0){
				dataMap.put(KEY_EXPR, expr);
			}
			

		if(dataMap.size() != 1) {
			throw new VXMLException("<audio> error: Both src & expr cannot be spicified together");
		}

		setName("audio");
	}

	public String getSrc() {
		return src;
	}

	public void setSrc(String src) {
		this.src = src;
	}

	public String getExpr() {
		return expr;
	}

	public void setExpr(String expr) {
		this.expr = expr;
	}


	public TreeMap<String, String> getDataMap() {
		return dataMap;
	}

	@Override
	public String toString() {
		return "AUDIO {src = " + src + " : expr = " + expr + "}";
	}
}
