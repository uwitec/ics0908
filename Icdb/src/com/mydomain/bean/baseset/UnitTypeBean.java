package com.mydomain.bean.baseset;

import com.mydomain.bean.BaseBean;

/*
 * ��λ����
 * */
public class UnitTypeBean extends BaseBean{


	private int unitTypeCode; //��λ���ͱ���
	private String unitTypeName; //��λ������ￄ1�7
	private String unitTypeRemark; //��λ����˵��
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
