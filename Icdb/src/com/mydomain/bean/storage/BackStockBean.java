package com.mydomain.bean.storage;

import com.mydomain.bean.BaseBean;

public class BackStockBean extends BaseBean{

	private String backOrderCode;
	private String stockOutOrderCode;
	private String stockOutDate;
	private String stockOutOptionor;
	private int stockOutState;
	private String stockPersion;
	private String startTime;
	private String endTime;
	/**
	 * @return the endTime
	 */
	public String getEndTime() {
		return endTime;
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
	 * @param startTime the startTime to set
	 */
	public void setStartTime(String startTime) {
		this.startTime = startTime;
	}
	/**
	 * @return the backOrderCode
	 */
	public String getBackOrderCode() {
		return backOrderCode;
	}
	/**
	 * @return the stockOutDate
	 */
	public String getStockOutDate() {
		return stockOutDate;
	}
	/**
	 * @return the stockOutOptionor
	 */
	public String getStockOutOptionor() {
		return stockOutOptionor;
	}
	/**
	 * @return the stockOutOrderCode
	 */
	public String getStockOutOrderCode() {
		return stockOutOrderCode;
	}
	/**
	 * @return the stockOutState
	 */
	public int getStockOutState() {
		return stockOutState;
	}
	/**
	 * @return the stockPersion
	 */
	public String getStockPersion() {
		return stockPersion;
	}
	/**
	 * @param backOrderCode the backOrderCode to set
	 */
	public void setBackOrderCode(String backOrderCode) {
		this.backOrderCode = backOrderCode;
	}
	/**
	 * @param stockOutDate the stockOutDate to set
	 */
	public void setStockOutDate(String stockOutDate) {
		this.stockOutDate = stockOutDate;
	}
	/**
	 * @param stockOutOptionor the stockOutOptionor to set
	 */
	public void setStockOutOptionor(String stockOutOptionor) {
		this.stockOutOptionor = stockOutOptionor;
	}
	/**
	 * @param stockOutOrderCode the stockOutOrderCode to set
	 */
	public void setStockOutOrderCode(String stockOutOrderCode) {
		this.stockOutOrderCode = stockOutOrderCode;
	}
	/**
	 * @param stockOutState the stockOutState to set
	 */
	public void setStockOutState(int stockOutState) {
		this.stockOutState = stockOutState;
	}
	/**
	 * @param stockPersion the stockPersion to set
	 */
	public void setStockPersion(String stockPersion) {
		this.stockPersion = stockPersion;
	}
}
