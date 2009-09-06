package com.icdb.report;

import java.util.Date;
import java.util.List;

public class ABCReport {
	private int materielType;
	private String storehouseCode;
	private String structCode;
	private Date date;
	private String unit;
	private String reportName;
	private List<ABCReportBean> materielList;

	public int getMaterielType() {
		return materielType;
	}

	public void setMaterielType(int materielType) {
		this.materielType = materielType;
	}

	public String getStorehouseCode() {
		return storehouseCode;
	}

	public void setStorehouseCode(String storehouseCode) {
		this.storehouseCode = storehouseCode;
	}

	public String getStructCode() {
		return structCode;
	}

	public void setStructCode(String structCode) {
		this.structCode = structCode;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	public String getUnit() {
		return unit;
	}

	public void setUnit(String unit) {
		this.unit = unit;
	}

	public String getReportName() {
		return reportName;
	}

	public void setReportName(String reportName) {
		this.reportName = reportName;
	}

	public List<ABCReportBean> getMaterielList() {
		return materielList;
	}

	public void setMaterielList(List<ABCReportBean> materielList) {
		this.materielList = materielList;
	}

}
