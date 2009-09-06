package com.mydomain.bean.storage;

import com.mydomain.bean.BaseBean;

public class StockBean extends BaseBean{

	private String	cargoSpaceCode;
	private String	cargoSpaceName;
	private String	materielCode;
	private String	materielName;
	private double	stockPrice;
	private String	stockAmount;
	private String	jsonField;
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
	 * @return the stockAmount
	 */
	public String getStockAmount() {
		return stockAmount;
	}
	/**
	 * @return the stockPrice
	 */
	public double getStockPrice() {
		return stockPrice;
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
	 * @param stockAmount the stockAmount to set
	 */
	public void setStockAmount(String stockAmount) {
		this.stockAmount = stockAmount;
	}
	/**
	 * @param stockPrice the stockPrice to set
	 */
	public void setStockPrice(double stockPrice) {
		this.stockPrice = stockPrice;
	}

}
