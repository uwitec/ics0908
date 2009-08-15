package com.action.baseset;

import java.sql.SQLException;
import java.util.List;

import com.dbserver.DBServer;
import com.mydomain.bean.SupplierBean;
import com.opensymphony.xwork2.ActionSupport;
import com.tools.DBControl;
import com.tools.ICTools;

public class SupplierAction extends ActionSupport{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String supplierCode; //供应商编码
	private String supplierName; //供应商名称
	private String supplierAddress; //供应商地址
	private String supplierPhone; //供应商电话
	private String supplierFax; //供应商传真
	private String supplierZipCode; //供应商邮编
	private String supplierTaxFileNumber; //税号
	private String supplierRemark; //备注
	private String personCode; //联系人编码
	private String accountCode; //银行帐号编码
	private int bankCode; //银行编码
	private String message;
	private String nextPath;
	private String rePath;
	private List<SupplierBean> lhp;
	private SupplierBean supplier;
	/**
	 * @return the account
	 */
	
	/**
	 * @return the accountCode
	 */
	public String getAccountCode() {
		return accountCode;
	}
	/**
	 * @return the bankCode
	 */
	public int getBankCode() {
		return bankCode;
	}
	/**
	 * @return the lhp
	 */
	
	/**
	 * @return the message
	 */
	public String getMessage() {
		return message;
	}
	/**
	 * @return the nextPath
	 */
	public String getNextPath() {
		return nextPath;
	}
	
	/**
	 * @return the rePath
	 */
	public String getRePath() {
		return rePath;
	}
	/**
	 * @return the supplierAddress
	 */
	public String getSupplierAddress() {
		return supplierAddress;
	}
	/**
	 * @return the supplierCode
	 */
	public String getSupplierCode() {
		return supplierCode;
	}
	/**
	 * @return the supplierFax
	 */
	public String getSupplierFax() {
		return supplierFax;
	}
	/**
	 * @return the supplierName
	 */
	public String getSupplierName() {
		return supplierName;
	}
	/**
	 * @return the supplierPhone
	 */
	public String getSupplierPhone() {
		return supplierPhone;
	}
	/**
	 * @return the supplierRemark
	 */
	public String getSupplierRemark() {
		return supplierRemark;
	}
	/**
	 * @return the supplierTaxFileNumber
	 */
	public String getSupplierTaxFileNumber() {
		return supplierTaxFileNumber;
	}
	/**
	 * @return the supplierZipCode
	 */
	public String getSupplierZipCode() {
		return supplierZipCode;
	}
	
	/**
	 * @param accountCode the accountCode to set
	 */
	public void setAccountCode(String accountCode) {
		this.accountCode = accountCode;
	}
	/**
	 * @param bankCode the bankCode to set
	 */
	public void setBankCode(int bankCode) {
		this.bankCode = bankCode;
	}

	/**
	 * @param message the message to set
	 */
	public void setMessage(String message) {
		this.message = message;
	}
	/**
	 * @param nextPath the nextPath to set
	 */
	public void setNextPath(String nextPath) {
		this.nextPath = nextPath;
	}
	
