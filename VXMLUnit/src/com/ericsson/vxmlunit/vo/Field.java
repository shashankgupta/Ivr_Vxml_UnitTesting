package com.ericsson.vxmlunit.vo;

import java.util.Collections;
import java.util.Comparator;
import java.util.List;
import java.util.Stack;

import org.w3c.dom.Element;

import com.ericsson.vxmlunit.exception.VXMLException;
import com.ericsson.vxmlunit.exception.VXMLScriptException;
import com.ericsson.vxmlunit.interpreter.VXMLInterpreter;
import com.ericsson.vxmlunit.vo.base.AbstractBaseItem;
import com.ericsson.vxmlunit.vo.base.FormItem;

public class Field extends FormItem{
	
	private String cond;
	private String modal;
	private String field_name;
	private String status;
	private Filled filled;
	
//	private Stack<Catch> catchStack;
	private Stack<Catch> nomatchStack;
//	private Stack<Noinput> noinputStack;


	public Field(Element element){
		
		String field_name = element.getAttribute("name");
			if (field_name.equals("") || field_name == null)
				setFieldName("Name");
			else
				setFieldName(field_name);
			
		setGuardCondition(element.getAttribute("cond"));
		
		setCond(element.getAttribute("cond"));
		
		String expr = element.getAttribute("expr");
			if (expr.equals("") || expr == null)
				setExpr("undefined");
			else
				setExpr(expr);
			
		String modal = element.getAttribute("modal");
			if (modal.equals("") || modal == null)
				setModal("undefined");
			else
				setModal(modal);
			
		setName("field");

	}

	@Override
	public void setCatchStack() {
		catchStack = getParent().getCatchStack();
	}

	public String getCond() {
		return cond;
	}
	
	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public void setCond(String cond) {
		this.cond = cond;
	}

	public String getModal() {
		return modal;
	}

	public void setModal(String modal) {
		this.modal = modal;
	}

	public String getFieldName() {
		return field_name;
	}

	public void setFieldName(String name) {
		this.field_name = name;
	}

	public Stack<Catch> getNomatchStack() {
		return nomatchStack;
	}

	public void setNomatchStack(Stack<Catch> nomatchStack) {
		this.nomatchStack = nomatchStack;
	}

	public Filled getFilled() {
		return filled;
	}

	public void setFilled(Filled filled) {
		this.filled = filled;
	}

	@Override
	public AbstractBaseItem execute(VXMLInterpreter interpreter) throws VXMLException{
		// exe multiple namelist
		AbstractBaseItem nextItem = null;
		try{
			if(isVisited()) {
				nextItem = super.execute(interpreter);
				// if tag is "noinput" find first successful match from catchstack

			} else {
				interpreter.setCurrentItem(this);
				nextItem = interpreter.getCurrentItem().getFirstChild();
				if(nextItem instanceof Grammar){
					interpreter.setCurrentItem(nextItem);
					nextItem = interpreter.getNextItem();
				}
//				interpreter.setCurrentItem(interpreter.getCurrentItem().getFirstChild());
//				nextItem = interpreter.getNextItem();

			}
		}catch(VXMLScriptException e){
			e.printStackTrace();
		}

		return nextItem;
	}

	public void reorderChildren() {
		List<AbstractBaseItem> children = getChildren();
		Collections.sort(children, new Comparator<AbstractBaseItem>() {

			@Override
			public int compare(AbstractBaseItem first, AbstractBaseItem second) {
				if ((first instanceof Audio || first instanceof Prompt)
						&& ((!(second instanceof Audio) && !(second instanceof Prompt))))
					return -1;
				else if ((second instanceof Audio || second instanceof Prompt)
						&& ((!(first instanceof Audio) && !(first instanceof Prompt))))
					return 1;
				return 0;
			}
		});
		
		for (int i = (children.size() - 1); i >= 0; i--) {
			if(i == (children.size() - 1))
				children.get(i).setNextSibling(null);
			else
				children.get(i).setNextSibling(children.get(i + 1));
		}
		
		setFirstChild(children.get(0));
	}

	@Override
	public String toString() {
		return "Field {name = " + field_name + " value : " + value + " : expr = " + expr + " : cond = " + cond + "}";
	}

}
