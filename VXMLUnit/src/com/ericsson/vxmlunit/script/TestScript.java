package com.ericsson.vxmlunit.script;

import java.io.UnsupportedEncodingException;
import java.net.URL;
import java.net.URLEncoder;
import java.util.*; 
import javax.script.Invocable;
import javax.script.ScriptEngine;
import javax.script.ScriptEngineManager;
import javax.script.ScriptException;

public class TestScript {

	/**
	 * @param args
	 */

	private static ScriptEngineManager manager = new ScriptEngineManager();
	private static ScriptEngine engine = manager.getEngineByName("ECMAScript");
	static Invocable invoEngine = (Invocable)engine;

	public static void main(String[] args) {

		//		String test = "AnotherDocument.vxml#AnotherForm";
		//		int pos = test.indexOf("#");
		//		String uri = test.substring(0,pos);
		//		String searchFormItem = test.substring(pos+1);
		//		System.out.println(uri);
		//		System.out.println(searchFormItem);
		// TODO Auto-generated method stub


		////		  ScriptEngineManager mgr = new ScriptEngineManager();
		////		  ScriptEngine jsEngine = mgr.getEngineByName("ECMAScript");
		//		  try {
		//			  engine.eval("function getValue() { return undefined}");
		////			  System.out.println(jsEngine.eval("print('Hello, world!')"));
		//			  //System.out.println(jsEngine.eval("Var var = "));
		////			  System.out.println(jsEngine.eval("int result = 2"));
		////			  System.out.println(jsEngine.eval("2"));
		////			  jsEngine.eval("var v");
		//			  //System.out.println(jsEngine.eval("v = " + "prompt('Enter name');" ));
		//			  //System.out.println(jsEngine.eval("true").getClass());
		//		    System.out.println(evaluateExpression("undefined"));
		//		    
		//		  } catch (Exception ex) {
		//		      ex.printStackTrace();
		//		  }  
		//		
		////		  ScriptEngineManager mgr = new ScriptEngineManager();
		////		  List<ScriptEngineFactory> factories = mgr.getEngineFactories();
		////		  for(ScriptEngineFactory factory : factories) {
		////			  System.out.println(factory.getNames());
		////		  }


		//		   int syear = 2000;
		//		   int eyear = 2000;
		//		   int smonth = 2;//Feb
		//		   int emonth = 3;//Mar
		//		   int sday = 27;
		//		   int eday = 1;
		//		   Date startDate = new Date(syear-1900,smonth-1,sday);
		//		   Date endDate = new Date(eyear-1900,emonth-1,eday);
		//		   int difInDays = (int) ((endDate.getTime() - startDate.getTime())/(1000*60*60*24));
		//		   System.out.println(difInDays);
		Calendar cal1 = new GregorianCalendar(2012, 01, 26);
		Calendar cal2 = new GregorianCalendar(2012, 02, 05);
		System.out.println(daysBetween(cal1, cal2));

	}

	public static long daysBetween(Calendar sDate, Calendar eDate) {  
		Calendar d = (Calendar) sDate.clone();  
		long dBetween = 0;  
		while (d.before(eDate)) {  
			d.add(Calendar.DAY_OF_MONTH, 1);  
			dBetween++;  
		}  
		return dBetween;  
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


