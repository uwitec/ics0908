package com.mydomain.bean.baseset;

import com.mydomain.bean.BaseBean;

/*
 * 机构BEAN
 * */
public class StructBean extends BaseBean{

	private String structCode; //机构编码
	private String structName; //机构名称
	/**
	 * @return the structCode
	 */
	public String getStructCode() {
		return structCode;
	}
	/**
	 * @return the structName
	 */
	public String getStructName() {
		return structName;
	}
	/**
	 * @param structCode the structCode to set
	 */
	public void setStructCode(String structCode) {
		this.structCode = structCode;
	}
	/**
	 * @param structName the structName to set
	 */
	public void setStructName(String structName) {
		this.structName = structName;
	}
}
