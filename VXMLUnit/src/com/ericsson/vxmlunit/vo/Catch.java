package com.ericsson.vxmlunit.vo;

import java.util.Stack;

import com.ericsson.vxmlunit.exception.VXMLException;
import com.ericsson.vxmlunit.exception.VXMLScriptException;
import com.ericsson.vxmlunit.interpreter.VXMLInterpreter;
import com.ericsson.vxmlunit.script.ScriptUtil;
import com.ericsson.vxmlunit.vo.base.AbstractBaseItem;
import com.ericsson.vxmlunit.vo.base.NonFormItem;

import org.w3c.dom.Element;

public class Catch extends NonFormItem implements Comparable<Catch> {

	public static final int SCOPE_FIELD = 0;
	public static final int SCOPE_FORM = 1;
	public static final int SCOPE_VXML = 2;
	public static final int SCOPE_ROOT = 3;
	
	private String event;
	private String condition;
	private boolean executable;
	protected int scope;
	
	public Catch(Element element,String elementEvent){

		if(elementEvent != null){
			setEvent(elementEvent);
		}
		else{
			event = element.getAttribute("event");
			if(event == null || event.equals("")) 
				setEvent("event");
			else
				setEvent(event);
		}
	
		setCondition(element.getAttribute("cond"));
		
		setName("catch");
	}
	
	public int getScope() {
		return scope;
	}
	
	public void setScope(int scope) {
		this.scope = scope;
	}
	
	public boolean isExecutable() {
		return executable;
	}

	public void setExecutable(boolean executable) {
		this.executable = executable;
	}

	public String getEvent() {
		return event;
	}

	public void setEvent(String event) {
		this.event = event;
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
	public AbstractBaseItem execute(VXMLInterpreter interpreter) throws VXMLException{
		
		AbstractBaseItem nextItem = null;
		
//		if(scope == SCOPE_FIELD) {
//			if(isTrue() && event.equals(interpreter.getEvent())) 
//				nextItem = super.execute(interpreter);
//			else
//				nextItem = super.skip(interpreter);
//		}
//		else {
		try{
		Stack<Catch> catchStack = getCatchStack();
			for (int i = catchStack.size() - 1; i >= 0; i--) {

				Catch catch1 = catchStack.get(i);
				String catchEvent = catch1.getEvent();

				if (isTrue() && catchEvent.equals(interpreter.getEvent())) {
					//interpreter.setCurrentItem(catch1.getFirstChild());
					//nextItem = catch1.execute(interpreter);
//					break;
					//nextItem = interpreter.getNextItem();
					//break;
					
					nextItem = interpreter.checkNull(catch1.getFirstChild());

					if(nextItem != null && !nextItem.isCapturedItem()) {
						interpreter.setCurrentItem(nextItem);
						nextItem = interpreter.getNextItem();
					}
					
					break;
				}
			}
			}catch(VXMLScriptException e){
				e.printStackTrace();
			}
		//}

		
		
//
//		Catch catch1 = this;
//		
//		if((this.getScope() == 0)){
//			
//			Field field = (Field) this.getParent();
//			String event = catch1.getEvent();
//			
//			for(int i=0; i<field.getChildren().size(); i++){
//				if(event.equals("nomatch") && field.getStatus().equals("nomatch")){
//					catch1.setExecutable(true);
//					break;
//				}
//				else if(event.equals("noinput") && field.getStatus().equals("noinput")){
//					catch1.setExecutable(true);
//					break;
//				}
//			}
////			if(field.getStatus().equals("nomatch") && catch1.getEvent().equals("nomatch")){
////				interpreter.setCurrentItem(this);
////				nextItem = interpreter.getCurrentItem().getFirstChild();
////			}
////			if(field.getStatus().equals("noinput")){
////				interpreter.setCurrentItem(this);
////				nextItem = interpreter.getCurrentItem().getFirstChild();
////			}
////			else{
////				interpreter.setCurrentItem(interpreter.getCurrentItem().getNextSibling());
////				nextItem = interpreter.getNextItem();
////			}
//		}
//		
//		if(catch1.isExecutable()) {
//			nextItem = interpreter.getCurrentItem().getFirstChild();
//			catch1.setExecutable(false);
//		}
//		else{
////			interpreter.setCurrentItem(interpreter.getCurrentItem().getNextSibling());
//			//nextItem = interpreter.checkNull(getNextSibling());
//			nextItem = super.execute(interpreter);
//			//interpreter.setCurrentItem(interpreter.checkNull(getNextSibling()));	// the next statement brings the corrent content
////			nextItem = interpreter.getNextItem();									// this actually skips the current hold and brings the nextItem :-p
////			interpreter.setCurrentItem(interpreter.getCurrentItem().getNextSibling());
//			
////			nextItem = interpreter.checkNull(getNextSibling());
////			
////			if(nextItem != null && !nextItem.isCapturedItem()) {
////				interpreter.setCurrentItem(nextItem);
////				nextItem = interpreter.getNextItem();
////			}
//			
//		}
		return nextItem;
	}
	
	@Override
	public String toString() {
		return "Catch {Event = " + event + " Condition : " + condition + " Scope : " + scope + "}";
	}

	@Override
	public int compareTo(Catch catch1) {
		if(this.scope > catch1.getScope())
			return 1;
		else if (this.scope < catch1.getScope())
			return -1;
		return 0;
	}
	
}
