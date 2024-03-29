package com.ericsson.vxmlunit.Tests;

import java.io.File;
import java.io.FileNotFoundException;
import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;

import org.junit.Assert;

import junit.framework.TestCase;
import com.ericsson.vxmlunit.exception.VXMLException;
import com.ericsson.vxmlunit.exception.VXMLScriptException;
import com.ericsson.vxmlunit.interpreter.VXMLInterpreter;
import com.ericsson.vxmlunit.script.ScriptUtil;
import com.ericsson.vxmlunit.vo.Audio;
import com.ericsson.vxmlunit.vo.Data;
import com.ericsson.vxmlunit.vo.Field;
import com.ericsson.vxmlunit.vo.Form;
import com.ericsson.vxmlunit.vo.Goto;
import com.ericsson.vxmlunit.vo.Prompt;
import com.ericsson.vxmlunit.vo.Subdialog;
import com.ericsson.vxmlunit.vo.Vxml;
import com.ericsson.vxmlunit.vo.base.AbstractBaseItem;

public class VXMLUnit {

	protected VXMLInterpreter interpreter;
	protected Vxml vxml;
	protected List<String> grammar = new ArrayList<String>();

	public void testSetForm(String formId) {

		Form form = null;
		List<AbstractBaseItem> children = vxml.getChildren();
		for(AbstractBaseItem child : children) {
			if(child.getName().equals("form")) {

				form = (Form) child;
				if(form.getId().equals(formId)) {
					interpreter.initializeForm(form);	
					break;
				}
			}

		}	
	}

	public void checkEndTest() throws VXMLException{
		AbstractBaseItem item;
		try{
			item = interpreter.getNextItem();
			if(item != null){

			}
		} catch(VXMLException e){
			throw new VXMLException("Test Case end exception");
		}
	}

	public void testAssertAudio(String prompt) throws VXMLScriptException {

		AbstractBaseItem item;
		try {
			item = interpreter.getNextItem();
			if(item instanceof Audio){
				String firstKey = ((Audio) item).getDataMap().firstKey();
				String value = ((Audio) item).getDataMap().get(firstKey);
				if(firstKey.equals("src")){
					// use index of
					Assert.assertTrue("Audio SRC Expected = " + prompt + " and Audio received = " + value, value.contains(prompt));
				} else if(firstKey.equals("expr")) {
					String eval = ScriptUtil.evaluateExpression(value);
					Assert.assertTrue("Audio EXPR Expected = " + prompt + " and Audio received = " + eval, eval.contains(prompt));
				}


			}
			else {
				Assert.fail("Expected Audio = '" + prompt + "' and received Audio prompt = " + item);
			}	
		} catch (VXMLException e) {
			Assert.fail("Exception occured: " + e.getMessage());
		}
	}

	public void testAssertPrompt(String prompt) {

		AbstractBaseItem item;
		try {
			item = interpreter.getNextItem();
			if(item instanceof Prompt){
				Assert.assertTrue("Prompt = " + prompt, ((Prompt) item).getInText().contains(prompt));
			}
			else {
				Assert.fail("Unsucessfull at Prompt Current Item is " + item);
			}
		} catch (VXMLException e) {
			Assert.fail("Exception occured: " + e.getMessage());
		}

	}

	public void testAssertGoto(String prompt) {

		AbstractBaseItem item;
		try {
			item = interpreter.getNextItem();
			if(item instanceof Goto){
				String firstKey = ((Goto) item).getDataMap().firstKey();
				String value = ((Goto) item).getDataMap().get(firstKey);
				if(firstKey.equals("next")){
					Assert.assertTrue("Goto next Expected = " + prompt + " and Goto received = " + value, value.equals(prompt));
				} else if(firstKey.equals("nextitem")) {
					Assert.assertTrue("Goto nextitem Expected = " + prompt + " and Goto received = " + value, value.equals(prompt));
				}
			}
			else {
				Assert.fail("Expected Goto = '" + prompt + "' and received Goto = " + item);
			}
		} catch (VXMLException e) {
			Assert.fail("Exception occured: " + e.getMessage());
		}

	}

	public void testAssertSubdialog(String subdialogName){
		AbstractBaseItem item;
		try {
			item = interpreter.getNextItem();
			if(item instanceof Subdialog){
				Subdialog subdialog = (Subdialog) item;
				Assert.assertTrue(subdialog.checkStatus());
				ScriptUtil.executeSubd(subdialog);
				Assert.assertEquals(subdialogName, subdialog.getSubName());
			}
			else{
				Assert.fail("Unsucessfull at Subdialog Current Item is " + item);
			}
		} catch (VXMLException e) {
			Assert.fail("Exception occured: " + e.getMessage());
		} catch (VXMLScriptException e) {
			Assert.fail("Script Exception occured: " + e.getMessage());
		}

	}

	public void testAssertData(String dataName){
		AbstractBaseItem item;
		try {
			item = interpreter.getNextItem();
			if(item instanceof Data){
				Data data = (Data) item;
				ScriptUtil.executeData(data);
				Assert.assertEquals(dataName, "Data_tag");
				Assert.assertTrue(data.checkStatus());
			}
			else{
				Assert.fail("Unsucessfull at Data Current Item is " + item);
			}
		} catch (VXMLException e) {
			Assert.fail("Exception occured: " + e.getMessage());
		} catch (VXMLScriptException e) {
			Assert.fail("Script Exception occured: " + e.getMessage());
		}

	}


	public void testAssertField(String fieldName, String val){

		AbstractBaseItem item;
		try {
			item = interpreter.getNextItem();
			if(item instanceof Field) {
				Field field = (Field) item;

				// set field value when val is matched with grammer
				// field.setValue(val);
				// goto no match input

				if(val == null){
					if(field.getFilled() != null)
						field.getFilled().setMatchedValue(null);
					//						field.setStatus("noinput");
					interpreter.setEvent("noinput");

				} else {
					if(grammar.contains(val)) {
						//field.setValue(val);
						if(field.getFilled() != null)
							field.getFilled().setMatchedValue(val);
						//							field.setStatus("filled");
						interpreter.setEvent("filled");
						ScriptUtil.executeField(field, val);
					}
					else {
						if(field.getFilled() != null)
							field.getFilled().setMatchedValue(null);
						//							field.setStatus("nomatch");
						interpreter.setEvent("nomatch");
					}

				}


				Assert.assertEquals(fieldName, ((Field) item).getFieldName());
			}
			else{
				Assert.fail("Not received the expected field item: " + item);
			}
		} catch (VXMLException e) {
			Assert.fail("Exception occured: " + e.getMessage());
		} catch (VXMLScriptException e) {
			Assert.fail("Script Exception occured: " + e.getMessage());
		}


	}

	public void getGrammar(){

		File gramFile = new File("//Users//Shank//Workspace//VXMLUnit//schema//grammar//grammar");

		try {
			Scanner scanner = new Scanner(gramFile).useDelimiter(",");

			while (scanner.hasNextLine())
			{
				grammar.add((String) scanner.next());
			}
		}
		catch (FileNotFoundException e)
		{
			e.printStackTrace();
		}
	}

	public void setVariables(String varName, String val) throws VXMLScriptException{
		ScriptUtil.executeAssignExt(varName,val);
	}
}
