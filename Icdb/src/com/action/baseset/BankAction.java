package com.action.baseset;

import java.util.List;

import com.manage.baseset.BankManage;
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
	private BankManage bm=new BankManage();

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
		this.showBank();
		return SUCCESS;
	}
	
	@SuppressWarnings("unchecked")
	public String showBank(){
		if(bank==null){
			bank=new BankBean();
		}
		if(res==null){
			res=new ReSourceBean();
			ICTools.setBean(bank, "");
			res.setS_value("");
		}else{
			ICTools.setBean(bank,res.getS_value());
		}
		lhp=bm.getBankList(bank);
		return SUCCESS;
	}
	
	public String addBank(){
		res=new ReSourceBean();
		if(bm.addBank(bank)){
			res.setMessage(ICTools.MESSAGE_OK);	
		}else{
			res.setMessage(ICTools.MESSAGE_ERROR);
		}
		return SUCCESS;
	}
	
	public String getOneBank(){
		bank=bm.getBankOne(bank.getBankCode());
		return SUCCESS;
	}
	
	public String updateBank(){
		if(bm.updateBank(bank)){
			res.setMessage(ICTools.MESSAGE_UPDATEOK);	
		}else{
			res.setMessage(ICTools.MESSAGE_ERROR);
		}
		return SUCCESS;
	}
	
	public String deleteBank(){
		
		if(bm.deleteBank(bank)){
			res.setMessage(ICTools.MESSAGE_DELETEOK);	
		}else{
			res.setMessage(ICTools.MESSAGE_ERROR);
		}
		return SUCCESS;
	}
	
	@SuppressWarnings("unchecked")
	
	public String findBank(){
		this.showBank();
		return SUCCESS;
	}
}
