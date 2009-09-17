package com.mydomain.bean.storage;

public class MaterielBeanExt extends MaterielBean {

	private String cargoSpaceCode;
	private Float stockPrice;
	private String stockAmount;

	public String getCargoSpaceCode() {
		return cargoSpaceCode;
	}

	public void setCargoSpaceCode(String cargoSpaceCode) {
		this.cargoSpaceCode = cargoSpaceCode;
	}

	public Float getStockPrice() {
		return stockPrice;
	}

	public void setStockPrice(Float stockPrice) {
		this.stockPrice = stockPrice;
	}

	public String getStockAmount() {
		return stockAmount;
	}

	public void setStockAmount(String stockAmount) {
		this.stockAmount = stockAmount;
	}

}
