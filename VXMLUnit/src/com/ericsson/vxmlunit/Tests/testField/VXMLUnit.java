package com.ericsson.vxmlunit.Tests.testField;

import java.io.File;
import java.io.FileNotFoundException;
import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;

import junit.framework.TestCase;

import com.ericsson.vxmlunit.exception.VXMLException;
import com.ericsson.vxmlunit.exception.VXMLScriptException;
import com.ericsson.vxmlunit.interpreter.VXMLInterpreter;
import com.ericsson.vxmlunit.script.ScriptUtil;
import com.ericsson.vxmlunit.vo.Audio;
import com.ericsson.vxmlunit.vo.Data;
import com.ericsson.vxmlunit.vo.Field;
import com.ericsson.vxmlunit.vo.Form;
import com.ericsson.vxmlunit.vo.Prompt;
import com.ericsson.vxmlunit.vo.Subdialog;
import com.ericsson.vxmlunit.vo.Vxml;
import com.ericsson.vxmlunit.vo.base.AbstractBaseItem;

public class VXMLUnit extends TestCase{

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
	
	
	public void testAssertAudio(String prompt) {

		AbstractBaseItem item;
		try {
			item = interpreter.getNextItem();
			if(item instanceof Audio){
				
				assertTrue("Audio Expected = " + prompt + " and Audio received = " + ((Audio) item).getExpr(), ((Audio) item).getExpr().equals(prompt));
			}
			else {
				fail("Expected Audio = '" + prompt + "' and received Audio prompt = " + item);
			}	
		} catch (VXMLException e) {
			fail("Exception occured: " + e.getMessage());
		}
	}
	
	public void testAssertPrompt(String prompt) {

		AbstractBaseItem item;
		try {
			item = interpreter.getNextItem();
			if(item instanceof Prompt){
				assertTrue("Prompt = " + prompt, ((Prompt) item).getInText().contains(prompt));
			}
			else {
				fail("Unsucessfull at Prompt Current Item is " + item);
			}
		} catch (VXMLException e) {
			fail("Exception occured: " + e.getMessage());
		}
			
	}

	public void testAssertSubdialog(String subdialogName){
		AbstractBaseItem item;
		try {
			item = interpreter.getNextItem();
			if(item instanceof Subdialog){
				Subdialog subdialog = (Subdialog) item;
				ScriptUtil.executeSubd(subdialog);
				assertEquals(subdialogName, subdialog.getSubName());
				assertTrue(subdialog.checkStatus());
			}
			else{
				fail("Unsucessfull at Subdialog Current Item is " + item);
			}
		} catch (VXMLException e) {
			fail("Exception occured: " + e.getMessage());
		} catch (VXMLScriptException e) {
			fail("Script Exception occured: " + e.getMessage());
		}
		
	}
	
	public void testAssertData(String dataName){
		AbstractBaseItem item;
		try {
			item = interpreter.getNextItem();
			if(item instanceof Data){
				Data data = (Data) item;
				ScriptUtil.executeData(data);
				assertEquals(dataName, "Data_tag");
				assertTrue(data.checkStatus());
			}
			else{
				fail("Unsucessfull at Data Current Item is " + item);
			}
		} catch (VXMLException e) {
			fail("Exception occured: " + e.getMessage());
		} catch (VXMLScriptException e) {
			fail("Script Exception occured: " + e.getMessage());
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

				
				assertEquals(fieldName, ((Field) item).getFieldName());
			}
			else{
				fail("Not received the expected field item: " + item);
			}
		} catch (VXMLException e) {
			fail("Exception occured: " + e.getMessage());
		} catch (VXMLScriptException e) {
			fail("Script Exception occured: " + e.getMessage());
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
	
	
}
