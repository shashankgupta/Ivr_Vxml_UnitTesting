package com.ericsson.vxmlunit.interpreter;

import java.util.ArrayList;
import java.util.List;

import com.ericsson.vxmlunit.exception.VXMLException;
import com.ericsson.vxmlunit.exception.VXMLScriptException;
import com.ericsson.vxmlunit.init.VXMLLoader;
import com.ericsson.vxmlunit.vo.Form;
import com.ericsson.vxmlunit.vo.Vxml;
import com.ericsson.vxmlunit.vo.base.AbstractBaseItem;
import com.ericsson.vxmlunit.vo.base.FormItem;
import com.ericsson.vxmlunit.script.ScriptUtil;
import com.ericsson.vxmlunit.vo.Var;
import com.ericsson.vxmlunit.vo.Script;

public class VXMLInterpreter {

	private AbstractBaseItem currentItem;
	private List<FormItem> formItems;

	private String event;

	public VXMLInterpreter() {
		this.formItems = new ArrayList<FormItem>();
	}

	public String getEvent() {
		return event;
	}

	public void setEvent(String event) {
		this.event = event;
	}

	/**
	 * initialize the form
	 * parameter received from main function
	 * @param form
	 */
	public void initializeForm(Form form) {
		this.formItems.clear();

		if (form != null) {
			List<AbstractBaseItem> formChildren = form.getChildren();
			for (AbstractBaseItem formChild : formChildren) {
				if (formChild.isFormItem()) {
					FormItem formItem = (FormItem) formChild;
					formItem.setValue(null);
					this.formItems.add(formItem);
				}
			}
			if (this.formItems.size() > 0)
				this.currentItem = this.formItems.get(0);
		}
	}

	/**
	 * initialize variables <var tag>
	 * @param vxml
	 */
	public void initializeVariables(Vxml vxml) {

		try {
			List<AbstractBaseItem> children = vxml.getChildren();
			for (AbstractBaseItem child : children) {
				if (child.getName().equals("var")) {
					ScriptUtil.executeVar((Var) child);
				}
			}
		} catch (VXMLScriptException e) {
			e.printStackTrace();
		}
	}


	/**
	 * initialize scripts <script tag>
	 * parameter received from main function
	 * @param vxml
	 * @throws VXMLException 
	 */
	public void initializeScript(Vxml vxml) throws VXMLException {

		List<AbstractBaseItem> children = vxml.getChildren();
		for (AbstractBaseItem child : children) {
			if (child.getName().equals("script")) {
				Script script = (Script) child;
				script.execute();
				//ScriptUtil.executeScript((Script) child);
			}
		}
	}

	public AbstractBaseItem getNextFormItemOrItsChild() throws VXMLException {
		AbstractBaseItem nextItem = null;

		this.currentItem = searchNextUnvisitedFormItem();
		if(this.currentItem == null)
			return null;
		else if(this.currentItem.isCapturedItem())
			return this.currentItem;

		nextItem = getNextItem();

		return nextItem;
	}

	/**
	 * checkNull method is used to check whether the item has reached its null state 
	 * parameter received from getNextItem function
	 * @param nextItem
	 * @return
	 */

	public AbstractBaseItem checkNull(AbstractBaseItem nextItem) throws VXMLException{
		try{
			if (nextItem == null) {
				AbstractBaseItem parent = this.currentItem.getParent();

				if (parent.isFormItem()) {

					FormItem formItem = (FormItem) parent;
					formItem.setValue("true");
					nextItem = getNextFormItemOrItsChild();
				}
				else {

					// this check is done because for isPostEventItems (filled or catch), we need to go to parent of parent.
					if(!parent.isPostEventItem()) 
						nextItem = parent.getNextSibling();


					while (nextItem == null ) {
						parent = parent.getParent();
						if (parent.getName().equals("form")) {
							break;
						} else if (parent.isFormItem()) {
							nextItem = getNextFormItemOrItsChild();
						} else {
							nextItem = parent.getNextSibling();
						}
					}

				}
			}
			else{
				AbstractBaseItem parent = this.currentItem.getParent();

				if(nextItem.getName().equals("elseif")){
					nextItem = parent.getNextSibling();
				}
				if(nextItem.getName().equals("else")){
					nextItem = parent.getNextSibling();
				}
			}
		}catch(VXMLException e){
			throw new VXMLException(e.getMessage());
		}
		// returns null or next unvisited form item or unvisited tag
		return nextItem;
	}


