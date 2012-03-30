package com.ericsson.vxmlunit.vo;

import com.ericsson.vxmlunit.exception.VXMLException;
import com.ericsson.vxmlunit.exception.VXMLScriptException;
import com.ericsson.vxmlunit.interpreter.VXMLInterpreter;
import com.ericsson.vxmlunit.script.ScriptUtil;
import com.ericsson.vxmlunit.vo.base.AbstractBaseItem;
import com.ericsson.vxmlunit.vo.base.NonFormItem;

import org.w3c.dom.Element;

public class Var extends NonFormItem {

	private String varName;
	private String expression;
	
	public Var(Element element) {
		String varName = element.getAttribute("name");
		if(varName == null || varName.equals("")) 
			setVarName("Variable name must be assigned");
		else
			setVarName(varName);
		String expression = element.getAttribute("expr");
		if(expression == null || expression.equals("")) 
			setExpression("undefined");
		else
			setExpression(expression);
		setName("var");
	}
	
	public String getVarName() {
		return varName;
	}
	public void setVarName(String varName) {
		this.varName = varName;
	}
	public String getExpression() {
		return expression;
	}
	public void setExpression(String expression) {
		this.expression = expression;
	}
	
	@Override
	public AbstractBaseItem execute(VXMLInterpreter interpreter) throws VXMLException {
		try {
			ScriptUtil.executeVar(this);
		} catch (VXMLScriptException e) {
			throw new VXMLException(e.getMessage());
		}
		return super.execute(interpreter);
	}

	@Override
	public String toString() {
		return "Var {Name = " + varName + " : Expression = " + expression + "}";
	}
	
}
