package com.mydomain.bean.stockmanage;

import com.mydomain.bean.BaseBean;

public class MaterInFromBean extends BaseBean{
	
	private String materielCode;
	private String materielName;
	private String storehouseName;
	private double lastamount;
	private String supplierName;
	private String materielABC;
	private String startTime;
	private String endTime;
	
	public MaterInFromBean(){
		this.materielName="";
		this.storehouseName="";
		this.supplierName="";
		this.materielABC="";
	}
	/**
	 * @return the endTime
	 */
	public String getEndTime() {
		return endTime;
	}
	/**
	 * @return the lastamount
	 */
	public double getLastamount() {
		return lastamount;
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
	 * @return the storehouseName
	 */
	public String getStorehouseName() {
		return storehouseName;
	}
	/**
	 * @return the supplierName
	 */
	public String getSupplierName() {
		return supplierName;
	}
	/**
	 * @param endTime the endTime to set
	 */
	public void setEndTime(String endTime) {
		this.endTime = endTime;
	}
	/**
	 * @param lastamount the lastamount to set
	 */
	public void setLastamount(double lastamount) {
		this.lastamount = lastamount;
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
	 * @param storehouseName the storehouseName to set
	 */
	public void setStorehouseName(String storehouseName) {
		this.storehouseName = storehouseName;
	}
	/**
	 * @param supplierName the supplierName to set
	 */
	public void setSupplierName(String supplierName) {
		this.supplierName = supplierName;
	}
	
}
