package com.action.baseset;

import java.sql.SQLException;
import java.util.List;

import com.dbserver.DBServer;
import com.mydomain.bean.AccountBean;
import com.opensymphony.xwork2.ActionSupport;
import com.tools.DBControl;

public class AccountAction extends ActionSupport{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String accountCode; //帐号编码
	private String accountNumber;//账户号
	private String accountName;
	private String accountType;
	private String personCode; //开户人编码
	private int bankCode; //开户银行编码
	private String message;
	private String nextPath;
	private String rePath;
	private List<AccountBean> lhp;
	private AccountBean account;
	/**
	 * @return the account
	 */
	public AccountBean getAccount() {
		return account;
	}
	/**
	 * @return the accountCode
	 */
	public String getAccountCode() {
		return accountCode;
	}
	/**
	 * @return the accountName
	 */
	public String getAccountName() {
		return accountName;
	}
	/**
	 * @return the accountNumber
	 */
	public String getAccountNumber() {
		return accountNumber;
	}
	/**
	 * @return the accountType
	 */
	public String getAccountType() {
		return accountType;
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
	public List<AccountBean> getLhp() {
		return lhp;
	}
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
	 * @return the personCode
	 */
	public String getPersonCode() {
		return personCode;
	}
	/**
	 * @return the rePath
	 */
	public String getRePath() {
		return rePath;
	}
	/**
	 * @param account the account to set
	 */
	public void setAccount(AccountBean account) {
		this.account = account;
	}
	/**
	 * @param accountCode the accountCode to set
	 */
	public void setAccountCode(String accountCode) {
		this.accountCode = accountCode;
	}
	/**
	 * @param accountName the accountName to set
	 */
	public void setAccountName(String accountName) {
		this.accountName = accountName;
	}
	/**
	 * @param accountNumber the accountNumber to set
	 */
	public void setAccountNumber(String accountNumber) {
		this.accountNumber = accountNumber;
	}
	/**
	 * @param accountType the accountType to set
	 */
	public void setAccountType(String accountType) {
		this.accountType = accountType;
	}
	/**
	 * @param bankCode the bankCode to set
	 */
	public void setBankCode(int bankCode) {
		this.bankCode = bankCode;
	}
	/**
	 * @param lhp the lhp to set
	 */
	public void setLhp(List<AccountBean> lhp) {
		this.lhp = lhp;
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
	 * @param personCode the personCode to set
	 */
	public void setPersonCode(String personCode) {
		this.personCode = personCode;
	}
	/**
	 * @param rePath the rePath to set
	 */
	public void setRePath(String rePath) {
		this.rePath = rePath;
	}
	
	@SuppressWarnings("unchecked")
	public String showAccount(){
		try {
			lhp=(List<AccountBean>) DBServer.quider.queryForList(AccountBean.class);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return SUCCESS;
	}
	
	@SuppressWarnings("unchecked")
	public String findAccount(){
		account=new AccountBean();
		account.setAccountNumber("%"+accountNumber+"%");
		try {
			lhp=(List<AccountBean>) DBServer.quider.queryForList("getAllFind", account, 0, 10);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return SUCCESS;
	}
	
	
	public String goAddAccount(){
		accountCode=DBControl.randId("A");
		return SUCCESS;
	}
	
	public String addAccount(){
		account=new AccountBean();
		account.setAccountCode(accountCode);
		account.setAccountName(accountName);
		account.setAccountNumber(accountNumber);
		account.setAccountType(accountType);
		account.setBankCode(bankCode);
		account.setPersonCode(personCode);
		DBControl db=new DBControl();
		if(db.insert(account)){
			message="";
		}else{
			message="有已经存在为"+accountCode+"的编号，请重新输入";
		}
		nextPath="/baseset/account/AccountAdd.jsp";
		rePath="/baseset/ShowAccount.action";
		return SUCCESS;
	}

	public String getOneAccount(){
		account=new AccountBean();
		try {
			account=(AccountBean) DBServer.quider.queryForObjectById(accountCode, AccountBean.class);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		System.out.println(account.getBankName());
		return SUCCESS;
	}
	public String updateAccount(){
		account=new AccountBean();
		account.setAccountCode(accountCode);
		account.setAccountName(accountName);
		account.setAccountNumber(accountNumber);
		account.setAccountType(accountType);
		account.setBankCode(bankCode);
		account.setPersonCode(personCode);
		try {
			DBServer.quider.updateObject(account);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return SUCCESS;
	}
	
	public String deleteAccount(){
		account.setAccountCode(accountCode);
		try {
			DBServer.quider.deleteObject(account);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return SUCCESS;
	}
}
