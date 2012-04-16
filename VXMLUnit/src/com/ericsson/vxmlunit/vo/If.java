package com.ericsson.vxmlunit.vo;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import org.w3c.dom.Element;

import com.ericsson.vxmlunit.exception.VXMLException;
import com.ericsson.vxmlunit.exception.VXMLScriptException;
import com.ericsson.vxmlunit.interpreter.VXMLInterpreter;
import com.ericsson.vxmlunit.script.ScriptUtil;
import com.ericsson.vxmlunit.vo.base.AbstractBaseItem;
import com.ericsson.vxmlunit.vo.base.NonFormItem;

public class If extends NonFormItem {


	private String condition;
	private List<ElseIf> listElseIf;
	private Else elseItem;
	public boolean isExecuted;
	
	public If(Element element) {
		
		setCondition(element.getAttribute("cond"));
		listElseIf = new ArrayList<ElseIf>();
		
		setName("if");
		
	}
	
	@Override
	public AbstractBaseItem execute(VXMLInterpreter interpreter) throws VXMLException {
		AbstractBaseItem nextItem = null;
		List<ElseIf> elseIfList = this.getListElseIf();
		Else elseItem = this.getElseItem();
		boolean flag = false;
		isExecuted = false;
		
		try{
			if(isTrue()){
				nextItem = super.execute(interpreter);
				isExecuted = true;
			}else if(!elseIfList.isEmpty()){
				Iterator<ElseIf> elseIfIter = elseIfList.iterator();
				while(elseIfIter.hasNext()) {
					ElseIf child = elseIfIter.next();
					if(child.isTrue()){
						interpreter.setCurrentItem(child);
						nextItem = child.execute(interpreter);
						isExecuted = true;
						flag = true;
						break;
					}
				}
			}

			if(elseItem != null && !isTrue() && !flag){
				interpreter.setCurrentItem(elseItem);
				nextItem = elseItem.execute(interpreter);
				isExecuted = true;
			}
			
			if(!isExecuted) {
				nextItem = super.skip(interpreter);
				//nextItem = interpreter.checkNull(getNextSibling());
//				if(nextItem.getName().equals("if")){
//					interpreter.setCurrentItem(nextItem);
//					nextItem = interpreter.getNextItem();
//				}
			}
//			else {
//				nextItem = super.execute(interpreter);
//			}
			
		}catch(VXMLScriptException e){
			throw new VXMLException(e.getMessage());
		}
		return nextItem;
	}

	public boolean isExecuted() {
		return isExecuted;
	}

	public void setExecuted(boolean isExecuted) {
		this.isExecuted = isExecuted;
	}

	public Else getElseItem() {
		return elseItem;
	}

	public void setElseItem(Else elseItem) {
		this.elseItem = elseItem;
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
	
	public List<ElseIf> getListElseIf() {
		return listElseIf;
	}

	public void setListElseIf(List<ElseIf> listElseIf) {
		this.listElseIf = listElseIf;
		
	}

	@Override
	public String toString() {
		return "IF {condition = " + condition + "}";
	}
}
