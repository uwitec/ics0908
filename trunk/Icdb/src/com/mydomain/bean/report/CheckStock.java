package com.mydomain.bean.report;

import java.util.Date;

public class CheckStock {

	private String csCode;
	private String storehouseCode;
	private Date csDate;
	private String csApprove;
	private String csApproveMessage;
	private String csApproveState;
	private String csCheckPerson;
	private String csOptionor;
	private String csState;
	private int csStrtStock;

	public String getCsCode() {
		return csCode;
	}

	public void setCsCode(String csCode) {
		this.csCode = csCode;
	}

	public String getStorehouseCode() {
		return storehouseCode;
	}

	public void setStorehouseCode(String storehouseCode) {
		this.storehouseCode = storehouseCode;
	}

	public Date getCsDate() {
		return csDate;
	}

	public void setCsDate(Date csDate) {
		this.csDate = csDate;
	}

	public String getCsApprove() {
		return csApprove;
	}

	public void setCsApprove(String csApprove) {
		this.csApprove = csApprove;
	}

	public String getCsApproveMessage() {
		return csApproveMessage;
	}

	public void setCsApproveMessage(String csApproveMessage) {
		this.csApproveMessage = csApproveMessage;
	}

	public String getCsApproveState() {
		return csApproveState;
	}

	public void setCsApproveState(String csApproveState) {
		this.csApproveState = csApproveState;
	}

	public String getCsCheckPerson() {
		return csCheckPerson;
	}

	public void setCsCheckPerson(String csCheckPerson) {
		this.csCheckPerson = csCheckPerson;
	}

	public String getCsOptionor() {
		return csOptionor;
	}

	public void setCsOptionor(String csOptionor) {
		this.csOptionor = csOptionor;
	}

	public String getCsState() {
		return csState;
	}

	public void setCsState(String csState) {
		this.csState = csState;
	}

	public int getCsStrtStock() {
		return csStrtStock;
	}

	public void setCsStrtStock(int csStrtStock) {
		this.csStrtStock = csStrtStock;
	}

}
