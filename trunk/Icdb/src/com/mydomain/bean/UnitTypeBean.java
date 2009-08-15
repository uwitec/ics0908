package com.mydomain.bean;
/*
 * 单位类型
 * */
public class UnitTypeBean {

	
	private int unitTypeCode; //单位类型编码
	private String unitTypeName; //单位类型名称
	private String unitTypeRemark; //单位类型说明
	/**
	 * @return the unitTypeCode
	 */
	public int getUnitTypeCode() {
		return unitTypeCode;
	}
	/**
	 * @return the unitTypeName
	 */
	public String getUnitTypeName() {
		return unitTypeName;
	}
	/**
	 * @return the unitTypeRemark
	 */
	public String getUnitTypeRemark() {
		return unitTypeRemark;
	}
	/**
	 * @param unitTypeCode the unitTypeCode to set
	 */
	public void setUnitTypeCode(int unitTypeCode) {
		this.unitTypeCode = unitTypeCode;
	}
	/**
	 * @param unitTypeName the unitTypeName to set
	 */
	public void setUnitTypeName(String unitTypeName) {
		this.unitTypeName = unitTypeName;
	}
	/**
	 * @param unitTypeRemark the unitTypeRemark to set
	 */
	public void setUnitTypeRemark(String unitTypeRemark) {
		this.unitTypeRemark = unitTypeRemark;
	}
}
