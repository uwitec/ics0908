package com.mydomain.bean.stockmanage;

import com.mydomain.bean.BaseBean;

public class StockMaxMin extends BaseBean{
	
	private String materielName;
	private String materielCode;
	private double materielMinStore;
	private double materielMaxStore;
	private double stocknum;
	private String materielABC;
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
	 * @return the stocknum
	 */
	public double getStocknum() {
		return stocknum;
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
	 * @param stocknum the stocknum to set
	 */
	public void setStocknum(double stocknum) {
		this.stocknum = stocknum;
	}
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
}
