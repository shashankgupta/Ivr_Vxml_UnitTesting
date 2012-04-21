package com.ericsson.vxmlunit.vo;

import java.util.List;

import org.w3c.dom.Element;

import com.ericsson.vxmlunit.exception.VXMLException;
import com.ericsson.vxmlunit.exception.VXMLScriptException;
import com.ericsson.vxmlunit.interpreter.VXMLInterpreter;
import com.ericsson.vxmlunit.script.ScriptUtil;
import com.ericsson.vxmlunit.vo.base.AbstractBaseItem;
import com.ericsson.vxmlunit.vo.base.NonFormItem;

public class ElseIf extends NonFormItem {

	public static final String NODE_NAME = "elseif";
	private String condition;
	private int index;
	
	public ElseIf(Element element) {
		setCondition(element.getAttribute("cond"));
		
		setName("elseif");
	}
	
	
	public int getIndex() {
		return index;
	}


	public void setIndex(int index) {
		this.index = index;
	}


	public String getCondition() {
		return condition;
	}

	public void setCondition(String condition) {
		this.condition = condition;
	}
	
	public boolean isTrue() throws VXMLScriptException {
		return ScriptUtil.evaluateGuardCondition(condition);
	}
	
	@Override
	public AbstractBaseItem execute(VXMLInterpreter interpreter) throws VXMLException {
		AbstractBaseItem nextItem = null;
		If parentIf = (If) getParent();
		boolean tt = false;
		try{
			if(isTrue() && !parentIf.isExecuted()) {
				nextItem = super.execute(interpreter);
			}
			else {
				if(parentIf.isExecuted()) {
					nextItem = interpreter.checkNull(parentIf.getNextSibling()); 
					tt=true;
				}
				else {
					boolean flag = false;
					List<ElseIf> listElseIf = parentIf.getListElseIf();
					for (int i = index + 1; i < listElseIf.size(); i++) {
						ElseIf child = listElseIf.get(i);
						if(child.isTrue()){
							interpreter.setCurrentItem(child);
							nextItem = child.execute(interpreter);
							parentIf.setExecuted(true);
							flag = true;
							break;
						}
					}

					Else elseItem = parentIf.getElseItem();
					if(elseItem != null && !flag){
						interpreter.setCurrentItem(elseItem);
						nextItem = elseItem.execute(interpreter);
						parentIf.setExecuted(true);
					}
					else if(!flag)
						nextItem = interpreter.checkNull(parentIf.getNextSibling());
				}
				if(tt) {
					if(nextItem != null && !nextItem.isCapturedItem()) {
						interpreter.setCurrentItem(nextItem);
						nextItem = interpreter.getNextItem();
					}
				}
				
			}
		}catch(VXMLScriptException e){
			e.printStackTrace();
		}
		
		return nextItem;
	}
	
	@Override
	public String toString() {
		return "elseif {condition = " + condition + "}";
	}
}
