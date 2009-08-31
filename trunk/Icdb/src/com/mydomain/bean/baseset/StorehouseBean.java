package com.mydomain.bean.baseset;
/*
 * 库房BEAN
 * */
public class StorehouseBean {

	private String storehouseCode; //库房编码
	private String storehouseName; //库房名称
	private String storehouseAddress; //库房地址
	private String storehouseDefaultCargo; //默认货位
	private String employeeCode; //管理员编码
	private String personName;
	/**
	 * @return the personName
	 */
	public String getPersonName() {
		return personName;
	}
	/**
	 * @param personName the personName to set
	 */
	public void setPersonName(String personName) {
		this.personName = personName;
	}
	/**
	 * @return the employeeCode
	 */
	public String getEmployeeCode() {
		return employeeCode;
	}
	/**
	 * @return the storehouseAddress
	 */
	public String getStorehouseAddress() {
		return storehouseAddress;
	}
	/**
	 * @return the storehouseCode
	 */
	public String getStorehouseCode() {
		return storehouseCode;
	}
	/**
	 * @return the storehouseDefaultCargo
	 */
	public String getStorehouseDefaultCargo() {
		return storehouseDefaultCargo;
	}
	/**
	 * @return the storehouseName
	 */
	public String getStorehouseName() {
		return storehouseName;
	}
	/**
	 * @param employeeCode the employeeCode to set
	 */
	public void setEmployeeCode(String employeeCode) {
		this.employeeCode = employeeCode;
	}
	/**
	 * @param storehouseAddress the storehouseAddress to set
	 */
	public void setStorehouseAddress(String storehouseAddress) {
		this.storehouseAddress = storehouseAddress;
	}
	/**
	 * @param storehouseCode the storehouseCode to set
	 */
	public void setStorehouseCode(String storehouseCode) {
		this.storehouseCode = storehouseCode;
	}
	/**
	 * @param storehouseDefaultCargo the storehouseDefaultCargo to set
	 */
	public void setStorehouseDefaultCargo(String storehouseDefaultCargo) {
		this.storehouseDefaultCargo = storehouseDefaultCargo;
	}
	/**
	 * @param storehouseName the storehouseName to set
	 */
	public void setStorehouseName(String storehouseName) {
		this.storehouseName = storehouseName;
	}
}
