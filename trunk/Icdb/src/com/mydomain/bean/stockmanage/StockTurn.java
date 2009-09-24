package com.mydomain.bean.stockmanage;

import com.mydomain.bean.BaseBean;

public class StockTurn extends BaseBean{
	private String materielCode;
	private String materielName;
	private double inamount;
	private double outamount;
	private String startTime;
	private String endTime;
	private String materielABC;
	
	/**
	 * @return the materielABC
	 */
	public String getMaterielABC() {
		return materielABC;
	}
	/**
	 * @param materielABC the materielABC to set
	 */
	public void setMaterielABC(String materielABC) {
		this.materielABC = materielABC;
	}
	/**
	 * @return the endTime
	 */
	public String getEndTime() {
		return endTime;
	}
	/**
	 * @return the inamount
	 */
	public double getInamount() {
		return inamount;
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
	 * @return the outamount
	 */
	public double getOutamount() {
		return outamount;
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
	 * @param inamount the inamount to set
	 */
	public void setInamount(double inamount) {
		this.inamount = inamount;
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
	 * @param outamount the outamount to set
	 */
	public void setOutamount(double outamount) {
		this.outamount = outamount;
	}
	/**
	 * @param startTime the startTime to set
	 */
	public void setStartTime(String startTime) {
		this.startTime = startTime;
	}

}
