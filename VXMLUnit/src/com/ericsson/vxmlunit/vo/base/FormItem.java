package com.ericsson.vxmlunit.vo.base;

import com.ericsson.vxmlunit.exception.VXMLException;
import com.ericsson.vxmlunit.exception.VXMLScriptException;
import com.ericsson.vxmlunit.interpreter.VXMLInterpreter;
import com.ericsson.vxmlunit.script.ScriptUtil;
import com.ericsson.vxmlunit.vo.Block;

public class FormItem extends AbstractBaseItem {

	protected String guardcondition;
	protected String value = null;
	protected String expr;
	protected int prompt_counter;
	protected int error_counter;
	
	public String getExpr() {
		return expr;
	}

	public void setExpr(String expr) {
		this.expr = expr;
	}
	

	public String getValue() {
		return value;
	}

	public void setValue(String expr) {
		this.value = expr;
	}

	public boolean isVisited() throws VXMLScriptException{
		if(value != null || !ScriptUtil.evaluateGuardCondition(guardcondition)) 	
			return true;
		else {
			value = ScriptUtil.evaluateExpression(expr);
			return value != null;
		}
	}

	@Override
	public AbstractBaseItem execute(VXMLInterpreter interpreter) throws VXMLException {

		AbstractBaseItem nextItem = null;
		try{
			if (!isVisited()) {
				setValue(ScriptUtil.evaluateExpression(getExpr()));
				if (!isCapturedItem()) {
					if(this instanceof Block) {
						ScriptUtil.executeBlock((Block) this, "true");
					}
					nextItem  = interpreter.checkNull(getFirstChild());

					if (nextItem == null) {
						nextItem = interpreter.getNextFormItemOrItsChild();
					}
					else if(!nextItem.isCapturedItem()){
						interpreter.setCurrentItem(nextItem);
						nextItem = interpreter.getNextItem();
					}

				} else {
					nextItem = this;
				}
			} else {
				nextItem = interpreter.getNextFormItemOrItsChild();
			}
		}catch(VXMLScriptException e){
			e.printStackTrace();
		}

		return nextItem;
	}

	public String getGuardCondition() {
		return guardcondition;
	}

	public void setGuardCondition(String guardcondition) {
		this.guardcondition = guardcondition;
	}
}
