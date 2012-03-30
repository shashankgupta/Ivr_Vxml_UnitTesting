//package com.ericsson.vxmlunit.Tests;
//
//
//import com.ericsson.vxmlunit.init.VXMLLoader;
//import com.ericsson.vxmlunit.interpreter.VXMLInterpreter;
//
//
//public class TestCase2 extends VXMLUnit {
//
////	public TestCase1(VXMLInterpreter interpreter) {
////		super(interpreter);
////		// TODO Auto-generated constructor stub
////	}
//
//	@Override
//	protected void setUp() throws Exception {
//		
//		VXMLLoader loader = new VXMLLoader("//Users//Shank//Workspace//VXMLUnit//schema//Sample_dia.vxml", null);
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
//	public void testSampleVxml1() {
//		try{
//			testSetForm("D1");
//			testAssertSubdialog("SubD1");
//			testAssertAudio("SubDialog");
//			testAssertAudio("WORKING!!!!");
//		}
//		catch(Exception e){
//			fail("Unsucessfull");
//		}
//	}
//}
