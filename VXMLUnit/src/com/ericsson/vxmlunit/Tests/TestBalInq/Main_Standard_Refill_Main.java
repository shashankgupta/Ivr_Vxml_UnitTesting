package com.ericsson.vxmlunit.Tests.TestBalInq;


import org.junit.After;
import org.junit.AfterClass;
import org.junit.Assert;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;

import com.ericsson.vxmlunit.exception.VXMLException;
import com.ericsson.vxmlunit.init.VXMLLoader;
import com.ericsson.vxmlunit.interpreter.VXMLInterpreter;
import com.ericsson.vxmlunit.script.ScriptUtil;
import com.sun.org.apache.xalan.internal.xsltc.compiler.util.TestGenerator;



public class Main_Standard_Refill_Main extends VXMLUnit {

	@BeforeClass
	public static void runBeforeTest() throws Exception {

		//		String address = JOptionPane.showInputDialog(null,"File Address");
		loadVXML("StandardVoucherRefill");
		//		getGrammar();
	}

//	@After
//	public void runAfterTest() throws Exception {
//		checkEndTest();
//	}


	public void start() {
		try
		{

			testSetForm("main_standard_refill_main");
		}
		catch(Exception e)
		{
			e.printStackTrace();
			Assert.fail("Something went wrong");
		}
	}

	@Test
	public void block_fastRefill_block_voucherNumber1() {
		try
		{
			// Block cond
			setVariables("fastRefillEnabled", "'true'");
			setVariables("fastRefillVoucherNumber", "''");
			setVariables("retryCount", "4");
			setVariables("allowedRefillRetry", "3");

			testSetForm("main_standard_refill_main");
			testAssertGoto("block_voucherNumber");
			testAssertGoto("#error_retry_count_exceed");
		}
		catch(Exception e)
		{
			e.printStackTrace();
			Assert.fail("Something went wrong");
		}
	}

	// Case Noinput directed to Goto -> timeoutCount == maxRefillTimeoutRetries (0)
	@Test
	public void block_voucherNumber_field_NoinputGoto() {
		try
		{
			getGrammar();
			// Block cond
			setVariables("timeoutCounter", "20");
			setVariables("fastRefillEnabled", "'true'");
			setVariables("fastRefillVoucherNumber", "''");
			setVariables("retryCount", "0");
			setVariables("allowedRefillRetry", "3");
			setVariables("enableMultiPartVoucherEntry", "'false'");
			setVariables("hasNextAvailableFlag", "false");
			setVariables("returnToMainMenuFlag", "'false'");
			setVariables("maxRefillTimeoutRetries", "0");

			testSetForm("main_standard_refill_main");
			testAssertGoto("block_voucherNumber");
			testAssertAudio("REF_VOUCHER_ENTER_WHASH_WOCANCEL_MSG");
			// User must provide the field input other than numerics in '' quotes
			testAssertField("field_voucherNumber", "");
			testAssertGoto("#error_retry_count_exceed_timeout");

			//			ScriptUtil.printVar("containDigit(voucherNumber, cancelDigitDTMF)");

		}
		catch(Exception e)
		{
			e.printStackTrace();
			Assert.fail("Something went wrong");
		}
	}
	
	// Case noinput timeoutCount increments by 1 on every visit to catch noinput if condition -> timeoutCount == maxRefillTimeoutRetries (3) directs to Goto
	@Test
	public void block_voucherNumber_field_NoInput_Msg() {
		try
		{
			getGrammar();
			// Block cond
			setVariables("invalidEntryCounter", "0");
			setVariables("fastRefillEnabled", "'true'");
			setVariables("fastRefillVoucherNumber", "''");
			setVariables("retryCount", "0");
			setVariables("allowedRefillRetry", "3");
			setVariables("enableMultiPartVoucherEntry", "'false'");
			setVariables("hasNextAvailableFlag", "false");
			setVariables("maxRefillTimeoutRetries", "3");

			testSetForm("main_standard_refill_main");
			testAssertGoto("block_voucherNumber");
			testAssertAudio("REF_VOUCHER_ENTER_WHASH_WOCANCEL_MSG");
			// User must provide the field input other than numerics in '' quotes
			testAssertField("field_voucherNumber", "");
			testAssertAudio("REF_VOUCHER_ENTER_TIMEOUT_MSG");
			testAssertAudio("REF_VOUCHER_ENTER_WHASH_WOCANCEL_MSG");
			testAssertField("field_voucherNumber", "");
			testAssertAudio("REF_VOUCHER_ENTER_TIMEOUT_MSG");
			testAssertAudio("REF_VOUCHER_ENTER_WHASH_WOCANCEL_MSG");
			testAssertField("field_voucherNumber", "");
			testAssertAudio("REF_VOUCHER_ENTER_TIMEOUT_MSG");
			testAssertAudio("REF_VOUCHER_ENTER_WHASH_WOCANCEL_MSG");
			testAssertField("field_voucherNumber", "");
			testAssertGoto("#error_retry_count_exceed_timeout");
			//			ScriptUtil.printVar("containDigit(voucherNumber, cancelDigitDTMF)");

		}
		catch(Exception e)
		{
			e.printStackTrace();
			Assert.fail("Something went wrong");
		}
	}

