package com.action.baseset;

import java.sql.SQLException;
import java.util.List;

import com.dbserver.DBServer;
import com.mydomain.bean.BankBean;
import com.opensymphony.xwork2.ActionSupport;
import com.tools.DBControl;

public class BankAction extends ActionSupport{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private int bankCode;
	private String bankName;
	private BankBean bank;
	private List<BankBean> lhp;
	
	private String message;
	private String nextPath;
	private String rePath;
	/**
	 * @return the bank
	 */
	public BankBean getBank() {
		return bank;
	}
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
	 * @return the lhp
	 */
	public List<BankBean> getLhp() {
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
	 * @return the rePath
	 */
	public String getRePath() {
		return rePath;
	}
	/**
	 * @param bank the bank to set
	 */
	public void setBank(BankBean bank) {
		this.bank = bank;
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
	/**
	 * @param lhp the lhp to set
	 */
	public void setLhp(List<BankBean> lhp) {
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
	 * @param rePath the rePath to set
	 */
	public void setRePath(String rePath) {
		this.rePath = rePath;
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
		bank=new BankBean();
		bank.setBankCode(bankCode);
		bank.setBankName(bankName);
		DBControl dbc=new DBControl();
		if(dbc.insert(bank)){
			message="";	
		}else{
			message="有已经存在为"+bankCode+"的编号，请重新输入";
		}
		nextPath="/baseset/bank/BankAdd.jsp";
		rePath="/baseset/ShowBank.action";
		return SUCCESS;
	}
	
	public String getOneBank(){
		try {
			bank=(BankBean) DBServer.quider.queryForObjectById(bankCode, BankBean.class);		
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();		
		}
		return SUCCESS;
	}
	
	public String updateBank(){
		bank=new BankBean();
		bank.setBankCode(bankCode);
		bank.setBankName(bankName);
		try {
			DBServer.quider.updateObject(bank);		
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return SUCCESS;
	}
	
	public String deleteBank(){
		bank=new BankBean();
		bank.setBankCode(bankCode);
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
		bank=new BankBean();
		bank.setBankName("%"+bankName+"%");
		try {
			lhp=(List<BankBean>) DBServer.quider.queryForList("selectAllFind", bank, 0, 10);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return SUCCESS;
	}

}
