package com.mydomain.bean.storage;

import com.mydomain.bean.BaseBean;

public class TransferOrderHasMaterielBean extends BaseBean{

	private String	transferOrderCode;
	private String	newcargoSpaceCode;
	private String	newcargoSpaceName;
	private String	cargoSpaceCode;
	private String	cargoSpaceName;
	private String	materielCode;
	private String	materielName;
	private double	moveAmount;
	private String  str_mouveAmoutn;
	private String  stockAmount;
	private String 	stockPrice;
	/**
	 * @return the stockAmount
	 */
	public String getStockAmount() {
		return stockAmount;
	}
	/**
	 * @param stockAmount the stockAmount to set
	 */
	public void setStockAmount(String stockAmount) {
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
	 * @return the materielCode
	 */
	public String getMaterielCode() {
		return materielCode;
	}
	
	/**
	 * @return the moveAmount
	 */
	public double getMoveAmount() {
		return moveAmount;
	}
	/**
	 * @return the newcargoSpaceCode
	 */
	public String getNewcargoSpaceCode() {
		return newcargoSpaceCode;
	}
	/**
	 * @return the newcargoSpaceName
	 */
	public String getNewcargoSpaceName() {
		return newcargoSpaceName;
	}
	/**
	 * @return the transferOrderCode
	 */
	public String getTransferOrderCode() {
		return transferOrderCode;
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
	 * @param materielCode the materielCode to set
	 */
	public void setMaterielCode(String materielCode) {
		this.materielCode = materielCode;
	}

	/**
	 * @return the materielName
	 */
	public String getMaterielName() {
		return materielName;
	}
	/**
	 * @param materielName the materielName to set
	 */
	public void setMaterielName(String materielName) {
		this.materielName = materielName;
	}
	/**
	 * @param moveAmount the moveAmount to set
	 */
	public void setMoveAmount(double moveAmount) {
		this.moveAmount = moveAmount;
	}
	/**
	 * @param newcargoSpaceCode the newcargoSpaceCode to set
	 */
	public void setNewcargoSpaceCode(String newcargoSpaceCode) {
		this.newcargoSpaceCode = newcargoSpaceCode;
	}
	/**
	 * @param newcargoSpaceName the newcargoSpaceName to set
	 */
	public void setNewcargoSpaceName(String newcargoSpaceName) {
		this.newcargoSpaceName = newcargoSpaceName;
	}
	/**
	 * @param transferOrderCode the transferOrderCode to set
	 */
	public void setTransferOrderCode(String transferOrderCode) {
		this.transferOrderCode = transferOrderCode;
	}
	/**
	 * @return the str_mouveAmoutn
	 */
	public String getStr_mouveAmoutn() {
		return str_mouveAmoutn;
	}
	/**
	 * @param str_mouveAmoutn the str_mouveAmoutn to set
	 */
	public void setStr_mouveAmoutn(String str_mouveAmoutn) {
		this.str_mouveAmoutn = str_mouveAmoutn;
	}
	/**
	 * @return the stockPrice
	 */
	public String getStockPrice() {
		return stockPrice;
	}
	/**
	 * @param stockPrice the stockPrice to set
	 */
	public void setStockPrice(String stockPrice) {
		this.stockPrice = stockPrice;
	}

}
