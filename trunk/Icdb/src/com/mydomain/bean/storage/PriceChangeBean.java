package com.mydomain.bean.storage;

import com.mydomain.bean.BaseBean;

public class PriceChangeBean extends BaseBean{
	private String	pchangeCode;
	private String	pchangeDate;
	private String	optionar;
	private String	pchangeMessage;
	private String	jsonField;
	private int pchangeState;
	private String startTime;
	private String endTime;
	/**
	 * @return the endTime
	 */
	public String getEndTime() {
		return endTime;
	}
	/**
	 * @return the startTime
	 */
	public String getStartTime() {
		return startTime;
	}
	/**
	 * @param endTime the endTime to set
	 */
	public void setEndTime(String endTime) {
		this.endTime = endTime;
	}
	/**
	 * @param startTime the startTime to set
	 */
	public void setStartTime(String startTime) {
		this.startTime = startTime;
	}
	/**
	 * @return the pchangeState
	 */
	public int getPchangeState() {
		return pchangeState;
	}
	/**
	 * @param pchangeState the pchangeState to set
	 */
	public void setPchangeState(int pchangeState) {
		this.pchangeState = pchangeState;
	}
	/**
	 * @return the jsonField
	 */
	public String getJsonField() {
		return jsonField;
	}
	/**
	 * @return the optionar
	 */
	public String getOptionar() {
		return optionar;
	}
	/**
	 * @return the pchangeCode
	 */
	public String getPchangeCode() {
		return pchangeCode;
	}
	/**
	 * @return the pchangeDate
	 */
	public String getPchangeDate() {
		return pchangeDate;
	}
	/**
	 * @return the pchangeMessage
	 */
	public String getPchangeMessage() {
		return pchangeMessage;
	}
	/**
	 * @param jsonField the jsonField to set
	 */
	public void setJsonField(String jsonField) {
		this.jsonField = jsonField;
	}
	/**
	 * @param optionar the optionar to set
	 */
	public void setOptionar(String optionar) {
		this.optionar = optionar;
	}
	/**
	 * @param pchangeCode the pchangeCode to set
	 */
	public void setPchangeCode(String pchangeCode) {
		this.pchangeCode = pchangeCode;
	}
	/**
	 * @param pchangeDate the pchangeDate to set
	 */
	public void setPchangeDate(String pchangeDate) {
		this.pchangeDate = pchangeDate;
	}
	/**
	 * @param pchangeMessage the pchangeMessage to set
	 */
	public void setPchangeMessage(String pchangeMessage) {
		this.pchangeMessage = pchangeMessage;
	}
	
}
