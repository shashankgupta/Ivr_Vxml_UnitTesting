//package com.ericsson.vxmlunit.Tests;
//
//import javax.swing.JOptionPane;
//import com.ericsson.vxmlunit.init.VXMLLoader;
//import com.ericsson.vxmlunit.interpreter.VXMLInterpreter;
//
//public class TestCase1 extends VXMLUnit {
//
//	@Override
//	protected void setUp() throws Exception {
//		
//		String address = JOptionPane.showInputDialog(null,"Location VXML");
//		interpreter = new VXMLInterpreter();
////		VXMLLoader loader = new VXMLLoader("//Users//Shank//Workspace//VXMLUnit//schema//Sample_copy.vxml");
//		VXMLLoader loader = new VXMLLoader(address, interpreter);
//		vxml = loader.getVxml();
//		
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
//			testSetForm("Sample_vxml");
//			testAssertAudio("121");
////			testAssertGoto("f1");
//			testAssertAudio("121");
//			testAssertAudio("121");
//			testAssertAudio("121");
//			testAssertPrompt("Hi!! my name is shashank.");
//			testAssertField("f1", "1");
//			testAssertAudio("121");
//			testAssertAudio("12");
//			testAssertAudio("121");
//			testAssertAudio("121");
////			testAssertAudio("GOTO 0");
////			testAssertAudio("Catch 1");
////			testAssertAudio("123456789");
////			testAssertPrompt("Hi!! my name is shashank.");
//			testAssertField("f2", "1");
//			testAssertAudio("121");
//			testAssertAudio("121");
//			testAssertAudio("121");
//			testAssertAudio("121");
////			checkNextItem(interpreter);
//		}
//		catch(Exception e)
//		{
//			e.printStackTrace();
//			fail("Something went wrong");
//		}
//	}
//		
//}
