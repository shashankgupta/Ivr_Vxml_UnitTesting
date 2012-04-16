package com.ericsson.vxmlunit.script;


import java.io.BufferedReader;
import java.io.DataInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;

import javax.script.Invocable;
import javax.script.ScriptEngine;
import javax.script.ScriptEngineManager;
import javax.script.ScriptException;
import javax.swing.JOptionPane;

import org.apache.commons.lang.StringEscapeUtils;

import com.ericsson.vxmlunit.exception.VXMLScriptException;
import com.ericsson.vxmlunit.vo.Throw;
import com.ericsson.vxmlunit.vo.Var;
import com.ericsson.vxmlunit.vo.Assign;
import com.ericsson.vxmlunit.vo.Field;
import com.ericsson.vxmlunit.vo.Script;
import com.ericsson.vxmlunit.vo.Subdialog;
import com.ericsson.vxmlunit.vo.Data;

public class ScriptUtil{
	
	private static ScriptEngineManager manager = new ScriptEngineManager();
	private static ScriptEngine engine = manager.getEngineByName("ECMAScript");
	static Invocable invoEngine = (Invocable)engine;
	
	/**
	 * checks the guard condition (true or false) if found true the flow goes to the child else skips the current item
	 * @param condition
	 * @return
	 */
	public static boolean evaluateGuardCondition(String condition) throws VXMLScriptException {
		Boolean result = true;
		
		if(condition != null && !condition.trim().equals("")) {
			
			try {
				String re = StringEscapeUtils.unescapeXml(condition);
				result = (Boolean) engine.eval(re);
//				System.out.println(re + "\t\t" + result);
			} catch (ScriptException e) {
				e.printStackTrace();
				throw new VXMLScriptException("Error while evaluating guard condition. Error is: " + e.getMessage());
			}
		}
		return result;
	}
	
	public static void executeAppVar() throws VXMLScriptException {
		try {
			engine.eval("var application = new Object();");
		} catch (ScriptException e) {
			e.printStackTrace();
		}
	}
	
	
	/**
	 * declares a variable with var tag attributes
	 * @param var
	 */
	public static void executeVar(Var var) throws VXMLScriptException {
		try {
			engine.eval("var " + var.getVarName() + " = " + var.getExpression());
			engine.eval("application." + var.getVarName() + " = " + var.getExpression());
			
		} catch (ScriptException e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * first eveluate the expression attribute of the assign tag and then assigns the computed value to the name attribute
	 * @param assi
	 */
	public static void executeAssign(Assign assi) throws VXMLScriptException {
		try{
			engine.eval(assi.getAssiExpr());
			engine.eval(assi.getAssignName() + " = " + assi.getAssiExpr());
		} catch (ScriptException e){
			e.printStackTrace();
		}
	}

	public static void executeAssignExt(String varName, String val) throws VXMLScriptException {
		try{
			engine.eval(varName + " = " + val);
		} catch (ScriptException e){
			e.printStackTrace();
		}
	}
	
	/**
	 * Declares a new variable with the field name and value received in val
	 * @param field
	 * @param val
	 */
	public static void executeField(Field field, String val) throws VXMLScriptException {
		try {
			engine.eval("var " + field.getFieldName() + " = " + val);
		} catch (ScriptException e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * Loads the script from script tag
	 * @param script
	 */
	
	public static void executeScript(String script) throws VXMLScriptException {
		try {
			engine.eval(script);
		} catch (ScriptException e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * creates a new subdialog tag object
	 * reads the text from the property file and assigns the new (subdialogName.<data read>)
	 * @param subdialog
	 */
	
	public static void executeSubd(Subdialog subdialog) throws VXMLScriptException {
		try {
			engine.eval("var " + subdialog.getSubName() + "= new Object();");
			String filename = JOptionPane.showInputDialog(null,"Property File" + subdialog.getSubName());
			  FileInputStream fstream = new FileInputStream("//Library//tomcat//webapps//vxmlscript//Properties//" + filename);
			  DataInputStream in = new DataInputStream(fstream);
			  BufferedReader br = new BufferedReader(new InputStreamReader(in));
			  String strLine;
			  while ((strLine = br.readLine()) != null)   {
				  engine.eval(subdialog.getSubName()+ "." +  strLine);
			  }
			  in.close();
		} catch (ScriptException e) {
			e.printStackTrace();
		}
		catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * creates a new data tag object
	 * reads the text from the property file and assigns the new (dataName.<data read>)
	 * @param data
	 */
	public static void executeData(Data data) throws VXMLScriptException {
		try {
			engine.eval("var " + data.getDataName() + "= new Object();");
			  FileInputStream fstream = new FileInputStream("//Users//Shank//Workspace//VXMLUnit//schema//property.txt");
			  DataInputStream in = new DataInputStream(fstream);
			  BufferedReader br = new BufferedReader(new InputStreamReader(in));
			  String strLine;
			  while ((strLine = br.readLine()) != null)   {
				  engine.eval(data.getDataName() + "." +  strLine);
			  }
			  in.close();
		} catch (ScriptException e) {
			e.printStackTrace();
		}
		catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public static void executeThrow(Throw thw) throws VXMLScriptException {
		String temp = "String t = new String();";
		try{
			engine.eval(temp);
		}
		catch(ScriptException e){
			e.printStackTrace();
		}
	}
	
	List<Integer> Rec = new ArrayList<Integer>();
	
	public static void retData(String f){
		List<Integer> Rec = new ArrayList<Integer>();
	    File file = new File("//Users//Shank//Workspace//VXMLUnit//schema//" + f);
	    
	    try {
	        Scanner scanner = new Scanner(file).useDelimiter(" ");

	        while (scanner.hasNextLine())
	        {
	            Rec.add(scanner.nextInt());
	        }
	        scanner.close();
	    }
	    catch (FileNotFoundException e)
	    {
	        e.printStackTrace();
	    }
	}
	
	public static String evaluateExpression(String expr) throws VXMLScriptException {
		String result = null;
		
		if(expr != null && !expr.trim().equals("")) {
			
			try {
				System.out.println(" expr = " + expr);
				if(engine.eval(expr) != null)
					result = engine.eval(expr).toString();
			} catch (ScriptException e) {
				e.printStackTrace();
			}
		}

		return result;
	}
	
	public static void printVar(String printVar) {
		try {
			System.out.println("Printing Variable...... \t" + printVar);
			engine.eval("print(" + printVar + ");");
		} catch (ScriptException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
}