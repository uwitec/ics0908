package com.mydomain.bean.baseset;

import com.mydomain.bean.BaseBean;

/*
 * ��λBEAN
 * */
public class CargoSpaceBean extends BaseBean{
	private String cargoSpaceCode; //��λ����
	private String cargoSpaceName; //��λ����
	private String cargoSpaceAddress; //��λ��ַ
	private String storehouseCode; //�ⷿ����
	private String storehouseName;
	/**
	 * @return the storehouseName
	 */
	public String getStorehouseName() {
		return storehouseName;
	}
	/**
	 * @param storehouseName the storehouseName to set
	 */
	public void setStorehouseName(String storehouseName) {
		this.storehouseName = storehouseName;
	}
	/**
	 * @return the cargoSpaceAddress
	 */
	public String getCargoSpaceAddress() {
		return cargoSpaceAddress;
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
	 * @return the storehouseCode
	 */
	public String getStorehouseCode() {
		return storehouseCode;
	}
	/**
	 * @param cargoSpaceAddress the cargoSpaceAddress to set
	 */
	public void setCargoSpaceAddress(String cargoSpaceAddress) {
		this.cargoSpaceAddress = cargoSpaceAddress;
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
	 * @param storehouseCode the storehouseCode to set
	 */
	public void setStorehouseCode(String storehouseCode) {
		this.storehouseCode = storehouseCode;
	}
}
