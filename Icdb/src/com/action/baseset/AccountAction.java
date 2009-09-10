package com.action.baseset;

import java.util.List;

import com.manage.baseset.AccountManage;
import com.mydomain.bean.baseset.AccountBean;
import com.opensymphony.xwork2.ActionSupport;
import com.tools.ICTools;

public class AccountAction extends ActionSupport{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;


	private List<AccountBean> lhp;
	private AccountBean account;
	private AccountManage am=new AccountManage();

	/**
	 * @return the account
	 */
	public AccountBean getAccount() {
		return account;
	}
	
	/**
	 * @return the lhp
	 */
	public List<AccountBean> getLhp() {
		return lhp;
	}
	/**
	 * @param account the account to set
	 */
	public void setAccount(AccountBean account) {
		this.account = account;
	}

	/**
	 * @param lhp the lhp to set
	 */
	public void setLhp(List<AccountBean> lhp) {
		this.lhp = lhp;
	}
	
	@SuppressWarnings("unchecked")
	public String showAccount(){
		account=am.getPageAccount(account);
		lhp=am.getAccountList(account);
		return SUCCESS;
	}
	
	@SuppressWarnings("unchecked")
	public String findAccount(){
		this.showAccount();
		return SUCCESS;
	}
	
	
	public String goAddAccount(){
		account=new AccountBean();
		account.setAccountCode(ICTools.randId("A"));
		return SUCCESS;
		
	}
	
	public String addAccount(){
		if(am.addAccount(account)){
			account.setMessage(ICTools.MESSAGE_OK);
		}else{
			account.setMessage(ICTools.MESSAGE_ERROR);
		}
		return SUCCESS;
	}

	public String getOneAccount(){
		account=am.getAccountOne(account.getAccountCode());
		return SUCCESS;
	}
	
	public String updateAccount(){
		if(am.updateAccount(account)){
			account.setMessage(ICTools.MESSAGE_UPDATEOK);
		}else{
			account.setMessage(ICTools.MESSAGE_ERROR);
		}
		return SUCCESS;
	}
	
	public String deleteAccount(){

		if(am.deleteAccount(account)){
			account.setMessage(ICTools.MESSAGE_DELETEOK);
		}else{
			account.setMessage(ICTools.MESSAGE_ERROR);
		}
		return SUCCESS;
	}
}
