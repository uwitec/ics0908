package com.mydomain.bean.baseset;

import com.mydomain.bean.BaseBean;

public class CustomerBean extends BaseBean{
	private String customerCode;
	private String customerName;
	private String customerAddress;
	private String customerPhone;
	private String customerZipCode;
	private String customerFax;
	private String customerRemark;
	private int isEnabled;
	private String jsonField;
	/**
	 * @return the customerAddress
	 */
	public String getCustomerAddress() {
		return customerAddress;
	}
	/**
	 * @return the customerCode
	 */
	public String getCustomerCode() {
		return customerCode;
	}
	/**
	 * @return the customerFax
	 */
	public String getCustomerFax() {
		return customerFax;
	}
	/**
	 * @return the customerName
	 */
	public String getCustomerName() {
		return customerName;
	}
	/**
	 * @return the customerPhone
	 */
	public String getCustomerPhone() {
		return customerPhone;
	}
	/**
	 * @return the customerRemark
	 */
	public String getCustomerRemark() {
		return customerRemark;
	}
	/**
	 * @return the customerZipCode
	 */
	public String getCustomerZipCode() {
		return customerZipCode;
	}
	/**
	 * @return the isEnabled
	 */
	public int getIsEnabled() {
		return isEnabled;
	}
	/**
	 * @return the jsonField
	 */
	public String getJsonField() {
		return jsonField;
	}
	/**
	 * @param customerAddress the customerAddress to set
	 */
	public void setCustomerAddress(String customerAddress) {
		this.customerAddress = customerAddress;
	}
	/**
	 * @param customerCode the customerCode to set
	 */
	public void setCustomerCode(String customerCode) {
		this.customerCode = customerCode;
	}
	/**
	 * @param customerFax the customerFax to set
	 */
	public void setCustomerFax(String customerFax) {
		this.customerFax = customerFax;
	}
	/**
	 * @param customerName the customerName to set
	 */
	public void setCustomerName(String customerName) {
		this.customerName = customerName;
	}
	/**
	 * @param customerPhone the customerPhone to set
	 */
	public void setCustomerPhone(String customerPhone) {
		this.customerPhone = customerPhone;
	}
	/**
	 * @param customerRemark the customerRemark to set
	 */
	public void setCustomerRemark(String customerRemark) {
		this.customerRemark = customerRemark;
	}
	/**
	 * @param customerZipCode the customerZipCode to set
	 */
	public void setCustomerZipCode(String customerZipCode) {
		this.customerZipCode = customerZipCode;
	}
	/**
	 * @param isEnabled the isEnabled to set
	 */
	public void setIsEnabled(int isEnabled) {
		this.isEnabled = isEnabled;
	}
	/**
	 * @param jsonField the jsonField to set
	 */
	public void setJsonField(String jsonField) {
		this.jsonField = jsonField;
	}
}
