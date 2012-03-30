package com.ericsson.vxmlunit.vo.base;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.ArrayList;
import java.util.List;
import java.util.Stack;
import com.ericsson.vxmlunit.vo.Catch;
import com.ericsson.vxmlunit.exception.VXMLException;
import com.ericsson.vxmlunit.interpreter.VXMLInterpreter;

public abstract class AbstractBaseItem {

	private String name;
	private AbstractBaseItem parent;
	private List<AbstractBaseItem> children;
	private StringBuilder content;
	private AbstractBaseItem nextSibling;
	private AbstractBaseItem firstChild;
	protected Stack<Catch> catchStack;
	
	public Stack<Catch> getCatchStack() {
		if(name.equals("field") || name.equals("form") || name.equals("vxml")) {
			return catchStack;
		} else {
			return parent.getCatchStack();
		}
	}

	public void setCatchStack() {
		
	}

	public AbstractBaseItem() {
		this.children = new ArrayList<AbstractBaseItem>();
	}
	
	public AbstractBaseItem getParent() {
		return parent;
	}
	public void setParent(AbstractBaseItem parent) {
		this.parent = parent;
	}
	public List<AbstractBaseItem> getChildren() {
		return children;
	}
	public void setChildren(List<AbstractBaseItem> children) {
		this.children = children;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	
	public AbstractBaseItem getNextSibling() {
		return nextSibling;
	}

	public void setNextSibling(AbstractBaseItem nextSibling) {
		this.nextSibling = nextSibling;
	}

	public AbstractBaseItem getFirstChild() {
		return firstChild;
	}

	public void setFirstChild(AbstractBaseItem firstChild) {
		this.firstChild = firstChild;
	}

	public boolean isFormItem() {
		if (name.equals("block") || name.equals("field") || name.equals("subdialog"))
			return true;
		return false;
	}
	
	public boolean isCapturedItem() {
		if (name.equals("audio") || name.equals("field") || name.equals("subdialog") || name.equals("data") || name.equals("prompt") || name.equals("goto"))
			return true;
		return false;
	}
	
	public boolean isPostEventItem(){
		if (name.equals("filled") || name.equals("catch"))
			return true;
		return false;
	}
	
	public AbstractBaseItem execute(VXMLInterpreter interpreter) throws VXMLException {
		AbstractBaseItem nextItem = null;
		
		if(children.size() > 0) 
			nextItem = interpreter.checkNull(firstChild);
		else
			nextItem = interpreter.checkNull(nextSibling);

		if(nextItem != null && !nextItem.isCapturedItem()) {
			interpreter.setCurrentItem(nextItem);
			nextItem = interpreter.getNextItem();
		}
		
		return nextItem;
	}
	
	public AbstractBaseItem skip(VXMLInterpreter interpreter) throws VXMLException{
		
		AbstractBaseItem nextItem = interpreter.checkNull(nextSibling);

		if(nextItem != null && !nextItem.isCapturedItem()) {
			interpreter.setCurrentItem(nextItem);
			nextItem = interpreter.getNextItem();
		}
		return nextItem;
	}
	
	public String getContentUrl(String scriptSrc){
		
		content = new StringBuilder();
		try {

			URL url = new URL(scriptSrc);
			
			BufferedReader in = new BufferedReader(new InputStreamReader(url.openStream()));
			String inputLine;
			while ((inputLine = in.readLine()) != null){
				content.append(inputLine);
				content.append("\n");
			}
			in.close();

		} catch (MalformedURLException e) {
			e.printStackTrace();
		} catch (IOException e){
			e.printStackTrace();
		}
		
		return content.toString();
	}
	
	public String check(String... s) {
		
		String returnValue = null;
		
		boolean attributeSet = false;
		String isSingleAttributeSet = "true";
		int i;
		
		for ( i=0 ; i<s.length; i++)
		{
			if ( s[i]  != null && s[i].length() > 0)
			{
				attributeSet = true;
				break;
			}
		}
		for ( int j=i; j<s.length; j++)
		{
			if ( attributeSet )
			{
				if ( s[j] != null && s[j].length() > 0)
				{
					isSingleAttributeSet = "false";
					break;
				}
			}
		}
		
		if(isSingleAttributeSet.equals("true")){
			returnValue = s[i];
		}

		return returnValue;
	}
}
