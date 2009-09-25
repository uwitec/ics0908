package com.mydomain.bean.stockmanage;

import com.mydomain.bean.BaseBean;

public class MaterOutFromBean extends BaseBean{
	private String materielCode;
	private String materielName;
	private String storehouseName;
	private double stockOutAmount;
	private String customerCode;
	private String customerName;
	private String materielABC;
	private String startTime;
	private String endTime;
	
	public MaterOutFromBean(){
		this.materielName="";
		this.storehouseName="";
		this.materielABC="";
		this.customerName="";
		this.customerCode="";
	}

	/**
	 * @return the customerCode
	 */
	public String getCustomerCode() {
		return customerCode;
	}

	/**
	 * @return the customerName
	 */
	public String getCustomerName() {
		return customerName;
	}

	/**
	 * @return the endTime
	 */
	public String getEndTime() {
		return endTime;
	}

	/**
	 * @return the materielABC
	 */
	public String getMaterielABC() {
		return materielABC;
	}

	/**
	 * @return the materielCode
	 */
	public String getMaterielCode() {
		return materielCode;
	}

	/**
	 * @return the materielName
	 */
	public String getMaterielName() {
		return materielName;
	}

	/**
	 * @return the startTime
	 */
	public String getStartTime() {
		return startTime;
	}

	/**
	 * @return the stockOutAmount
	 */
	public double getStockOutAmount() {
		return stockOutAmount;
	}

	/**
	 * @return the storehouseName
	 */
	public String getStorehouseName() {
		return storehouseName;
	}

	/**
	 * @param customerCode the customerCode to set
	 */
	public void setCustomerCode(String customerCode) {
		this.customerCode = customerCode;
	}

	/**
	 * @param customerName the customerName to set
	 */
	public void setCustomerName(String customerName) {
		this.customerName = customerName;
	}

	/**
	 * @param endTime the endTime to set
	 */
	public void setEndTime(String endTime) {
		this.endTime = endTime;
	}

	/**
	 * @param materielABC the materielABC to set
	 */
	public void setMaterielABC(String materielABC) {
		this.materielABC = materielABC;
	}

	/**
	 * @param materielCode the materielCode to set
	 */
	public void setMaterielCode(String materielCode) {
		this.materielCode = materielCode;
	}

	/**
	 * @param materielName the materielName to set
	 */
	public void setMaterielName(String materielName) {
		this.materielName = materielName;
	}

	/**
	 * @param startTime the startTime to set
	 */
	public void setStartTime(String startTime) {
		this.startTime = startTime;
	}

	/**
	 * @param stockOutAmount the stockOutAmount to set
	 */
	public void setStockOutAmount(double stockOutAmount) {
		this.stockOutAmount = stockOutAmount;
	}

	/**
	 * @param storehouseName the storehouseName to set
	 */
	public void setStorehouseName(String storehouseName) {
		this.storehouseName = storehouseName;
	}
	
}
