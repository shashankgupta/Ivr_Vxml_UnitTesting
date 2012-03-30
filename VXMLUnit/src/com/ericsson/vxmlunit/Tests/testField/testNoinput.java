package com.ericsson.vxmlunit.Tests.testField;

import com.ericsson.vxmlunit.init.VXMLLoader;
import com.ericsson.vxmlunit.interpreter.VXMLInterpreter;

public class testNoinput extends VXMLUnit {

	@Override
	protected void setUp() throws Exception {
		
		VXMLLoader loader = new VXMLLoader("//Users//Shank//Workspace//VXMLUnit//schema//Sample_copy.vxml", null);
		
		vxml = loader.getVxml();
		interpreter = new VXMLInterpreter();
		interpreter.initializeScript(vxml);
		interpreter.initializeVariables(vxml);
		
	}

	@Override
	protected void tearDown() throws Exception {
		// TODO Auto-generated method stub
		super.tearDown();
	}
	
	public void testSampleVxml() {
		try
		{
			getGrammar();
			testSetForm("Sample_vxml");
			testAssertAudio("GOTO 0");
			testAssertAudio("Catch 1");
			testAssertAudio("123456789");
			testAssertPrompt("Hi!! my name is shashank.");
			testAssertField("f1", null);
			testAssertAudio("Inside Field");
			testAssertAudio("Inside Field 1");
			testAssertAudio("Inside noinput");
			testAssertField("f2", "1");
			testAssertAudio("Inside Field");
			testAssertAudio("Inside Field 1");
			testAssertAudio("Inside Filled111");
			testAssertAudio("Inside Filled222");
			
		}
		catch(Exception e)
		{
			e.printStackTrace();
			fail("Something went wrong!!!");
		}
	}
}
