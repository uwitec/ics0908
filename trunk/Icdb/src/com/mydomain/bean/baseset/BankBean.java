package com.mydomain.bean.baseset;
/*
 * ����BEAN
 * */
public class BankBean {

	private int  bankCode; //���б���
	private String bankName; //��������
	/**
	 * @return the bankCode
	 */
	public int getBankCode() {
		return bankCode;
	}
	/**
	 * @return the bankName
	 */
	public String getBankName() {
		return bankName;
	}
	/**
	 * @param bankCode the bankCode to set
	 */
	public void setBankCode(int bankCode) {
		this.bankCode = bankCode;
	}
	/**
	 * @param bankName the bankName to set
	 */
	public void setBankName(String bankName) {
		this.bankName = bankName;
	}
	
}
