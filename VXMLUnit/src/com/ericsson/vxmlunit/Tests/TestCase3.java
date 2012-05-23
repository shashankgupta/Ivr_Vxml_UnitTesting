//package com.ericsson.vxmlunit.Tests;
//
//import com.ericsson.vxmlunit.init.VXMLLoader;
//import com.ericsson.vxmlunit.interpreter.VXMLInterpreter;
//
//
//public class TestCase3 extends VXMLUnit {
//
//	@Override
//	protected void setUp() throws Exception {
//		
//		VXMLLoader loader = new VXMLLoader("//Users//Shank//Workspace//VXMLUnit//schema//Sample_copy.vxml", null);
//		
//		vxml = loader.getVxml();
//		interpreter = new VXMLInterpreter();
//		interpreter.initializeScript(vxml);
//		interpreter.initializeVariables(vxml);
//		
//	}
//
//	@Override
//	protected void tearDown() throws Exception {
//		// TODO Auto-generated method stub
//		super.tearDown();
//	}
//	
//	public void testSampleVxml() {
//		try
//		{
//			getGrammar();
//			testSetForm("Sample_vxml1");
////			testAssertData("Data_tag");
//			testAssertAudio("GOTO 0");
//			testAssertAudio("If part");
//			testAssertPrompt("Hi!! my name is shashank.");
////			testAssertAudio("formCatch0");
////			testAssertField("f1", "1");
////			testAssertAudio("Inside Field");
////			testAssertAudio("Inside Field");
////			testAssertAudio("fieldCatch");
////			testAssertAudio("Second");
////			testAssertAudio("Nested IF executed Level 2");
////			testAssertAudio("Nested IF executed Level 3");
////			testAssertAudio("Nested IF executed Level 4");
//			
//		}
//		catch(Exception e)
//		{
//			fail("Unsucessfull");
//		}
//	}
//}
