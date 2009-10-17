package com.mydomain.bean.storage;

import com.mydomain.bean.BaseBean;

public class WasTageBean extends BaseBean{

	private String wasCode;
	private int wasType;
	private String wasTime;
	private String optionor;
	private String personName;
	private String wasDoc;
	private int wasState;
	/**
	 * @return the wasDoc
	 */
	public String getWasDoc() {
		return wasDoc;
	}
	/**
	 * @return the wasState
	 */
	public int getWasState() {
		return wasState;
	}
	/**
	 * @param wasDoc the wasDoc to set
	 */
	public void setWasDoc(String wasDoc) {
		this.wasDoc = wasDoc;
	}
	/**
	 * @param wasState the wasState to set
	 */
	public void setWasState(int wasState) {
		this.wasState = wasState;
	}
	/**
	 * @return the personName
	 */
	public String getPersonName() {
		return personName;
	}
	/**
	 * @param personName the personName to set
	 */
	public void setPersonName(String personName) {
		this.personName = personName;
	}
	
	/**
	 * @return the wasCode
	 */
	public String getWasCode() {
		return wasCode;
	}
	/**
	 * @return the wasTime
	 */
	public String getWasTime() {
		return wasTime;
	}
	/**
	 * @return the wasType
	 */
	public int getWasType() {
		return wasType;
	}
	
	/**
	 * @return the optionor
	 */
	public String getOptionor() {
		return optionor;
	}
	/**
	 * @param optionor the optionor to set
	 */
	public void setOptionor(String optionor) {
		this.optionor = optionor;
	}
	/**
	 * @param wasCode the wasCode to set
	 */
	public void setWasCode(String wasCode) {
		this.wasCode = wasCode;
	}
	/**
	 * @param wasTime the wasTime to set
	 */
	public void setWasTime(String wasTime) {
		this.wasTime = wasTime;
	}
	/**
	 * @param wasType the wasType to set
	 */
	public void setWasType(int wasType) {
		this.wasType = wasType;
	}
}
