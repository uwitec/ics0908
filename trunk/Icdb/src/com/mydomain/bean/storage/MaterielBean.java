package com.mydomain.bean.storage;

import java.util.List;

public class MaterielBean {

	private String materielCode;
	private String materielName;
	private String materielMadeIn;
	private String materielPrice;
	private String materielMaxStore;
	private String materielMinStore;
	private String materielSpell;
	private Integer isEnabled;
	private String jsonField;
	private String materielSize;
	private String materielABC;


	private List<String> materielIds;

	public String getMaterielCode() {
		return materielCode;
	}
	public void setMaterielCode(String materielCode) {
		this.materielCode = materielCode;
	}
	public String getMaterielName() {
		return materielName;
	}
	public void setMaterielName(String materielName) {
		this.materielName = materielName;
	}
	public String getMaterielMadeIn() {
		return materielMadeIn;
	}
	public void setMaterielMadeIn(String materielMadeIn) {
		this.materielMadeIn = materielMadeIn;
	}
	public String getMaterielPrice() {
		return materielPrice;
	}
	public void setMaterielPrice(String materielPrice) {
		this.materielPrice = materielPrice;
	}
	public String getMaterielMaxStore() {
		return materielMaxStore;
	}
	public void setMaterielMaxStore(String materielMaxStore) {
		this.materielMaxStore = materielMaxStore;
	}
	public String getMaterielMinStore() {
		return materielMinStore;
	}
	public void setMaterielMinStore(String materielMinStore) {
		this.materielMinStore = materielMinStore;
	}
	public String getMaterielSpell() {
		return materielSpell;
	}
	public void setMaterielSpell(String materielSpell) {
		this.materielSpell = materielSpell;
	}
	public Integer getIsEnabled() {
		return isEnabled;
	}
	public void setIsEnabled(Integer isEnabled) {
		this.isEnabled = isEnabled;
	}
	public String getJsonField() {
		return jsonField;
	}
	public void setJsonField(String jsonField) {
		this.jsonField = jsonField;
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
	public List<String> getMaterielIds() {
		return materielIds;
	}
	public void setMaterielIds(List<String> materielIds) {
		this.materielIds = materielIds;
	}


}
