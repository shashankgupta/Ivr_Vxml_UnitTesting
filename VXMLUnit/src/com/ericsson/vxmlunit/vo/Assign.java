package com.ericsson.vxmlunit.vo;

import com.ericsson.vxmlunit.exception.VXMLException;
import com.ericsson.vxmlunit.exception.VXMLScriptException;
import com.ericsson.vxmlunit.interpreter.VXMLInterpreter;
import com.ericsson.vxmlunit.script.ScriptUtil;
import com.ericsson.vxmlunit.vo.base.AbstractBaseItem;
import com.ericsson.vxmlunit.vo.base.NonFormItem;

import org.w3c.dom.Element;

public class Assign extends NonFormItem{
	
	private String assi_Name;
	private String assi_expr;
	
	public Assign(Element element) {
		String assi_Name = element.getAttribute("name");
		
		if(assi_Name == null || assi_Name.equals("")) 
			setAssignName("Mandatory Fields");
		else
			setAssignName(assi_Name);
		
		String assi_expr = element.getAttribute("expr");
		
		if(assi_expr == null || assi_expr.equals("")) 
			setAssiExpr("undefined");
		else
			setAssiExpr(assi_expr);
		setName("assign");
	}
	
	public String getAssignName() {
		return assi_Name;
	}
	public void setAssignName(String assi_Name) {
		this.assi_Name = assi_Name;
	}
	public String getAssiExpr() {
		return assi_expr;
	}
	public void setAssiExpr(String assi_expr) {
		this.assi_expr = assi_expr;
	}
	
	@Override
	public AbstractBaseItem execute(VXMLInterpreter interpreter) throws VXMLException {
		try {
			ScriptUtil.executeAssign(this);
		} catch (VXMLScriptException e) {
			e.printStackTrace();
		}
		return super.execute(interpreter);
	}
	
	@Override
	public String toString() {
		return "Assign {Name = " + assi_Name + " : Expression = " + assi_expr + "}";
	}
}
