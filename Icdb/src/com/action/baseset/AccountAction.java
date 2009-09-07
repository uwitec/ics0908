package com.action.baseset;

import java.util.List;

import com.manage.baseset.AccountManage;
import com.mydomain.bean.baseset.AccountBean;
import com.mydomain.bean.baseset.ReSourceBean;
import com.opensymphony.xwork2.ActionSupport;
import com.tools.ICTools;

public class AccountAction extends ActionSupport{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;


	private List<AccountBean> lhp;
	private AccountBean account;
	private ReSourceBean res;
	private AccountManage am=new AccountManage();


	/**
	 * @return the res
	 */
	public ReSourceBean getRes() {
		return res;
	}

	/**
	 * @param res the res to set
	 */
	public void setRes(ReSourceBean res) {
		this.res = res;
	}

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
			if(account==null){
				account=new AccountBean();
			}
			if(res==null){
				res=new ReSourceBean();
				ICTools.setBean(account, "");
				res.setS_value("");
			}else{
				ICTools.setBean(account,res.getS_value());
			}
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
		res=new ReSourceBean();
		if(am.addAccount(account)){
			res.setMessage(ICTools.MESSAGE_OK);
		}else{
			res.setMessage(ICTools.MESSAGE_ERROR);
		}
		return SUCCESS;
	}

	public String getOneAccount(){
		account=am.getAccountOne(account.getAccountCode());
		return SUCCESS;
	}
	
	public String updateAccount(){
		res=new ReSourceBean();
		if(am.updateAccount(account)){
			res.setMessage(ICTools.MESSAGE_UPDATEOK);
		}else{
			res.setMessage(ICTools.MESSAGE_ERROR);
		}
		return SUCCESS;
	}
	
	public String deleteAccount(){

		if(am.deleteAccount(account)){
			res.setMessage(ICTools.MESSAGE_DELETEOK);
		}else{
			res.setMessage(ICTools.MESSAGE_ERROR);
		}
		return SUCCESS;
	}
}