	// Case Field input contain back2MainMenuDTMF (*) -> throw event returnToMainMenu
	@Test
	public void block_voucherNumber_field_returnToMainMenu() {
		try
		{
			getGrammar();
			// Block cond
			setVariables("fastRefillEnabled", "'false'");
			setVariables("fastRefillVoucherNumber", "'123'");
			setVariables("retryCount", "0");
			setVariables("allowedRefillRetry", "3");
			setVariables("enableMultiPartVoucherEntry", "'false'");
			setVariables("hasNextAvailableFlag", "false");
			setVariables("returnToMainMenuFlag", "'true'");

			testSetForm("main_standard_refill_main");
			testAssertAudio("REF_VOUCHER_ENTER_WHASH_WOCANCEL_MSG");
			// User must provide the field input other than numerics in '' quotes
			testAssertField("field_voucherNumber", "'123456*'");
			testAssertGoto("#main_exitModule");

		}
		catch(Exception e)
		{
			e.printStackTrace();
			Assert.fail("Something went wrong");
		}
	}

	// Case Field input contain cancelDigitDTMF (*) -> throw event nomatch -> returnToMainMenu
	@Test
	public void block_voucherNumber_field_Nomatch_cancelDigitDTMF() {
		try
		{
			getGrammar();
			// Block cond
			setVariables("fastRefillEnabled", "'false'");
			setVariables("fastRefillVoucherNumber", "'123'");
			setVariables("retryCount", "0");
			setVariables("allowedRefillRetry", "3");
			setVariables("enableMultiPartVoucherEntry", "'false'");
			setVariables("hasNextAvailableFlag", "false");
			setVariables("returnToMainMenuFlag", "'false'");
			
			testSetForm("main_standard_refill_main");
			testAssertAudio("REF_VOUCHER_ENTER_WHASH_WOCANCEL_MSG");
			// User must provide the field input other than numerics in '' quotes
			testAssertField("field_voucherNumber", "'*'");
			testAssertGoto("#main_exitModule");

		}
		catch(Exception e)
		{
			e.printStackTrace();
			Assert.fail("Something went wrong");
		}
	}
	
	// Case Field input doesnot contain endDigitDTMF (#) & less than 8 char -> throw event nomatch -> forcedNoMatch_true
	@Test
	public void block_voucherNumber_field_Nomatch_endDigitDTMF_forced_trueval() {
		try
		{
			getGrammar();
			// Block cond
			setVariables("fastRefillEnabled", "'false'");
			setVariables("fastRefillVoucherNumber", "'123'");
			setVariables("retryCount", "0");
			setVariables("allowedRefillRetry", "3");
			setVariables("enableMultiPartVoucherEntry", "'false'");
			setVariables("hasNextAvailableFlag", "false");
			setVariables("returnToMainMenuFlag", "'false'");
			setVariables("voucherLengthValidFlag", "'false'");
			setVariables("maxRefillInvalidRetries", "3");
			//
			setVariables("forcedNoMatch", "true");
			
			testSetForm("main_standard_refill_main");
			testAssertAudio("REF_VOUCHER_ENTER_WHASH_WOCANCEL_MSG");
			// User must provide the field input other than numerics in '' quotes
			testAssertField("field_voucherNumber", "'1234'");
			testAssertAudio("REF_VOUCHER_ENTER_WHASH_WOCANCEL_MSG");
			testAssertField("field_voucherNumber", "'1234'");
			testAssertAudio("REF_VOUCHER_ENTER_NOMATCH_LESS_DIGITS_MSG");
			testAssertAudio("REF_VOUCHER_ENTER_WHASH_WOCANCEL_MSG");
			testAssertField("field_voucherNumber", "'1234'");
//			testAssertAudio("REF_VOUCHER_ENTER_NOMATCH_LESS_DIGITS_MSG");
//			testAssertAudio("REF_VOUCHER_ENTER_WHASH_WOCANCEL_MSG");
//			testAssertField("field_voucherNumber", "'1234'");
			testAssertGoto("#error_retry_count_exceed_invalidEntry");

		}
		catch(Exception e)
		{
			e.printStackTrace();
			Assert.fail("Something went wrong");
		}
	}
	