	/**
	 * getNextItem function is the core logic of the form tag children 
	 * @return
	 * returns the captured item to main function
	 * @throws VXMLException TODO
	 */


	public AbstractBaseItem getNextItem() throws VXMLException {

		AbstractBaseItem nextItem = null;
		try{
			if (this.currentItem != null) {

				if (this.currentItem.isFormItem()) {
					nextItem = this.currentItem.execute(this);
				} 
				else {
					if (this.currentItem.getName().equals("if")){
						nextItem = this.currentItem.execute(this);
					} else 
						if (this.currentItem.getName().equals("filled")){
							nextItem = this.currentItem.execute(this);
						}
						else if (this.currentItem.getName().equals("catch")){
							nextItem = this.currentItem.execute(this);
						}
						else if (this.currentItem.getName().equals("throw")){
							nextItem = this.currentItem.execute(this);
						}
						else if(this.currentItem.getName().equals("clear")){
							nextItem = this.currentItem.execute(this);
						}
						else if(this.currentItem.getName().equals("script")){
							nextItem = this.currentItem.execute(this);
						}
						else {
							// non container tag

							nextItem = this.currentItem.execute(this);
						}
				}
			}
		}catch(VXMLException e){
			throw new VXMLException(e.getMessage());
		}
		this.currentItem = nextItem;
		return currentItem;
	}

	public List<FormItem> getFormItems() {
		return formItems;
	}

	public void setFormItems(List<FormItem> formItems) {
		this.formItems = formItems;
	}

	public AbstractBaseItem searchNextUnvisitedFormItem() throws VXMLException{
		AbstractBaseItem nextItem = null;
		try{
			for (FormItem formItem : formItems) {
				if (!formItem.isVisited()) {
					this.currentItem = nextItem;
					nextItem = formItem;
					break;
				}
			}
		}catch(VXMLScriptException e){
			throw new VXMLException(e.getMessage());
		}

		return nextItem;
	}

	public AbstractBaseItem getCurrentItem() {
		return currentItem;
	}

	public void setCurrentItem(AbstractBaseItem currentItem) {
		this.currentItem = currentItem;
	}

	/**
	 * Main function is used to initialize and call
	 * 
	 * @param args 
	 * @throws VXMLException 
	 */

	public static void main(String[] args) throws VXMLException {


		VXMLInterpreter interpreter = new VXMLInterpreter();
		VXMLLoader loader = new VXMLLoader("//Users//Shank//Workspace//VXMLUnit//schema//Sample_copy.vxml", interpreter);

		Vxml vxml = loader.getVxml();

		Form form = null;
		// create a list of vxml children and select the child with form tag

		List<AbstractBaseItem> children = vxml.getChildren();
		for (AbstractBaseItem child : children) {
			if (child.getName().equals("form")) {
				form = (Form) child;
				// initialize the interpreter, valiable tag, script tag, form tag



				interpreter.initializeVariables(vxml);
				interpreter.initializeScript(vxml);
				interpreter.initializeForm(form);

				// calling and printing the captured tags
				try{
					while(true){
						AbstractBaseItem item = interpreter.getNextItem();
						if(item != null)
							System.out.println(item);
						else
							break;
					}
				}catch(VXMLException e){
					e.printStackTrace();	
				}
			}
		}
	}
}
