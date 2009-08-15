package com.mydomain.bean;
/*
 *  帐号BEAN
 * */
public class AccountBean {
	
	private String accountCode; //帐号编码
	private String accountNumber;//账户号
	private String accountName;
	private String accountType;
	private String personCode; //开户人编码
	private String personName;
	private String bankName;
	private int bankCode; //开户银行编码
	/**
	 * @return the accountCode
	 */
	public String getAccountCode() {
		return accountCode;
	}
	/**
	 * @return the accountNumber
	 */
	public String getAccountNumber() {
		return accountNumber;
	}
	/**
	 * @return the bankCode
	 */
	public int getBankCode() {
		return bankCode;
	}
	/**
	 * @return the peopleCode
	 */
	
	/**
	 * @param accountCode the accountCode to set
	 */
	public void setAccountCode(String accountCode) {
		this.accountCode = accountCode;
	}
	/**
	 * @param accountNumber the accountNumber to set
	 */
	public void setAccountNumber(String accountNumber) {
		this.accountNumber = accountNumber;
	}
	/**
	 * @param bankCode the bankCode to set
	 */
	public void setBankCode(int bankCode) {
		this.bankCode = bankCode;
	}
	/**
	 * @param peopleCode the peopleCode to set
	 */
	/**
	 * @return the accountName
	 */
	public String getAccountName() {
		return accountName;
	}
	/**
	 * @return the accountType
	 */
	public String getAccountType() {
		return accountType;
	}
	/**
	 * @return the personCode
	 */
	public String getPersonCode() {
		return personCode;
	}
	/**
	 * @param accountName the accountName to set
	 */
	public void setAccountName(String accountName) {
		this.accountName = accountName;
	}
	/**
	 * @param accountType the accountType to set
	 */
	public void setAccountType(String accountType) {
		this.accountType = accountType;
	}
	/**
	 * @param personCode the personCode to set
	 */
	public void setPersonCode(String personCode) {
		this.personCode = personCode;
	}
	/**
	 * @return the bankName
	 */
	public String getBankName() {
		return bankName;
	}
	/**
	 * @return the personName
	 */
	public String getPersonName() {
		return personName;
	}
	/**
	 * @param bankName the bankName to set
	 */
	public void setBankName(String bankName) {
		this.bankName = bankName;
	}
	/**
	 * @param personName the personName to set
	 */
	public void setPersonName(String personName) {
		this.personName = personName;
	}


}
