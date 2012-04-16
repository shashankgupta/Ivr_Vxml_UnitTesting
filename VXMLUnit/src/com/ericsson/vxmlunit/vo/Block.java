package com.ericsson.vxmlunit.vo;

import org.w3c.dom.Element;

import com.ericsson.vxmlunit.exception.VXMLScriptException;
import com.ericsson.vxmlunit.vo.base.FormItem;

public class Block extends FormItem {

	private String blockName;
//	private Boolean visitStatus;
	
	private static int BLOCK_COUNTER = 0;

	public Block(Element element) {

		String blockName = element.getAttribute("name");
		if(blockName == null || blockName.equals(""))
			setName("block_" + BLOCK_COUNTER++);
		else
			setBlockName(blockName);

		setExpr(element.getAttribute("expr"));

		setGuardCondition(element.getAttribute("cond"));


		setName("block");
	}

	public String getBlockName() {
		return blockName;
	}

	public void setBlockName(String blockName) {
		this.blockName = blockName;
	}

	@Override
	public String toString(){
		return "BLOCK {name = " + blockName + " value : " + value +" : expr = " + expr  + " : cond = " + guardcondition + "}";
	}	
}
