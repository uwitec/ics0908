package com.mydomain.bean.storage;

import com.mydomain.bean.BaseBean;

public class WasMaterielBean extends BaseBean{

	private String wasCode;
	private String materielCode;
	private String materielName;
	private String wasNumber;
	private String wasMoney;
	private String wasCause;
	/**
	 * @return the materielCode
	 */
	public String getMaterielCode() {
		return materielCode;
	}
	/**
	 * @return the materielName
	 */
	public String getMaterielName() {
		return materielName;
	}
	/**
	 * @return the wasCause
	 */
	public String getWasCause() {
		return wasCause;
	}
	/**
	 * @return the wasCode
	 */
	public String getWasCode() {
		return wasCode;
	}
	/**
	 * @return the wasMoney
	 */
	public String getWasMoney() {
		return wasMoney;
	}
	/**
	 * @return the wasNumber
	 */
	public String getWasNumber() {
		return wasNumber;
	}
	/**
	 * @param materielCode the materielCode to set
	 */
	public void setMaterielCode(String materielCode) {
		this.materielCode = materielCode;
	}
	/**
	 * @param materielName the materielName to set
	 */
	public void setMaterielName(String materielName) {
		this.materielName = materielName;
	}
	/**
	 * @param wasCause the wasCause to set
	 */
	public void setWasCause(String wasCause) {
		this.wasCause = wasCause;
	}
	/**
	 * @param wasCode the wasCode to set
	 */
	public void setWasCode(String wasCode) {
		this.wasCode = wasCode;
	}
	/**
	 * @param wasMoney the wasMoney to set
	 */
	public void setWasMoney(String wasMoney) {
		this.wasMoney = wasMoney;
	}
	/**
	 * @param wasNumber the wasNumber to set
	 */
	public void setWasNumber(String wasNumber) {
		this.wasNumber = wasNumber;
	}
}
