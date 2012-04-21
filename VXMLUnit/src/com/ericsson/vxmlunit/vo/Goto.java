package com.ericsson.vxmlunit.vo;

import java.io.File;
import java.util.TreeMap;
import org.w3c.dom.Element;
import com.ericsson.vxmlunit.exception.VXMLException;
import com.ericsson.vxmlunit.interpreter.VXMLInterpreter;
import com.ericsson.vxmlunit.vo.base.AbstractBaseItem;
import com.ericsson.vxmlunit.vo.base.FormItem;
import com.ericsson.vxmlunit.vo.base.NonFormItem;

public class Goto extends NonFormItem {

	private String next;
	private String nextitem;
	private String fld;
	private String uri;
	private String expr;
	private String exprItem;

	private TreeMap<String, String> dataMap ;

	private static final String KEY_NEXT = "next";
	private static final String KEY_EXPR = "expr";
	private static final String KEY_NEXTITEM = "nextitem";
	private static final String KEY_EXPRITEM = "expritem";

	public Goto(Element element) throws VXMLException {

		dataMap = new TreeMap<String, String>();

		next = element.getAttribute("next");
		nextitem = element.getAttribute("nextitem");
		expr = element.getAttribute("expr");
		exprItem = element.getAttribute("expritem");

		if(next != null && next.trim().length() > 0){
			dataMap.put(KEY_NEXT, next);
			setNext(next);
		}
		if(expr != null && expr.trim().length() > 0){
			dataMap.put(KEY_EXPR, expr);
			setExpr(expr);
		}
		if(nextitem != null && nextitem.trim().length() > 0) {
			dataMap.put(KEY_NEXTITEM, nextitem);
			setNextItem(nextitem);
		}

		if(exprItem != null && exprItem.trim().length() > 0) {
			dataMap.put(KEY_EXPRITEM, exprItem);
			setExprItem(exprItem);
		}

		if(dataMap.size() != 1) {
			throw new VXMLException("<goto> error: More than one of next, expr, nextitem or expritem found");
		}

		setName("goto");
	}


	public String getNext() {
		return next;
	}


	public void setNext(String next) {
		this.next = next;
	}


	public String getNextItem() {
		return nextitem;
	}


	public void setNextItem(String nextItem) {
		this.nextitem = nextItem;
	}


	public String getExpr() {
		return expr;
	}


	public void setExpr(String expr) {
		this.expr = expr;
	}


	public String getExprItem() {
		return exprItem;
	}


	public void setExprItem(String exprItem) {
		this.exprItem = exprItem;
	}

	public String getFld() {
		return fld;
	}


	public void setFld(String fld) {
		this.fld = fld;
	}

	public String getUri() {
		return uri;
	}

	public void setUri(String uri) {
		this.uri = uri;
	}

	public TreeMap<String, String> getDataMap() {
		return dataMap;
	}

	@Override
	public AbstractBaseItem execute(VXMLInterpreter interpreter) throws VXMLException {
		AbstractBaseItem nextItem = null;

		String firstKey = dataMap.firstKey();
		String value = dataMap.get(firstKey);
		try{
			if(firstKey.equals(KEY_NEXT)){


				String item = value;
				Boolean flag = false; 

				if(item.startsWith("#")){
					String searchFormItem = item.substring(1);

					for(int i=0; i<interpreter.getFormItems().size(); i++ ){
						if(searchFormItem.equals(interpreter.getFormItems().get(i))){
							flag = true;
							break;
						}
					}
				} else if(item.contains("#")){
					int pos = item.indexOf("#");
					String searchFormItem = item.substring(pos+1);
					uri = item.substring(0,pos);
					if(checkStatus(uri)){
						String content = getContentUrl(uri);
						if(content.contains(searchFormItem)){
							flag = true;
						}
					}
				} else{
					if(checkStatus(getNext())){
						flag = true;
					}
				}

				if(flag == true){
					nextItem = super.skip(interpreter);
				} else {
					nextItem = super.execute(interpreter);
				}

			} else if(firstKey.equals(KEY_NEXTITEM)) {

				String item = value;
				String str = null;
				Block bl = null;
				Field fl = null;
				for(int i=0; i<interpreter.getFormItems().size(); i++ ){
					if(interpreter.getFormItems().get(i).getName().equals("block")){
						bl = (Block) interpreter.getFormItems().get(i);
						str = bl.getBlockName(); 
					}
					else if(interpreter.getFormItems().get(i).getName().equals("field")) {
						fl = (Field) interpreter.getFormItems().get(i);
						str = fl.getFieldName();
					}

					if(item.equals(str)){
		
						AbstractBaseItem parent = getParent();
						while(!parent.isFormItem()){
							parent = parent.getParent();
						}
						FormItem formItem = (FormItem) parent;
//						formItem.setGuardCondition("true");
						formItem.setValue("true");
						interpreter.setCurrentItem(interpreter.getFormItems().get(i));
						nextItem = interpreter.getNextItem();
//						break;
//						if(parent.isFormItem()){
//							FormItem formItem = (FormItem) parent;
//							formItem.setValue("true");
//							formItem.setGuardCondition("true");
//						}
//						else{
							
							
//						}
						//						FormItem formItem = (FormItem) interpreter.getFormItems().get(i);
						//						formItem.setValue("true");
						//						interpreter.getFormItems().get(i).setGuardCondition("true");

//						interpreter.setCurrentItem(interpreter.getFormItems().get(i));
//						nextItem = super.execute(interpreter);
//						break;
					}
				}

			}
		} catch (VXMLException e) {
			throw new VXMLException(e.getMessage()); 
		}

		return nextItem;
	}

	//	public boolean check(String... s){
	//		boolean attributeSet = false;
	//		boolean isSingleAttributeSet =true;
	//		
	//		for ( String attribute : s)
	//		{
	//			if ( attribute  != null)
	//			{
	//				attributeSet = true;
	//			}
	//			
	//			if ( attributeSet )
	//			{
	//				if ( attribute != null)
	//				{
	//					isSingleAttributeSet = false;
	//					break;
	//				}
	//			}
	//		}
	//		
	//		return isSingleAttributeSet; 
	//		
	//	}
	//	public AbstractBaseItem executeNextItem(VXMLInterpreter interpreter){
	//		AbstractBaseItem nextItem = null;
	//		String item = getNxtItem();
	//		
	////		String searchFormItem = item.substring(1);
	//		for(int i=0; i<interpreter.getFormItems().size(); i++ ){
	//			if(item.equals(interpreter.getFormItems().get(i))){
	//				FormItem formItem = (FormItem) getParent();
	//				formItem.setValue("true");
	//				interpreter.setCurrentItem(interpreter.getFormItems().get(i));
	//				nextItem = super.execute(interpreter);
	//				break;
	//			}
	//		}
	//		
	//		return nextItem;
	//	}


	public boolean checkStatus(String uri){
		boolean checkStatus;
		File f = new File(uri);
		if(f.exists()){
			checkStatus = true;
		}
		else{
			checkStatus = false;
		}
		return(checkStatus);
	}

	@Override
	public String toString() {
		return "Goto {next = " + next + " : nextitem = " + nextitem + "}";
	}
}

