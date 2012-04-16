package com.ericsson.vxmlunit.vo;

import java.util.*;

import com.ericsson.vxmlunit.exception.VXMLException;
import com.ericsson.vxmlunit.interpreter.VXMLInterpreter;
import com.ericsson.vxmlunit.vo.base.AbstractBaseItem;
import com.ericsson.vxmlunit.vo.base.NonFormItem;
import org.w3c.dom.Element;

public class Throw extends NonFormItem{

	private String event;
	private String eventexpr;
	private String message;
	private String messageexpr;

	private TreeMap<String, String> dataMapEvent;
	private TreeMap<String, String> dataMapMessage;

	private static final String KEY_EVENT = "event";
	private static final String KEY_EVENTEXPR = "eventexpr";
	private static final String KEY_MESSAGE = "message";
	private static final String KEY_MESSAGEEXPR = "messageexpr";

	public Throw(Element element) throws VXMLException{
		dataMapEvent = new TreeMap<String, String>();
		dataMapMessage = new TreeMap<String, String>();
		
		event = element.getAttribute("event");
		eventexpr =  element.getAttribute("eventexpr");
		message =  element.getAttribute("message");
		messageexpr =  element.getAttribute("messageexpr");

		if(event != null && event.trim().length() > 0){
			dataMapEvent.put(KEY_EVENT, event);
			setEvent(event);
		}
		if(eventexpr != null && eventexpr.trim().length() > 0){
			dataMapEvent.put(KEY_EVENTEXPR, eventexpr);
			setEventexpr(eventexpr);
		}
		if(message != null && message.trim().length() > 0) {
			dataMapMessage.put(KEY_MESSAGE, message);
			setMessage(message);
		}
		
		if(messageexpr != null && messageexpr.length() > 0) {
			dataMapMessage.put(KEY_MESSAGEEXPR, messageexpr);
			setMessageexpr(messageexpr);
		}

		if(dataMapEvent.size() != 1) {
			throw new VXMLException("<throw> error: More than one of event, eventexpr found");
		}
//		if(dataMapMessage.size() != 1) {
//			throw new VXMLException("<throw> error: More than one of message, messageexpr found");
//		}

		setName("throw");
	}


	public String getEventexpr() {
		return eventexpr;
	}


	public void setEventexpr(String eventexpr) {
		this.eventexpr = eventexpr;
	}


	public String getMessage() {
		return message;
	}


	public void setMessage(String message) {
		this.message = message;
	}


	public String getMessageexpr() {
		return messageexpr;
	}


	public void setMessageexpr(String messageexpr) {
		this.messageexpr = messageexpr;
	}


	public String getEvent() {
		return event;
	}


	public void setEvent(String event) {
		this.event = event;
	}

	@Override
	public AbstractBaseItem execute(VXMLInterpreter interpreter) throws VXMLException {
		AbstractBaseItem nextItem = null;

		Throw thw = this;
		String throwEvent = thw.getEvent();

		Stack<Catch> catchStack = getCatchStack();

		if(catchStack.size() > 0) {
			interpreter.setEvent(throwEvent);
			nextItem = catchStack.elementAt(catchStack.size() - 1).execute(interpreter);
		}

		//		for(int i=catchStack.size()-1;i>= 0;i--){
		//			
		//			Catch catch1 = catchStack.get(i);
		//			String catchEvent = catch1.getEvent();
		//
		//			if(catchEvent.equals(throwEvent)){
		//				catch1.setExecutable(true);
		//				interpreter.setCurrentItem(catchStack.get(i));
		//				nextItem = interpreter.getNextItem();
		//			}
		//			catch1.setExecutable(false);
		//		}

		return nextItem;
	}

	@Override
	public String toString() {
		return "Throw {Event = \"" + event + "\"" + "}";
	}
}
