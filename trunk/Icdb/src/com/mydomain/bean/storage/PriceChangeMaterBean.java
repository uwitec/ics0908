package com.mydomain.bean.storage;

public class PriceChangeMaterBean {
	
	private String materielCode;
	private String materielName;
	private String cargoSpaceCode;
	private String cargoSpaceName;
	private String pchangeCode;
	private double stockPriceOld;
	private double stockPriceNew;
	private String jsonField;
	private String str_stockPriceOld;
	private String str_stockPriceNew;
	/**
	 * @return the jsonField
	 */
	public String getJsonField() {
		return jsonField;
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
	 * @return the pchangeCode
	 */
	public String getPchangeCode() {
		return pchangeCode;
	}
	/**
	 * @return the stockPriceNew
	 */
	public double getStockPriceNew() {
		return stockPriceNew;
	}
	/**
	 * @return the stockPriceOld
	 */
	public double getStockPriceOld() {
		return stockPriceOld;
	}
	/**
	 * @return the str_stockPriceNew
	 */
	public String getStr_stockPriceNew() {
		return str_stockPriceNew;
	}
	/**
	 * @return the str_stockPriceOld
	 */
	public String getStr_stockPriceOld() {
		return str_stockPriceOld;
	}
	/**
	 * @param jsonField the jsonField to set
	 */
	public void setJsonField(String jsonField) {
		this.jsonField = jsonField;
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
	 * @param pchangeCode the pchangeCode to set
	 */
	public void setPchangeCode(String pchangeCode) {
		this.pchangeCode = pchangeCode;
	}
	/**
	 * @param stockPriceNew the stockPriceNew to set
	 */
	public void setStockPriceNew(double stockPriceNew) {
		this.stockPriceNew = stockPriceNew;
	}
	/**
	 * @param stockPriceOld the stockPriceOld to set
	 */
	public void setStockPriceOld(double stockPriceOld) {
		this.stockPriceOld = stockPriceOld;
	}
	/**
	 * @param str_stockPriceNew the str_stockPriceNew to set
	 */
	public void setStr_stockPriceNew(String str_stockPriceNew) {
		this.str_stockPriceNew = str_stockPriceNew;
	}
	/**
	 * @param str_stockPriceOld the str_stockPriceOld to set
	 */
	public void setStr_stockPriceOld(String str_stockPriceOld) {
		this.str_stockPriceOld = str_stockPriceOld;
	}
	/**
	 * @return the cargoSpaceCode
	 */
	public String getCargoSpaceCode() {
		return cargoSpaceCode;
	}
	/**
	 * @return the cargoSpaceName
	 */
	public String getCargoSpaceName() {
		return cargoSpaceName;
	}
	/**
	 * @param cargoSpaceCode the cargoSpaceCode to set
	 */
	public void setCargoSpaceCode(String cargoSpaceCode) {
		this.cargoSpaceCode = cargoSpaceCode;
	}
	/**
	 * @param cargoSpaceName the cargoSpaceName to set
	 */
	public void setCargoSpaceName(String cargoSpaceName) {
		this.cargoSpaceName = cargoSpaceName;
	}
}
