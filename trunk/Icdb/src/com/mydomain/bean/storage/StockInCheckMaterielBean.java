package com.mydomain.bean.storage;

import java.util.Date;

public class StockInCheckMaterielBean {
	private String materielCode;
	private String supplierCode;
	private String cargoSpaceCode;
	private String stockInCode;
	private Float amountPercent;
	private Float qualityPercent;
	private Date checkTime;
	private Float packagePercent;
	private Float errorStockPercent;
	private String checkNote;
	private Integer checkAmount;
	private String checkRemark;
	private Integer lastAmount;
	private Float stockInAmount;
	private Float onePrice;
	private Integer stockInType;

	private String materielName;
	private String materielSize;
	private String materielABC;
	private String cargoSpaceName;

	public String getMaterielCode() {
		return materielCode;
	}

	public void setMaterielCode(String materielCode) {
		this.materielCode = materielCode;
	}

	public String getSupplierCode() {
		return supplierCode;
	}

	public void setSupplierCode(String supplierCode) {
		this.supplierCode = supplierCode;
	}

	public String getCargoSpaceCode() {
		return cargoSpaceCode;
	}

	public void setCargoSpaceCode(String cargoSpaceCode) {
		this.cargoSpaceCode = cargoSpaceCode;
	}

	public String getStockInCode() {
		return stockInCode;
	}

	public void setStockInCode(String stockInCode) {
		this.stockInCode = stockInCode;
	}

	public Date getCheckTime() {
		return checkTime;
	}

	public void setCheckTime(Date checkTime) {
		this.checkTime = checkTime;
	}

	public String getCheckNote() {
		return checkNote;
	}

	public void setCheckNote(String checkNote) {
		this.checkNote = checkNote;
	}

	public Integer getCheckAmount() {
		return checkAmount;
	}

	public void setCheckAmount(Integer checkAmount) {
		this.checkAmount = checkAmount;
	}

	public String getCheckRemark() {
		return checkRemark;
	}

	public void setCheckRemark(String checkRemark) {
		this.checkRemark = checkRemark;
	}

	public Integer getLastAmount() {
		return lastAmount;
	}

	public void setLastAmount(Integer lastAmount) {
		this.lastAmount = lastAmount;
	}

	public Integer getStockInType() {
		return stockInType;
	}

	public void setStockInType(Integer stockInType) {
		this.stockInType = stockInType;
	}

	public String getMaterielName() {
		return materielName;
	}

	public void setMaterielName(String materielName) {
		this.materielName = materielName;
	}

	public String getMaterielSize() {
		return materielSize;
	}

	public void setMaterielSize(String materielSize) {
		this.materielSize = materielSize;
	}

	public String getMaterielABC() {
		return materielABC;
	}

	public void setMaterielABC(String materielABC) {
		this.materielABC = materielABC;
	}

	public Float getAmountPercent() {
		return amountPercent;
	}

	public void setAmountPercent(Float amountPercent) {
		this.amountPercent = amountPercent;
	}

	public Float getQualityPercent() {
		return qualityPercent;
	}

	public void setQualityPercent(Float qualityPercent) {
		this.qualityPercent = qualityPercent;
	}

	public Float getPackagePercent() {
		return packagePercent;
	}

	public void setPackagePercent(Float packagePercent) {
		this.packagePercent = packagePercent;
	}

	public Float getErrorStockPercent() {
		return errorStockPercent;
	}

	public void setErrorStockPercent(Float errorStockPercent) {
		this.errorStockPercent = errorStockPercent;
	}

	public Float getStockInAmount() {
		return stockInAmount;
	}

	public void setStockInAmount(Float stockInAmount) {
		this.stockInAmount = stockInAmount;
	}

	public Float getOnePrice() {
		return onePrice;
	}

	public void setOnePrice(Float onePrice) {
		this.onePrice = onePrice;
	}

	public String getCargoSpaceName() {
		return cargoSpaceName;
	}

	public void setCargoSpaceName(String cargoSpaceName) {
		this.cargoSpaceName = cargoSpaceName;
	}

}
