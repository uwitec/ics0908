package com.action.baseset;

import java.util.List;

import com.manage.baseset.BankManage;
import com.mydomain.bean.baseset.BankBean;
import com.opensymphony.xwork2.ActionSupport;
import com.tools.ICTools;

public class BankAction extends ActionSupport{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private BankBean bank;
	private List<BankBean> lhp;
	private BankManage bm=new BankManage();


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
		bank=bm.getPageBank(bank);
		lhp=bm.getBankList(bank);
		
		return SUCCESS;
	}
	
	public String addBank(){
		if(bm.addBank(bank)){
			bank.setMessage(ICTools.MESSAGE_OK);	
		}else{
			bank.setMessage(ICTools.MESSAGE_ERROR);
		}
		return SUCCESS;
	}
	
	public String goAddBank(){
		bank=new BankBean();
		bank.setBankCode(ICTools.randId());
		return SUCCESS;
	}
	public String getOneBank(){
		bank=bm.getBankOne(bank.getBankCode());
		return SUCCESS;
	}
	
	public String updateBank(){
		if(bm.updateBank(bank)){
			bank.setMessage(ICTools.MESSAGE_UPDATEOK);	
		}else{
			bank.setMessage(ICTools.MESSAGE_ERROR);
		}
		return SUCCESS;
	}
	
	public String deleteBank(){
		if(bm.deleteBank(bank)){
			bank.setMessage(ICTools.MESSAGE_DELETEOK);	
		}else{
			bank.setMessage(ICTools.MESSAGE_ERROR);
		}
		return SUCCESS;
	}
	
	@SuppressWarnings("unchecked")
	
	public String findBank(){
		this.showBank();
		return SUCCESS;
	}
}
