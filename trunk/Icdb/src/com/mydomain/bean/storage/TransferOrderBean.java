package com.mydomain.bean.storage;

import com.mydomain.bean.BaseBean;

public class TransferOrderBean extends BaseBean{

	private String	transferOrderCode;
	private String	transferOrderTime;
	private String	transferOrderType;
	private String	transferOrderCredence;
	private String	transferOrderChecker;
	private String	transferOrderPerson;
	private int transferState;
	private String storehouseCode;
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
	 * @return the storehouseCode
	 */
	public String getStorehouseCode() {
		return storehouseCode;
	}
	/**
	 * @param storehouseCode the storehouseCode to set
	 */
	public void setStorehouseCode(String storehouseCode) {
		this.storehouseCode = storehouseCode;
	}
	public TransferOrderBean(){
		this.transferOrderType="";
		this.transferOrderCode="";
	}
	/**
	 * @return the transferState
	 */
	public int getTransferState() {
		return transferState;
	}
	/**
	 * @param transferState the transferState to set
	 */
	public void setTransferState(int transferState) {
		this.transferState = transferState;
	}
	/**
	 * @return the transferOrderChecker
	 */
	public String getTransferOrderChecker() {
		return transferOrderChecker;
	}
	/**
	 * @return the transferOrderCode
	 */
	public String getTransferOrderCode() {
		return transferOrderCode;
	}
	/**
	 * @return the transferOrderCredence
	 */
	public String getTransferOrderCredence() {
		return transferOrderCredence;
	}
	/**
	 * @return the transferOrderPerson
	 */
	public String getTransferOrderPerson() {
		return transferOrderPerson;
	}
	/**
	 * @return the transferOrderTime
	 */
	public String getTransferOrderTime() {
		return transferOrderTime;
	}
	/**
	 * @return the transferOrderType
	 */
	public String getTransferOrderType() {
		return transferOrderType;
	}
	/**
	 * @param transferOrderChecker the transferOrderChecker to set
	 */
	public void setTransferOrderChecker(String transferOrderChecker) {
		this.transferOrderChecker = transferOrderChecker;
	}
	/**
	 * @param transferOrderCode the transferOrderCode to set
	 */
	public void setTransferOrderCode(String transferOrderCode) {
		this.transferOrderCode = transferOrderCode;
	}
	/**
	 * @param transferOrderCredence the transferOrderCredence to set
	 */
	public void setTransferOrderCredence(String transferOrderCredence) {
		this.transferOrderCredence = transferOrderCredence;
	}
	/**
	 * @param transferOrderPerson the transferOrderPerson to set
	 */
	public void setTransferOrderPerson(String transferOrderPerson) {
		this.transferOrderPerson = transferOrderPerson;
	}
	/**
	 * @param transferOrderTime the transferOrderTime to set
	 */
	public void setTransferOrderTime(String transferOrderTime) {
		this.transferOrderTime = transferOrderTime;
	}
	/**
	 * @param transferOrderType the transferOrderType to set
	 */
	public void setTransferOrderType(String transferOrderType) {
		this.transferOrderType = transferOrderType;
	}

}
