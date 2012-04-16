package com.ericsson.vxmlunit.Tests.TestBalInq;

import javax.swing.JOptionPane;

import org.junit.After;
import org.junit.AfterClass;
import org.junit.Assert;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;

import com.ericsson.vxmlunit.init.VXMLLoader;
import com.ericsson.vxmlunit.interpreter.VXMLInterpreter;
import com.ericsson.vxmlunit.vo.gui.StartWindow;


public class MainFormBalanceEnquiry extends VXMLUnit {
	
	public static String filepath;
	
	public void setFilepath(String filepath) {
		this.filepath = filepath;
		System.out.println(filepath);
	}

	public String getFilepath() {
		return this.filepath;
	}

	@BeforeClass
	public static void runBeforeTest() throws Exception {

//		String address = JOptionPane.showInputDialog(null,"File Address");
		interpreter = new VXMLInterpreter();
//		VXMLLoader loader = new VXMLLoader("http://localhost:8080/vxmlscript/StandardVRefill.vxml", interpreter);
		VXMLLoader loader = new VXMLLoader("/Users/Shank/Desktop/bal.vxml", interpreter);
//		VXMLLoader loader = new VXMLLoader(address, interpreter);
//		VXMLLoader loader = new VXMLLoader(this.filepath, interpreter);
		vxml = loader.getVxml();

		interpreter.initializeScript(vxml);
		interpreter.initializeVariables(vxml);
		//		getGrammar();
	}

	@AfterClass
	public static void runAfterTest() throws Exception {
		
	}

	@Test
	public void formBalanceEnquiry() {
		try
		{
			testSetForm("form_BalanceEnquiry");
			testAssertGoto("#main_form_BalanceEnquiry");
		}
		catch(Exception e)
		{
			e.printStackTrace();
			Assert.fail("Something went wrong");
		}
	}	

	@Test
	public void main_BalanceEnquiry() {
		try
		{
			setVariables("application.counter_BalEnq", "10");
			setVariables("maxBalEnqAllowed", "10");

			testSetForm("main_form_BalanceEnquiry");
			// if cond="application.counter_BalEnq &gt; maxBalEnqAllowed || application.counter_BalEnq == maxBalEnqAllowed" -- True
			testAssertGoto("#handle_MaxAllowedBalEnqDone");
		}
		catch(Exception e)
		{
			e.printStackTrace();
			Assert.fail("Something went wrong");
		}
	}
	
	@Test
	public void counter_BalEnq_True() {
		try
		{
			setVariables("application.counter_BalEnq", "1");
			setVariables("maxBalEnqAllowed", "10");
			//			setVariables("chargingRequired", "true");
			//			setVariables("chargeConfirmationRequired", "false");

			testSetForm("main_form_BalanceEnquiry");
			// if cond="application.counter_BalEnq &gt; 0" -- True
			// assign name="chargingRequired" expr="'false'"
			// if cond="application.counter_BalEnq &gt; maxBalEnqAllowed || application.counter_BalEnq == maxBalEnqAllowed" -- False
			//testAssertAudio("returnAudioPath(promptsetId, subscriberLanguage, promptId, versionId, debug)");
			testAssertAudio("BAL_INTRO_MSG");
			testAssertGoto("#main_form_GetBalanceDetails");
		}
		catch(Exception e)
		{
			e.printStackTrace();
			Assert.fail("Something went wrong");
		}
	}
	
	@Test
	public void Test11() {
		try
		{
			setVariables("application.counter_BalEnq", "0");
			setVariables("maxBalEnqAllowed", "10");
			setVariables("chargingRequired", "'true'");
			setVariables("chargeConfirmationRequired", "false");

			testSetForm("main_form_BalanceEnquiry");
			// if cond="application.counter_BalEnq &gt; 0" -- False
			// if cond="application.counter_BalEnq &gt; maxBalEnqAllowed || application.counter_BalEnq == maxBalEnqAllowed" -- False
			// if cond="chargingRequired == 'true'"  -- True
			// if cond="chargeConfirmationRequired == 'true'"  -- True
			// if cond="chargeAnnouncementRequired == 'true'"  -- True
			testAssertAudio("BAL_INTRO_PRE_DEDUCT_MSG");
			testAssertGoto("#main_form_checkChargingMethod");

		}
		catch(Exception e)
		{
			e.printStackTrace();
			Assert.fail("Something went wrong");
		}
	}

	@Test
	public void Test12() {
		try
		{
			setVariables("application.counter_BalEnq", "0");
			setVariables("maxBalEnqAllowed", "10");
			setVariables("chargingRequired", "'true'");
			setVariables("chargeConfirmationRequired", "'true'");
			setVariables("chargeAnnouncementRequired", "false");

			testSetForm("main_form_BalanceEnquiry");
			// if cond="application.counter_BalEnq &gt; 0" -- False
			// if cond="application.counter_BalEnq &gt; maxBalEnqAllowed || application.counter_BalEnq == maxBalEnqAllowed" -- False
			// if cond="chargingRequired == 'true'"  -- True
			// if cond="chargeConfirmationRequired == 'true'"  -- True
			// if cond="chargeAnnouncementRequired == 'true'"  -- False
			testAssertAudio("BAL_INTRO_PRE_COMMIT_MSG");
			testAssertGoto("#main_form_ConfirmCharges");
		}
		catch(Exception e)
		{
			e.printStackTrace();
			Assert.fail("Something went wrong");
		}
	}

	/*	 if cond="application.counter_BalEnq &gt; 0" -- False
	 if cond="application.counter_BalEnq &gt; maxBalEnqAllowed || application.counter_BalEnq == maxBalEnqAllowed" -- False
	 if cond="chargingRequired == 'true'"  -- True
	 if cond="chargeConfirmationRequired == 'true'"  -- False	*/

	@Test
	public void Test13() {
		try
		{
			setVariables("application.counter_BalEnq", "0");
			setVariables("maxBalEnqAllowed", "10");
			setVariables("chargingRequired", "'true'");
			setVariables("chargeConfirmationRequired", "'true'");
			setVariables("chargeAnnouncementRequired", "'true'");

			testSetForm("main_form_BalanceEnquiry");
			testAssertAudio("BAL_INTRO_PRE_RESERVE_MSG");
			testAssertGoto("#main_form_checkChargingMethod");

		}
		catch(Exception e)
		{
			e.printStackTrace();
			Assert.fail("Something went wrong");
		}
	}
}