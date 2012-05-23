package com.ericsson.vxmlunit.vo.base;

import java.util.Collections;
import java.util.List;
import java.util.Stack;

public class SortedStack<T extends Comparable<T>> extends Stack<T> {

	private static final long serialVersionUID = -703856331285163143L;

	@Override
	public T push(T paramE) {
		T insertedObject = super.push(paramE);
		Collections.sort((List<T>)this);
		return insertedObject;
	}

	
}
