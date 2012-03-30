package com.ericsson.vxmlunit.vo;

import org.w3c.dom.Element;

import com.ericsson.vxmlunit.exception.VXMLException;
import com.ericsson.vxmlunit.interpreter.VXMLInterpreter;
import com.ericsson.vxmlunit.vo.base.AbstractBaseItem;
import com.ericsson.vxmlunit.vo.base.NonFormItem;

public class Filled extends NonFormItem{
	
	private String mode;
	private String nameList;
	private String matchedValue;
	private boolean subdvisit;
	public static final String NODE_NAME = "filled";

	public Filled(Element element){
		
		String mode = element.getAttribute("mode");
			if (mode.equals("") || mode == null)
				setMode("all");
			else
				setMode("any");
		nameList = element.getAttribute("namelist");
		
		setNameList(nameList);

		setName("filled");
	}
	
	public String getMode() {
		return mode;
	}

	public void setMode(String mode) {
		this.mode = mode;
	}

	public String getNameList() {
		return nameList;
	}

	public void setNameList(String nameList) {
		this.nameList = nameList;
	}

	public String getMatchedValue() {
		return matchedValue;
	}

	public void setMatchedValue(String matchedValue) {
		this.matchedValue = matchedValue;
	}

	public boolean isSubdvisit() {
		return subdvisit;
	}

	public void setSubdvisit(boolean subdvisit) {
		this.subdvisit = subdvisit;
	}

	@Override
	public AbstractBaseItem execute(VXMLInterpreter interpreter) throws VXMLException {
		Field field = (Field) getParent();
		
		AbstractBaseItem nextItem = null;
		if(interpreter.getEvent().equals("filled")){
			field.setValue(getMatchedValue());
			nextItem = super.execute(interpreter);
		}
		else{
//			interpreter.setCurrentItem(interpreter.checkNull(getNextSibling()));
//			nextItem = interpreter.getNextItem();
//			nextItem = interpreter.checkNull(getNextSibling());
			nextItem = super.skip(interpreter);
//			nextItem = interpreter.getCurrentItem().getNextSibling();
//			nextItem = interpreter.checkNull(getNextSibling());
		}
		
//		if(!nextItem.isCapturedItem()){
//			nextItem.execute(interpreter);
//			interpreter.setCurrentItem(nextItem);
////			nextItem = nextItem.execute(interpreter);
//			nextItem = interpreter.getCurrentItem().execute(interpreter);
//		}
		
		return nextItem;
	}

	@Override
	public String toString() {
		return "Filled {Mode = " + mode + " : Name List = " + nameList + "}";
	}	
}
