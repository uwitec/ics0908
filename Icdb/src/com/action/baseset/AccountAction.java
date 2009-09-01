package com.action.baseset;

import java.sql.SQLException;
import java.util.List;

import com.dbserver.DBServer;
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
	public String selectAccountDef(){
		String v_str=ICTools.likeString(res.getS_value());
		
		ICTools.setBean(account, v_str);
		try {
			lhp=(List<AccountBean>) DBServer.quider.queryForList("selectAccountDef", account, 0, 10);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return SUCCESS;
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
		this.selectAccountDef();
		return SUCCESS;
	}
	
	
	public String goAddAccount(){
		account=new AccountBean();
		account.setAccountCode(ICTools.randId("A"));
		return SUCCESS;
		
	}
	
	public String addAccount(){
		res=new ReSourceBean();
		try {
			DBServer.quider.insertObject(account);
			res.setMessage(ICTools.MESSAGE_OK);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			res.setMessage(ICTools.MESSAGE_ERROR);
		}
		res.setNextPath("/baseset/GoAddAccount.action");
		res.setRePath("/baseset/ShowAccount.action");
		return SUCCESS;
	}

	public String getOneAccount(){
		try {
			account=(AccountBean) DBServer.quider.queryForObjectById(account.getAccountCode(), AccountBean.class);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		System.out.println(account.getBankName());
		return SUCCESS;
	}
	public String updateAccount(){
		
		try {
			DBServer.quider.updateObject(account);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return SUCCESS;
	}
	
	public String deleteAccount(){

		try {
			DBServer.quider.deleteObject(account);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return SUCCESS;
	}
}
