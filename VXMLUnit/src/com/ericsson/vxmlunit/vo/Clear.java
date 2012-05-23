package com.ericsson.vxmlunit.vo;

import com.ericsson.vxmlunit.exception.VXMLException;
import com.ericsson.vxmlunit.interpreter.VXMLInterpreter;
import com.ericsson.vxmlunit.vo.base.AbstractBaseItem;
import com.ericsson.vxmlunit.vo.base.FormItem;
import com.ericsson.vxmlunit.vo.base.NonFormItem;
import com.ericsson.vxmlunit.vo.Block;
import com.ericsson.vxmlunit.vo.Subdialog;
import com.ericsson.vxmlunit.vo.Field;
import org.w3c.dom.Element;

public class Clear extends NonFormItem{

	private String nameList;
	Block block;
	Subdialog subd;
	Field field;

	public Clear(Element element){
		nameList = element.getAttribute("namelist");

		if(nameList == null || nameList.equals(""))
			setNameList("null");
		else{
			setNameList(nameList);
			//			if(nameList.equals(block.getName()))
			//				block.setGuardCondition("true");
			//			else if(nameList.equals(field.getName()))
			//				field.setGuardCondition("true");
			//			else if(nameList.equals(subd.getName()))
			//				subd.setGuardCondition("true");
		}

		setName("clear");
	}


	@Override
	public AbstractBaseItem execute(VXMLInterpreter interpreter) throws VXMLException {
		// clear multiple namelist items
		AbstractBaseItem nextItem = null;

		String source = getNameList();
		String[] sourcelist = source.split("\\s+");
		String target = null;
		FormItem item = null;

		for(int j=0; j<sourcelist.length; j++){

			for(int i=0; i< interpreter.getFormItems().size(); i++){
				item = (FormItem) interpreter.getFormItems().get(i);


				if(item.getName().equals("block")){
					Block bl = (Block) item;
					target = bl.getBlockName();  
				}

				else if(item.getName().equals("field")){
					Field fl = (Field) item;
					target = fl.getFieldName();
				}

				else if(item.getName().equals("subdialog")){
					Subdialog sd = (Subdialog) item;
					target = sd.getSubName();
				}

				if(sourcelist[j].equals(target)){
					item.setValue(null);
				}
			}
		}



		return super.skip(interpreter);
	}


	public String getNameList() {
		return nameList;
	}


	public void setNameList(String nameList) {
		this.nameList = nameList;
	}

	@Override
	public String toString() {
		return "Clear {NameList = " + nameList + "}";
	}
}
