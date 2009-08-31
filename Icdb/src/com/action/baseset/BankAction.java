package com.action.baseset;

import java.sql.SQLException;
import java.util.List;

import com.dbserver.DBServer;
import com.mydomain.bean.baseset.BankBean;
import com.mydomain.bean.baseset.ReSourceBean;
import com.opensymphony.xwork2.ActionSupport;
import com.tools.ICTools;

public class BankAction extends ActionSupport{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private BankBean bank;
	private List<BankBean> lhp;
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
	 * @return the bank
	 */
	public BankBean getBank() {
		return bank;
	}
	/**
	 * @return the lhp
	 */
	public List<BankBean> getLhp() {
		return lhp;
	}

	/**
	 * @param bank the bank to set
	 */
	public void setBank(BankBean bank) {
		this.bank = bank;
	}

	/**
	 * @param lhp the lhp to set
	 */
	public void setLhp(List<BankBean> lhp) {
		this.lhp = lhp;
	}

	
	
	@SuppressWarnings("unchecked")
	public String selectBankDef(){
		try {
			bank.setBankName(ICTools.likeString(res.getS_value()));
			lhp=(List<BankBean>) DBServer.quider.queryForList("selectAllFind", bank, 0, 10);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return SUCCESS;
	}
	
	@SuppressWarnings("unchecked")
	public String showBank(){
		
		try {
			lhp=(List<BankBean>) DBServer.quider.queryForList(BankBean.class);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return SUCCESS;
	}
	
	public String addBank(){
		res=new ReSourceBean();
		try {
			DBServer.quider.insertObject(bank);
			res.setMessage(ICTools.MESSAGE_OK);	
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			res.setMessage(ICTools.MESSAGE_ERROR);
		}
		res.setNextPath("/baseset/bank/BankAdd.jsp");
		res.setRePath("/baseset/ShowBank.action");
		return SUCCESS;
	}
	
	public String getOneBank(){
		try {
			bank=(BankBean) DBServer.quider.queryForObjectById(bank.getBankCode(), BankBean.class);		
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();		
		}
		return SUCCESS;
	}
	
	public String updateBank(){
		try {
			DBServer.quider.updateObject(bank);		
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return SUCCESS;
	}
	
	public String deleteBank(){
		try {
			DBServer.quider.deleteObject(bank);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return SUCCESS;
	}
	
	@SuppressWarnings("unchecked")
	
	public String findBank(){
		bank.setBankName(ICTools.likeString(res.getS_value()));
		try {
			lhp=(List<BankBean>) DBServer.quider.queryForList("selectAllFind", bank, 0, 10);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return SUCCESS;
	}
}
