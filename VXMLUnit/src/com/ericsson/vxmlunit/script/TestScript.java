package com.ericsson.vxmlunit.script;

import javax.script.Invocable;
import javax.script.ScriptEngine;
import javax.script.ScriptEngineManager;
import javax.script.ScriptException;

import org.apache.commons.lang.StringEscapeUtils;

import com.ericsson.vxmlunit.exception.VXMLScriptException;

public class TestScript {

	/**
	 * @param args
	 */

	private static ScriptEngineManager manager = new ScriptEngineManager();
	private static ScriptEngine engine = manager.getEngineByName("ECMAScript");
	static Invocable invoEngine = (Invocable) engine;

	public static void main(String[] args) {
		try {
			try {
				
				engine.eval("var a = '123456789'");
				
				
			} catch (ScriptException e) {
				// TODO aAuto-generated catch block
				e.printStackTrace();
			}
			Boolean result = evaluateGuardCondition("a.length >= 9");
			System.out.println(result);
			engine.eval("print(a);");
			
		} catch (VXMLScriptException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (ScriptException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

public static boolean evaluateGuardCondition(String condition) throws VXMLScriptException {
	Boolean result = true;
	
	if(condition != null && !condition.trim().equals("")) {
		
		try {
			String re = StringEscapeUtils.unescapeXml(condition);
			System.out.println(re);
			result = (Boolean) engine.eval(re);
			
		} catch (ScriptException e) {
			e.printStackTrace();
			throw new VXMLScriptException("Error while evaluating guard condition. Error is: " + e.getMessage());
		}
	}
	return result;
}

}
//	public static String evaluateExpression(String expr) {
//		String result = "undefined";
//		
//		if(expr != null && !expr.trim().equals("")) {
//			
//			try {
//				result = (String) engine.eval(expr);
//			} catch (ScriptException e) {
//				e.printStackTrace();
//			}
//		}
//
//		return result;
//	}


