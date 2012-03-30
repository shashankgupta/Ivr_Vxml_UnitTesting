package com.ericsson.vxmlunit.vo;

import org.w3c.dom.Element;

import com.ericsson.vxmlunit.exception.VXMLException;
import com.ericsson.vxmlunit.exception.VXMLScriptException;
import com.ericsson.vxmlunit.interpreter.VXMLInterpreter;
import com.ericsson.vxmlunit.script.ScriptUtil;
import com.ericsson.vxmlunit.vo.base.AbstractBaseItem;
import com.ericsson.vxmlunit.vo.base.FormItem;

import java.io.BufferedReader;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.TreeMap;

public class Subdialog extends FormItem{

	private String subName;
	private String src;
	private String subSrcExpr;
	private Filled filled;

	private TreeMap<String, String> dataMap;

	private static final String KEY_SRC = "src";
	private static final String KEY_SRCEXPR = "srcexpr";

	public Subdialog(Element element) throws VXMLException {
		dataMap = new TreeMap<String, String>();
		
		subName = element.getAttribute("name");
		src = element.getAttribute("src");
		subSrcExpr = element.getAttribute("srcexpr");
		setGuardCondition(element.getAttribute("cond"));

		if(subName == null || subName.equals(""))
			setName("SubDialog");
		else
			setSubName(subName);



		if(src != null && src.trim().length() > 0){
			dataMap.put(KEY_SRC, src);
			setSrc(src);
		}

		if(subSrcExpr != null && subSrcExpr.length() > 0){
			dataMap.put(KEY_SRCEXPR, subSrcExpr);
			setSubSrcExpr(subSrcExpr);
		}

		if(dataMap.size() != 1) {
			throw new VXMLException("<subdialog> error: More than one of src, srcexpr found");
		}

		setName("subdialog");
	}

	public String getSrc() {
		return src;
	}

	public void setSrc(String src) {
		this.src = src;
	}

	public Filled getFilled() {
		return filled;
	}

	public void setFilled(Filled filled) {
		this.filled = filled;
	}

	public String getSubName() {
		return subName;
	}

	public void setSubName(String subName) {
		this.subName = subName;
	}

	public String getSubSrcExpr() {
		return subSrcExpr;
	}

	public void setSubSrcExpr(String subSrcExpr) {
		this.subSrcExpr = subSrcExpr;
	}

	public boolean checkStatus() throws VXMLException{

		boolean result = false;
		try{

			String eval = ScriptUtil.evaluateExpression(KEY_SRCEXPR);
			URL url = new URL(eval);
			InputStream input = url.openStream();
			result = true;

		} catch(VXMLScriptException e) {
			throw new VXMLException("Error in hitting URL at Subdialog" + e.getMessage());
		} catch (MalformedURLException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}

		return result;
	}

	@Override
	public AbstractBaseItem execute(VXMLInterpreter interpreter) throws VXMLException {

		AbstractBaseItem nextItem = null;
		try{
			if(isVisited()) {
				nextItem = super.skip(interpreter);
			} else {
				//			interpreter.setCurrentItem(interpreter.getCurrentItem().getFirstChild());
				//			nextItem = interpreter.getNextItem();
				//				interpreter.setCurrentItem(this);
				//				interpreter.setCurrentItem(this);
				//				nextItem = interpreter.getCurrentItem().getFirstChild();
				nextItem = super.execute(interpreter);

			}
		}catch(VXMLScriptException e){
			e.printStackTrace();
		}

		return nextItem;
	}

	@Override
	public String toString() {
		return "SubDialog {name = " + subName + " : SrcExpr = " + expr + " : cond = " + guardcondition + "}";
	}	
}