	/**
	 * @param rePath the rePath to set
	 */
	public void setRePath(String rePath) {
		this.rePath = rePath;
	}
	/**
	 * @param supplierAddress the supplierAddress to set
	 */
	public void setSupplierAddress(String supplierAddress) {
		this.supplierAddress = supplierAddress;
	}
	/**
	 * @param supplierCode the supplierCode to set
	 */
	public void setSupplierCode(String supplierCode) {
		this.supplierCode = supplierCode;
	}
	/**
	 * @param supplierFax the supplierFax to set
	 */
	public void setSupplierFax(String supplierFax) {
		this.supplierFax = supplierFax;
	}
	/**
	 * @param supplierName the supplierName to set
	 */
	public void setSupplierName(String supplierName) {
		this.supplierName = supplierName;
	}
	/**
	 * @param supplierPhone the supplierPhone to set
	 */
	public void setSupplierPhone(String supplierPhone) {
		this.supplierPhone = supplierPhone;
	}
	/**
	 * @param supplierRemark the supplierRemark to set
	 */
	public void setSupplierRemark(String supplierRemark) {
		this.supplierRemark = supplierRemark;
	}
	/**
	 * @param supplierTaxFileNumber the supplierTaxFileNumber to set
	 */
	public void setSupplierTaxFileNumber(String supplierTaxFileNumber) {
		this.supplierTaxFileNumber = supplierTaxFileNumber;
	}
	/**
	 * @param supplierZipCode the supplierZipCode to set
	 */
	public void setSupplierZipCode(String supplierZipCode) {
		this.supplierZipCode = supplierZipCode;
	}
	/**
	 * @return the personCode
	 */
	public String getPersonCode() {
		return personCode;
	}
	/**
	 * @param personCode the personCode to set
	 */
	public void setPersonCode(String personCode) {
		this.personCode = personCode;
	}
	/**
	 * @return the lhp
	 */
	public List<SupplierBean> getLhp() {
		return lhp;
	}
	/**
	 * @return the supplier
	 */
	public SupplierBean getSupplier() {
		return supplier;
	}
	/**
	 * @param lhp the lhp to set
	 */
	public void setLhp(List<SupplierBean> lhp) {
		this.lhp = lhp;
	}
	/**
	 * @param supplier the supplier to set
	 */
	public void setSupplier(SupplierBean supplier) {
		this.supplier = supplier;
	}

	public String goAddSupplier(){
		supplierCode=ICTools.randId("S");
		return SUCCESS;
	}
	
	public String addSupplier(){
		supplier=new SupplierBean();
		supplier.setSupplierAddress(supplierAddress);
		supplier.setSupplierCode(supplierCode);
		supplier.setSupplierFax(supplierFax);
		supplier.setSupplierName(supplierName);
		supplier.setSupplierPhone(supplierPhone);
		supplier.setSupplierRemark(supplierRemark);
		supplier.setSupplierTaxFileNumber(supplierTaxFileNumber);
		supplier.setSupplierZipCode(supplierZipCode);
		supplier.setAccountCode(accountCode);
		supplier.setBankCode(bankCode);
		supplier.setPersonCode(personCode);
		DBControl db=new DBControl();
		if(db.insert(supplier)){
			message="";
		}else{
			message="添加失败，请检查";
		}
		nextPath="/baseset/supplier/SupplierAdd.jsp";
		rePath="/baseset/ShowSupplier.action";
		return SUCCESS;
	}
	
	public String getOneSupplier(){
		try {
			supplier=(SupplierBean) DBServer.quider.queryForObjectById(supplierCode, SupplierBean.class);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return SUCCESS;
	}
	
	@SuppressWarnings("unchecked")
	public String showSupplier(){
		try {
			lhp=(List<SupplierBean>) DBServer.quider.queryForList(0, 10, SupplierBean.class);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return SUCCESS;
	}
	
	public String updateSupplier(){
		supplier=new SupplierBean();
		supplier.setSupplierAddress(supplierAddress);
		supplier.setSupplierCode(supplierCode);
		supplier.setSupplierFax(supplierFax);
		supplier.setSupplierName(supplierName);
		supplier.setSupplierPhone(supplierPhone);
		supplier.setSupplierRemark(supplierRemark);
		supplier.setSupplierTaxFileNumber(supplierTaxFileNumber);
		supplier.setSupplierZipCode(supplierZipCode);
		supplier.setAccountCode(accountCode);
		supplier.setBankCode(bankCode);
		supplier.setPersonCode(personCode);
		
		try {
			DBServer.quider.updateObject(supplier);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return SUCCESS;
	}
	
	public String deleteSuString(){
		supplier=new SupplierBean();
		try {
			DBServer.quider.deleteObject(supplier);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return SUCCESS;
	}
	
}
