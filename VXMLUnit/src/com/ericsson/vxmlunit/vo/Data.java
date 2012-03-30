package com.ericsson.vxmlunit.vo;

import java.io.File;
import java.util.TreeMap;

import org.w3c.dom.Element;

import com.ericsson.vxmlunit.exception.VXMLException;
import com.ericsson.vxmlunit.exception.VXMLScriptException;
import com.ericsson.vxmlunit.interpreter.VXMLInterpreter;
import com.ericsson.vxmlunit.script.ScriptUtil;
import com.ericsson.vxmlunit.vo.base.AbstractBaseItem;
import com.ericsson.vxmlunit.vo.base.NonFormItem;

public class Data extends NonFormItem{
	private String dataName;
	private String method;
	private String srcexpr;
	private String src;

	private TreeMap<String, String> dataMap;

	private static final String KEY_SRC = "src";
	private static final String KEY_SRCEXPR = "srcexpr";

	public Data(Element element) throws VXMLException{
		dataMap = new TreeMap<String, String>();
		
		dataName = element.getAttribute("name");
		src = element.getAttribute("src");
		srcexpr = element.getAttribute("srcexpr");
		method = element.getAttribute("method");

		if (dataName.equals("") || dataName == null)
			setDataName("Data1");
		else
			setDataName(dataName);


		if (method.equals("") || method == null)
			setMethod("GET");
		else
			setDataName("POST");

		if(src != null && src.trim().length() > 0){
			dataMap.put(KEY_SRC, src);
		}
		if(srcexpr != null && srcexpr.trim().length() > 0){
			dataMap.put(KEY_SRCEXPR, srcexpr);
		}


		if(dataMap.size() != 1) {
			throw new VXMLException("<audio> error: Both src & srcexpr cannot be spicified together");
		}

		setName("data");
	}

	public String getDataName() {
		return dataName;
	}

	public void setDataName(String dataName) {
		this.dataName = dataName;
	}

	public String getMethod() {
		return method;
	}

	public void setMethod(String method) {
		this.method = method;
	}

	public String getSrcexpr() {
		return srcexpr;
	}

	public void setSrcexpr(String srcexpr) {
		this.srcexpr = srcexpr;
	}

	public boolean checkStatus(){
		boolean checkStatus;
		File f = new File(getSrcexpr());
		if(f.exists()){
			checkStatus = true;
		}
		else{
			checkStatus = false;
		}
		return(checkStatus);
	}

	@Override
	public AbstractBaseItem execute(VXMLInterpreter interpreter) throws VXMLException {
		try {
			ScriptUtil.executeData(this);
		} catch (VXMLScriptException e) {
			e.printStackTrace();
		}

		String firstKey = dataMap.firstKey();
		try{
			String value = dataMap.get(firstKey);
			if(firstKey.equals(KEY_SRC)){
				ScriptUtil.executeData(this);

			} else if(firstKey.equals(KEY_SRCEXPR)) {

				String eval = ScriptUtil.evaluateExpression(value);
				setSrcexpr(eval);
				ScriptUtil.executeScript(eval);
			}



		} catch (VXMLScriptException e) {
			throw new VXMLException("Error while evaluating expr. Error is: " + e.getMessage());
		}

		return super.skip(interpreter);
	}

	public TreeMap<String, String> getDataMap() {
		return dataMap;
	}

	@Override
	public String toString() {
		return "Data {Name = " + dataName + " : Method = " + method + " Source Expression = " + srcexpr + " Valid URI : " + this.checkStatus() + "}";
	}
}
