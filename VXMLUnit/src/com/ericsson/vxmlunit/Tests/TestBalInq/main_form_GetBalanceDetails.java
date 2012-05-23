package com.ericsson.vxmlunit.Tests.TestBalInq;

import javax.swing.JOptionPane;

import org.junit.Assert;
import org.junit.Test;

import com.ericsson.vxmlunit.init.VXMLLoader;
import com.ericsson.vxmlunit.interpreter.VXMLInterpreter;

public class main_form_GetBalanceDetails extends VXMLUnit {

//	@Override
//	protected void setUp() throws Exception {
//		
//		String address = JOptionPane.showInputDialog(null,"File Address");
//		interpreter = new VXMLInterpreter();
////		VXMLLoader loader = new VXMLLoader("//Users//Shank//Workspace//VXMLUnit//schema//Sample_copy.vxml");
//		VXMLLoader loader = new VXMLLoader(address, interpreter);
//		vxml = loader.getVxml();
//		
//		interpreter.initializeScript(vxml);
//		interpreter.initializeVariables(vxml);
//		getGrammar();
//	}
//
//	@Override
//	protected void tearDown() throws Exception {
//		// TODO Auto-generated method stub
//		super.tearDown();
//	}
	
	
	
	@Test
	public void Test1() {
		try
		{
			testSetForm("main_form_GetBalanceDetails");
			// if cond="masterSubscriberFlag == 'true' || MUIOOfferId == 'NULL'" -- true
			testAssertGoto("#main_form_GetNormalBalanceDetails");
			
		}
		catch(Exception e)
		{
			e.printStackTrace();
			Assert.fail("Something went wrong");
		}
	}
	
	public void Test2() {
		try
		{
			testSetForm("main_form_GetBalanceDetails");
			// if cond="masterSubscriberFlag == 'true' || MUIOOfferId == 'NULL'" -- false
			testAssertSubdialog("balanceDetails");
			
		}
		catch(Exception e)
		{
			e.printStackTrace();
			Assert.fail("Something went wrong");
		}
	}
}