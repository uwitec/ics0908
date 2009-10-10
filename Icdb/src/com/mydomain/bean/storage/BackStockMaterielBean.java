package com.mydomain.bean.storage;

public class BackStockMaterielBean {

	private String backOrderCode;
	private String materielCode;
	private String materielName;
	private String cargoSpaceCode;
	private String cargoSpaceName;
	private double materelCount;
	private double materelPrice;
	private String str_materelCount;
	private String str_materelPrice;
	/**
	 * @return the backOrderCode
	 */
	public String getBackOrderCode() {
		return backOrderCode;
	}
	/**
	 * @return the materelCount
	 */
	public double getMaterelCount() {
		return materelCount;
	}
	/**
	 * @return the materelPrice
	 */
	public double getMaterelPrice() {
		return materelPrice;
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
	 * @return the str_materelCount
	 */
	public String getStr_materelCount() {
		return str_materelCount;
	}
	/**
	 * @return the str_materelPrice
	 */
	public String getStr_materelPrice() {
		return str_materelPrice;
	}
	/**
	 * @param backOrderCode the backOrderCode to set
	 */
	public void setBackOrderCode(String backOrderCode) {
		this.backOrderCode = backOrderCode;
	}
	/**
	 * @param materelCount the materelCount to set
	 */
	public void setMaterelCount(double materelCount) {
		this.materelCount = materelCount;
	}
	/**
	 * @param materelPrice the materelPrice to set
	 */
	public void setMaterelPrice(double materelPrice) {
		this.materelPrice = materelPrice;
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
	 * @param str_materelCount the str_materelCount to set
	 */
	public void setStr_materelCount(String str_materelCount) {
		this.str_materelCount = str_materelCount;
	}
	/**
	 * @param str_materelPrice the str_materelPrice to set
	 */
	public void setStr_materelPrice(String str_materelPrice) {
		this.str_materelPrice = str_materelPrice;
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
