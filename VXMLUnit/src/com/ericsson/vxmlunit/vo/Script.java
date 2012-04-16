package com.ericsson.vxmlunit.vo;

import java.util.TreeMap;

import org.w3c.dom.Element;

import com.ericsson.vxmlunit.exception.VXMLException;
import com.ericsson.vxmlunit.exception.VXMLScriptException;
import com.ericsson.vxmlunit.interpreter.VXMLInterpreter;
import com.ericsson.vxmlunit.script.ScriptUtil;
import com.ericsson.vxmlunit.vo.base.AbstractBaseItem;
import com.ericsson.vxmlunit.vo.base.NonFormItem;

public class Script extends NonFormItem{
	
	private String scriptSrc;
	private String scriptSrcexpr;
	private String scriptInline;
	private String scriptLoader;
	
	private TreeMap<String, String> dataMap;
	
	private static final String KEY_SRC = "src";
	private static final String KEY_SRCEXPR = "srcExpr";
	private static final String KEY_INLINE = "inline";
	
	public Script(Element element) throws VXMLException {
		
		dataMap = new TreeMap<String, String>();
		
		scriptSrc = element.getAttribute("src");
		scriptSrcexpr = element.getAttribute("srcexpr");
		scriptInline = element.getTextContent();
		
		if(scriptSrc != null && scriptSrc.trim().length() > 0)
			dataMap.put(KEY_SRC, scriptSrc);
		
		if(scriptSrcexpr != null && scriptSrcexpr.trim().length() > 0)
			dataMap.put(KEY_SRCEXPR, scriptSrcexpr);
		
		if(scriptInline != null && scriptInline.trim().length() > 0) {
			dataMap.put(KEY_INLINE, scriptInline.trim());
		}
			
		if(dataMap.size() != 1) {
			throw new VXMLException("<script> error: More than one of src, srcexpr, and inline script found");
		}
		
		
		
//		NamedNodeMap map = element.getAttributes();
//		
//		int length  = map.getLength();
//		String[] attribs = new String[length];
//		for ( int i=0 ; i<length ; i++)
//		{
//			Node node = map.item(i);
//			
//			attribs[i] = node.getNodeValue();
//			System.out.println(attribs[i] + "attributes list");
//		}
		
//		 do check that only one of the attributes is exe
		
//		setScriptLoader(scriptLoader);
//		setScriptLoader(scriptSrc);
	
		setName("script");
	}
	
	
//	public String getContentUrl(String scriptSrc){
//		StringBuilder content = new StringBuilder();
//		
//		try {
//
//			URL url = new URL(scriptSrc);
//			BufferedReader in = new BufferedReader(new InputStreamReader(url.openStream()));
//			String inputLine;
//			while ((inputLine = in.readLine()) != null){
//				content.append(inputLine);
//				content.append("\n");
//			}
//			in.close();
//
//		} catch (MalformedURLException e) {
//			e.printStackTrace();
//		} catch (IOException e){
//			e.printStackTrace();
//		}
//		
//		return content.toString();
//	}
	
	public void setScriptLoader(String scriptLoader) {
		this.scriptLoader = scriptLoader;
	}

	public String getScriptLoader() {
		return scriptLoader;
	}

	public String getScriptSrcexpr() {
		return scriptSrcexpr;
	}

	public void setScriptSrcexpr(String scriptSrcexpr) {
		this.scriptSrcexpr = scriptSrcexpr;
	}

	public String getScriptInline() {
		return scriptInline;
	}

	public void setScriptInline(String scriptInline) {
		this.scriptInline = scriptInline;
	}

	public String getScriptSrc() {
		return scriptSrc;
	}

	public void setScriptSrc(String scriptSrc) {
		this.scriptSrc = scriptSrc;
	}

	public void execute() throws VXMLException {
		executeScript(null);
	}
	
	@Override
	public AbstractBaseItem execute(VXMLInterpreter interpreter) throws VXMLException {
		executeScript(interpreter);
		return super.execute(interpreter);
	}


	private void executeScript(VXMLInterpreter interpreter)
			throws VXMLException {
		AbstractBaseItem nextItem = null;
		
		String firstKey = dataMap.firstKey();
		try{
			String value = dataMap.get(firstKey);
				if(firstKey.equals(KEY_INLINE)){
					ScriptUtil.executeScript(value);
//					setScriptLoader(value);
					
				} else if(firstKey.equals(KEY_SRCEXPR)) {
					
					String eval = ScriptUtil.evaluateExpression(value);
					String content = getContentUrl(eval);
					ScriptUtil.executeScript(content);
//					setScriptLoader(content);
					
				} else if(firstKey.equals(KEY_SRC)) {
					
					String content = getContentUrl(value);
					ScriptUtil.executeScript(content);
//					setScriptLoader(content);
					
				} 
			
//				nextItem = super.skip(interpreter);
				if(interpreter != null)
					interpreter.setCurrentItem(this);
				

		} catch (VXMLScriptException e) {
			throw new VXMLException("Error while evaluating expr. Error is: " + e.getMessage());
		}
	}

	
}
