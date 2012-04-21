package com.ericsson.vxmlunit.vo;

import org.w3c.dom.Element;

import com.ericsson.vxmlunit.exception.VXMLException;
import com.ericsson.vxmlunit.interpreter.VXMLInterpreter;
import com.ericsson.vxmlunit.vo.base.AbstractBaseItem;
import com.ericsson.vxmlunit.vo.base.NonFormItem;

public class Else extends NonFormItem {

	//private String condition;
	public static final String NODE_NAME = "else";
	
	public Else(Element element) {
		//setCondition(element.getAttribute("cond"));
		setName("else");
	}

	@Override
	public AbstractBaseItem execute(VXMLInterpreter interpreter) throws VXMLException {
		AbstractBaseItem nextItem = null;
		If parentIf = (If) getParent();
		
		if(!parentIf.isExecuted) {
			nextItem = super.execute(interpreter);
		}
		else {
			if(parentIf.isExecuted) {
				nextItem = interpreter.checkNull(parentIf.getNextSibling());
			}
			
			while(nextItem.getName().equals("else")){
				If parentElse = (If) nextItem.getParent();
				nextItem = parentElse.getNextSibling();
			}
			
			if(nextItem != null && !nextItem.isCapturedItem()) {
				interpreter.setCurrentItem(nextItem);
				nextItem = interpreter.getNextItem();
			}
		}
		
		return nextItem;
	}

	@Override
	public String toString() {
		return "Else {" + "}";
	}
}
