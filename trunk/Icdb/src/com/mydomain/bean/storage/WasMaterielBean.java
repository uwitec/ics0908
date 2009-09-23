package com.mydomain.bean.storage;

import com.mydomain.bean.BaseBean;

public class WasMaterielBean extends BaseBean{

	private String wasCode;
	private String materielCode;
	private String materielName;
	private String wasNumber;
	private String wasMoney;
	private String wasCause;
	private String cargoSpaceCode;
	private String cargoSpaceName;
	private double stockAmount;
	
	/**
	 * @return the stockAmount
	 */
	public double getStockAmount() {
		return stockAmount;
	}
	/**
	 * @param stockAmount the stockAmount to set
	 */
	public void setStockAmount(double stockAmount) {
		this.stockAmount = stockAmount;
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
	 * @return the wasCause
	 */
	public String getWasCause() {
		return wasCause;
	}
	/**
	 * @return the wasCode
	 */
	public String getWasCode() {
		return wasCode;
	}
	/**
	 * @return the wasMoney
	 */
	public String getWasMoney() {
		return wasMoney;
	}
	/**
	 * @return the wasNumber
	 */
	public String getWasNumber() {
		return wasNumber;
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
	 * @param wasCause the wasCause to set
	 */
	public void setWasCause(String wasCause) {
		this.wasCause = wasCause;
	}
	/**
	 * @param wasCode the wasCode to set
	 */
	public void setWasCode(String wasCode) {
		this.wasCode = wasCode;
	}
	/**
	 * @param wasMoney the wasMoney to set
	 */
	public void setWasMoney(String wasMoney) {
		this.wasMoney = wasMoney;
	}
	/**
	 * @param wasNumber the wasNumber to set
	 */
	public void setWasNumber(String wasNumber) {
		this.wasNumber = wasNumber;
	}
}
