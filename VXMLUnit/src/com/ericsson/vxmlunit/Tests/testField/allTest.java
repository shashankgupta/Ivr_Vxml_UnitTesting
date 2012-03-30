package com.ericsson.vxmlunit.Tests.testField;

import junit.framework.Test;
import junit.framework.TestCase;
import junit.framework.TestSuite;

public class allTest extends TestCase{
	
	public static Test suite(){
		
		TestSuite suite = new TestSuite();
		
		suite.addTestSuite(testFilled.class);
		suite.addTestSuite(testNomatch.class);
		suite.addTestSuite(testNoinput.class);
		
		return suite;
	}

}
