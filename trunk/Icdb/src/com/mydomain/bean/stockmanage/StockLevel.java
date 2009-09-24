package com.mydomain.bean.stockmanage;

import com.mydomain.bean.BaseBean;

public class StockLevel extends BaseBean{
	
	
	private String materielName;
	private String materielCode;
	private double materielMinStore;
	private double materielMaxStore;
	private double smxiao;
	private String materielABC;
	private String startTime;
	private String endTime;
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
	 * @return the materielMaxStore
	 */
	public double getMaterielMaxStore() {
		return materielMaxStore;
	}
	/**
	 * @return the materielMinStore
	 */
	public double getMaterielMinStore() {
		return materielMinStore;
	}
	/**
	 * @return the materielName
	 */
	public String getMaterielName() {
		return materielName;
	}
	/**
	 * @return the smxiao
	 */
	public double getSmxiao() {
		return smxiao;
	}
	/**
	 * @return the startTime
	 */
	public String getStartTime() {
		return startTime;
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
	 * @param materielMaxStore the materielMaxStore to set
	 */
	public void setMaterielMaxStore(double materielMaxStore) {
		this.materielMaxStore = materielMaxStore;
	}
	/**
	 * @param materielMinStore the materielMinStore to set
	 */
	public void setMaterielMinStore(double materielMinStore) {
		this.materielMinStore = materielMinStore;
	}
	/**
	 * @param materielName the materielName to set
	 */
	public void setMaterielName(String materielName) {
		this.materielName = materielName;
	}
	/**
	 * @param smxiao the smxiao to set
	 */
	public void setSmxiao(double smxiao) {
		this.smxiao = smxiao;
	}
	/**
	 * @param startTime the startTime to set
	 */
	public void setStartTime(String startTime) {
		this.startTime = startTime;
	}
}