	// Case Field input doesnot contain endDigitDTMF (#) & less than 8 char -> throw event nomatch -> forcedNoMatch_false
	@Test
	public void block_voucherNumber_field_Nomatch_endDigitDTMF_vNum_lt() {
		try
		{
			getGrammar();
			// Block cond
			setVariables("fastRefillEnabled", "'false'");
			setVariables("fastRefillVoucherNumber", "'123'");
			setVariables("retryCount", "0");
			setVariables("allowedRefillRetry", "3");
			setVariables("enableMultiPartVoucherEntry", "'false'");
			setVariables("hasNextAvailableFlag", "false");
			setVariables("returnToMainMenuFlag", "'false'");
			setVariables("voucherLengthValidFlag", "'false'");
			setVariables("invalidEntryCount", "0");
			setVariables("maxRefillInvalidRetries", "3");
			
			testSetForm("main_standard_refill_main");
			testAssertAudio("REF_VOUCHER_ENTER_WHASH_WOCANCEL_MSG");
			// User must provide the field input other than numerics in '' quotes
			testAssertField("field_voucherNumber", "'1234'");
			testAssertAudio("REF_VOUCHER_ENTER_NOMATCH_LESS_DIGITS_MSG");
			testAssertAudio("REF_VOUCHER_ENTER_WHASH_WOCANCEL_MSG");
			testAssertField("field_voucherNumber", "'1234'");
			testAssertAudio("REF_VOUCHER_ENTER_NOMATCH_LESS_DIGITS_MSG");
			testAssertAudio("REF_VOUCHER_ENTER_WHASH_WOCANCEL_MSG");
			testAssertField("field_voucherNumber", "'1234'");
			testAssertAudio("REF_VOUCHER_ENTER_NOMATCH_LESS_DIGITS_MSG");
			testAssertAudio("REF_VOUCHER_ENTER_WHASH_WOCANCEL_MSG");
			testAssertField("field_voucherNumber", "'12345'");
			testAssertGoto("#error_retry_count_exceed_invalidEntry");
		}
		catch(Exception e)
		{
			e.printStackTrace();
			Assert.fail("Something went wrong");
		}
	}
	
	// Case Field input doesnot contain endDigitDTMF (#) & greater than 8 char -> throw event nomatch -> forcedNoMatch_true
	@Test
	public void block_voucherNumber_field_Nomatch_endDigitDTMF_vNum_gt() {
		try
		{
			getGrammar();
			// Block cond
			setVariables("fastRefillEnabled", "'false'");
			setVariables("fastRefillVoucherNumber", "'123'");
			setVariables("retryCount", "0");
			setVariables("allowedRefillRetry", "3");
			setVariables("enableMultiPartVoucherEntry", "'false'");
			setVariables("hasNextAvailableFlag", "false");
			setVariables("returnToMainMenuFlag", "'false'");
			setVariables("voucherLengthValidFlag", "'false'");
			setVariables("invalidEntryCount", "0");
			setVariables("maxRefillInvalidRetries", "3");
			
			testSetForm("main_standard_refill_main");
			testAssertAudio("REF_VOUCHER_ENTER_WHASH_WOCANCEL_MSG");
			// User must provide the field input other than numerics in '' quotes
			testAssertField("field_voucherNumber", "'123456789'");
			testAssertAudio("REF_VOUCHER_ENTER_NOMATCH_MORE_DIGITS_MSG");
			testAssertAudio("REF_VOUCHER_ENTER_WHASH_WOCANCEL_MSG");
			testAssertField("field_voucherNumber", "'123456789'");
			testAssertAudio("REF_VOUCHER_ENTER_NOMATCH_MORE_DIGITS_MSG");
			testAssertAudio("REF_VOUCHER_ENTER_WHASH_WOCANCEL_MSG");
			testAssertField("field_voucherNumber", "'123456789'");
			testAssertAudio("REF_VOUCHER_ENTER_NOMATCH_MORE_DIGITS_MSG");
			testAssertAudio("REF_VOUCHER_ENTER_WHASH_WOCANCEL_MSG");
			testAssertField("field_voucherNumber", "'123456789'");
			testAssertGoto("#error_retry_count_exceed_invalidEntry");
			
		}
		catch(Exception e)
		{
			e.printStackTrace();
			Assert.fail("Something went wrong");
		}
	}
	
	@Test
	public void block_voucherNumber_field_validVoucher() {
		try
		{
			getGrammar();
			// Block cond
			setVariables("fastRefillEnabled", "'false'");
			setVariables("fastRefillVoucherNumber", "'123'");
			setVariables("retryCount", "0");
			setVariables("allowedRefillRetry", "3");
			setVariables("enableMultiPartVoucherEntry", "'false'");
			setVariables("hasNextAvailableFlag", "false");
			setVariables("returnToMainMenuFlag", "'false'");
			setVariables("voucherLengthValidFlag", "'true'");
			setVariables("invalidEntryCount", "0");
			
			testSetForm("main_standard_refill_main");
			testAssertAudio("REF_VOUCHER_ENTER_WHASH_WOCANCEL_MSG");
			// User must provide the field input other than numerics in '' quotes
			testAssertField("field_voucherNumber", "'12345678#'");
			testAssertGoto("#main_option_confirmation");
			
		}
		catch(Exception e)
		{
			e.printStackTrace();
			Assert.fail("Something went wrong");
		}
	}
}