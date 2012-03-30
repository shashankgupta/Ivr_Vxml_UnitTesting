package com.ericsson.vxmlunit.vo.factory;

import org.w3c.dom.Element;

import com.ericsson.vxmlunit.exception.VXMLException;
import com.ericsson.vxmlunit.vo.Audio;
import com.ericsson.vxmlunit.vo.Block;
import com.ericsson.vxmlunit.vo.Catch;
import com.ericsson.vxmlunit.vo.Clear;
import com.ericsson.vxmlunit.vo.Else;
import com.ericsson.vxmlunit.vo.ElseIf;
//import com.ericsson.vxmlunit.vo.Exit;
import com.ericsson.vxmlunit.vo.Form;
//import com.ericsson.vxmlunit.vo.Grammar;
import com.ericsson.vxmlunit.vo.If;
//import com.ericsson.vxmlunit.vo.Param;
import com.ericsson.vxmlunit.vo.Prompt;
//import com.ericsson.vxmlunit.vo.Property;
import com.ericsson.vxmlunit.vo.Disconnect;
import com.ericsson.vxmlunit.vo.Exit;
import com.ericsson.vxmlunit.vo.Grammar;
import com.ericsson.vxmlunit.vo.Log;
import com.ericsson.vxmlunit.vo.Meta;
import com.ericsson.vxmlunit.vo.Param;
import com.ericsson.vxmlunit.vo.Property;
import com.ericsson.vxmlunit.vo.Reprompt;
import com.ericsson.vxmlunit.vo.Submit;
import com.ericsson.vxmlunit.vo.Throw;
import com.ericsson.vxmlunit.vo.Var;
import com.ericsson.vxmlunit.vo.Assign;
import com.ericsson.vxmlunit.vo.Vxml;
import com.ericsson.vxmlunit.vo.Field;
import com.ericsson.vxmlunit.vo.Filled;
import com.ericsson.vxmlunit.vo.Script;
import com.ericsson.vxmlunit.vo.Value;
import com.ericsson.vxmlunit.vo.Subdialog;
import com.ericsson.vxmlunit.vo.Data;
import com.ericsson.vxmlunit.vo.Goto;
import com.ericsson.vxmlunit.vo.base.AbstractBaseItem;


public class VXMLItemFactory {

	public static AbstractBaseItem getItem(String itemName, Element element, AbstractBaseItem parent) throws VXMLException {
		
		AbstractBaseItem item = null;
		
		if(itemName.equals("vxml")){
			item = new Vxml(element);
		}
		else if(itemName.equals("block")) {
			item = new Block(element);
		} 
		else if(itemName.equals("audio")) {
			item = new Audio(element);
		}
		else if(itemName.equals("if")) {
			item = new If(element);
		}
		else if(itemName.equals("elseif")) {
			item = new ElseIf(element);
		}
		else if(itemName.equals("else")) {
			item = new Else(element);
		}
		else if(itemName.equals("var"))	{
			item = new Var(element);
		}
		else if(itemName.equals("assign"))	{
			item = new Assign(element);
		}
		else if(itemName.equals("form")) {
			item = new Form(element);
		}
		else if(itemName.equals("field")){
			item = new Field(element);
		}
		else if(itemName.equals("filled")){
			item = new Filled(element);
		}
		else if(itemName.equals("script")){
			item = new Script(element);
		}
		else if(itemName.equals("value")){
			item = new Value(element);
		}
		else if(itemName.equals("subdialog")){
			item = new Subdialog(element);
		}
		else if(itemName.equals("data")){
			item = new Data(element);
		}
		else if(itemName.equals("goto")){
			item = new Goto(element);
		}
		else if(itemName.equals("param")){
			item = new Param(element);
		}
		else if(itemName.equals("property")){
			item = new Property(element);
		}
		else if(itemName.equals("grammar")){
			item = new Grammar(element);
		}
		else if(itemName.equals("catch")){
			item = new Catch(element,null);
		}
		// The <error>, <noinput>, and <nomatch> elements are shorthands for very common types of <catch> elements.
		// The <error> element is short for <catch event="error"> and catches all events of type error
		else if(itemName.equals("error")){		
			item = new Catch(element, "error");
		}
		// The <noinput> element abbreviates <catch event="noinput">
		else if(itemName.equals("noinput")){
			item = new Catch(element, "noinput");
		}
		// The <nomatch> element is short for <catch event="nomatch">
		else if(itemName.equals("nomatch")){
			item = new Catch(element, "nomatch");
		}
		else if(itemName.equals("clear")){
			item = new Clear(element);
		}
		else if(itemName.equals("prompt")){
			item = new Prompt(element);
		}
		else if(itemName.equals("throw")){
			item = new Throw(element);
		}
		else if(itemName.equals("exit")){
			item = new Exit(element);
		}
		else if(itemName.equals("reprompt")){
			item = new Reprompt(element);
		}
		else if(itemName.equals("disconnect")){
			item = new Disconnect(element);
		}
		else if(itemName.equals("log")){
			item = new Log(element);
		}
		else if(itemName.equals("submit")){
			item = new Submit(element);
		}
		else if(itemName.equals("meta")){
			item = new Meta(element);
		}
		
		if(item != null) {
			setParentChildRelationship(parent, item);
			item.setCatchStack();
		}

		return item;
	}
	
	private static void setParentChildRelationship(AbstractBaseItem parent, AbstractBaseItem child) {
		parent.getChildren().add(child);
		child.setParent(parent);
	}
}
