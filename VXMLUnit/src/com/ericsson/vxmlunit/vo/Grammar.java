package com.ericsson.vxmlunit.vo;

import org.w3c.dom.Element;

import com.ericsson.vxmlunit.exception.VXMLException;
import com.ericsson.vxmlunit.interpreter.VXMLInterpreter;
import com.ericsson.vxmlunit.vo.base.AbstractBaseItem;
import com.ericsson.vxmlunit.vo.base.NonFormItem;

public class Grammar extends NonFormItem {

	public Grammar(Element element) {
		
		setName("grammar");
	}

	@Override
	public AbstractBaseItem execute(VXMLInterpreter interpreter)
			throws VXMLException {
		AbstractBaseItem nextItem = null;
		nextItem = super.skip(interpreter);
		return nextItem;
	}

}
