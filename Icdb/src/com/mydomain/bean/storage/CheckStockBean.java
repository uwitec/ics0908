package com.mydomain.bean.storage;

import com.mydomain.bean.BaseBean;

public class CheckStockBean extends BaseBean{

	private String csCode;
	private String storehouseCode;
	private String storehouseName;
	private String csDate;
	private String csApprove;
	private String csApproveMessage;
	private int csApproveState;
	private String csCheckPerson;
	private String csOptionor;
	private String personName;
	private int csState;
	private int csStartStock;
	/**
	 * @return the csApprove
	 */
	public String getCsApprove() {
		return csApprove;
	}
	/**
	 * @return the csApproveMessage
	 */
	public String getCsApproveMessage() {
		return csApproveMessage;
	}
	
	/**
	 * @return the csCheckPerson
	 */
	public String getCsCheckPerson() {
		return csCheckPerson;
	}
	/**
	 * @return the csCode
	 */
	public String getCsCode() {
		return csCode;
	}
	/**
	 * @return the csDate
	 */
	public String getCsDate() {
		return csDate;
	}
	/**
	 * @return the csOptionor
	 */
	public String getCsOptionor() {
		return csOptionor;
	}
	/**
	 * @return the csStartStock
	 */
	public int getCsStartStock() {
		return csStartStock;
	}
	/**
	 * @return the csState
	 */
	public int getCsState() {
		return csState;
	}
	/**
	 * @return the storehouseCode
	 */
	public String getStorehouseCode() {
		return storehouseCode;
	}
	/**
	 * @return the storehouseName
	 */
	public String getStorehouseName() {
		return storehouseName;
	}
	/**
	 * @param csApprove the csApprove to set
	 */
	public void setCsApprove(String csApprove) {
		this.csApprove = csApprove;
	}
	/**
	 * @param csApproveMessage the csApproveMessage to set
	 */
	public void setCsApproveMessage(String csApproveMessage) {
		this.csApproveMessage = csApproveMessage;
	}
	
	/**
	 * @return the csApproveState
	 */
	public int getCsApproveState() {
		return csApproveState;
	}
	/**
	 * @param csApproveState the csApproveState to set
	 */
	public void setCsApproveState(int csApproveState) {
		this.csApproveState = csApproveState;
	}
	/**
	 * @param csCheckPerson the csCheckPerson to set
	 */
	public void setCsCheckPerson(String csCheckPerson) {
		this.csCheckPerson = csCheckPerson;
	}
	/**
	 * @param csCode the csCode to set
	 */
	public void setCsCode(String csCode) {
		this.csCode = csCode;
	}
	/**
	 * @param csDate the csDate to set
	 */
	public void setCsDate(String csDate) {
		this.csDate = csDate;
	}
	/**
	 * @param csOptionor the csOptionor to set
	 */
	public void setCsOptionor(String csOptionor) {
		this.csOptionor = csOptionor;
	}
	/**
	 * @param csStartStock the csStartStock to set
	 */
	public void setCsStartStock(int csStartStock) {
		this.csStartStock = csStartStock;
	}
	/**
	 * @param csState the csState to set
	 */
	public void setCsState(int csState) {
		this.csState = csState;
	}
	/**
	 * @param storehouseCode the storehouseCode to set
	 */
	public void setStorehouseCode(String storehouseCode) {
		this.storehouseCode = storehouseCode;
	}
	/**
	 * @param storehouseName the storehouseName to set
	 */
	public void setStorehouseName(String storehouseName) {
		this.storehouseName = storehouseName;
	}
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
}
