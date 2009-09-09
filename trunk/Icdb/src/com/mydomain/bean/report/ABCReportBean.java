package com.mydomain.bean.report;

import java.util.Date;

public class ABCReportBean {

	private Date beginDate;
	private Date endDate;
	private String searchTeyp;
	private String csCode;
	private String oldCsCode;

	private String name;
	private String materielType;
	private String specification;
	private String util;

	private Integer lastAmount;
	private Double lastPrice;
	private Double lastTotalPrice;

	private Integer amount;
	private Double price;
	private Double totalPrice;

	private Integer inAmount;
	private Double inPrice;
	private Double inTotalPrice;

	private Integer outAmount;
	private Double outPrice;
	private Double outTotalPrice;

	private String remark;

	public Date getBeginDate() {
		return beginDate;
	}

	public void setBeginDate(Date beginDate) {
		this.beginDate = beginDate;
	}

	public Date getEndDate() {
		return endDate;
	}

	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}

	public String getSearchTeyp() {
		return searchTeyp;
	}

	public void setSearchTeyp(String searchTeyp) {
		this.searchTeyp = searchTeyp;
	}

	public String getCsCode() {
		return csCode;
	}

	public void setCsCode(String csCode) {
		this.csCode = csCode;
	}

	public String getOldCsCode() {
		return oldCsCode;
	}

	public void setOldCsCode(String oldCsCode) {
		this.oldCsCode = oldCsCode;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getMaterielType() {
		return materielType;
	}

	public void setMaterielType(String materielType) {
		this.materielType = materielType;
	}

	public String getSpecification() {
		return specification;
	}

	public void setSpecification(String specification) {
		this.specification = specification;
	}

	public String getUtil() {
		return util;
	}

	public void setUtil(String util) {
		this.util = util;
	}

	public Integer getLastAmount() {
		return lastAmount;
	}

	public void setLastAmount(Integer lastAmount) {
		if (null == lastAmount) {
			lastAmount = 0;
		}
		this.lastAmount = lastAmount;
	}

	public Double getLastPrice() {
		return lastPrice;
	}

	public void setLastPrice(Double lastPrice) {
		if (null == lastPrice) {
			lastPrice = 0.0;
		}
		this.lastPrice = lastPrice;
	}

	public Double getLastTotalPrice() {
		setLastTotalPrice(0d);
		return lastTotalPrice;
	}

	public void setLastTotalPrice(Double lastTotalPrice) {
		this.lastTotalPrice = getLastPrice() * getLastAmount();
	}

	public Integer getAmount() {
		return amount;
	}

	public void setAmount(Integer amount) {
		if (null == amount) {
			amount = 0;
		}
		this.amount = amount;
	}

	public Double getPrice() {
		return price;
	}

	public void setPrice(Double price) {
		if (null == price) {
			price = 0.0;
		}
		this.price = price;
	}

	public Double getTotalPrice() {
		setTotalPrice(0d);
		return totalPrice;
	}

	public void setTotalPrice(Double totalPrice) {
		this.totalPrice = getPrice() * getAmount();
	}

	public Integer getInAmount() {
		return inAmount;
	}

	public void setInAmount(Integer inAmount) {
		if (null == inAmount) {
			inAmount = 0;
		}
		this.inAmount = inAmount;
	}

	public Double getInPrice() {
		return inPrice;
	}

	public void setInPrice(Double inPrice) {
		if (null == inPrice) {
			inPrice = 0.0;
		}
		this.inPrice = inPrice;
	}

	public Double getInTotalPrice() {
		setInTotalPrice(0d);
		return inTotalPrice;
	}

	public void setInTotalPrice(Double inTotalPrice) {
		this.inTotalPrice = getInPrice() * getInAmount();
	}

	public Integer getOutAmount() {
		return outAmount;
	}

	public void setOutAmount(Integer outAmount) {
		if (null == outAmount) {
			outAmount = 0;
		}
		this.outAmount = outAmount;
	}

	public Double getOutPrice() {
		return outPrice;
	}

	public void setOutPrice(Double outPrice) {
		if (null == outPrice) {
			outPrice = 0.0;
		}
		this.outPrice = outPrice;
	}

	public Double getOutTotalPrice() {
		setOutTotalPrice(0d);
		return outTotalPrice;
	}

	public void setOutTotalPrice(Double outTotalPrice) {
		this.outTotalPrice = getOutPrice() * getOutAmount();
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

}
