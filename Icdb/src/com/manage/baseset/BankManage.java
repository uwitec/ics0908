package com.manage.baseset;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.dbserver.DBServer;
import com.mydomain.bean.baseset.BankBean;

public class BankManage {

	
	@SuppressWarnings("unchecked")
	public List<BankBean> getBankList(BankBean bank){
		try {
			return (List<BankBean>) DBServer.quider.queryForList("selectAllFind", bank);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			com.dbserver.DBServer.logger.exception(e);
			return new ArrayList<BankBean>();
		}
	}
	
	public boolean addBank(BankBean bank){
		try {
			DBServer.quider.insertObject(bank);
			return true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			com.dbserver.DBServer.logger.exception(e);
			return false;
		}
	}
	
	public BankBean getBankOne(Object Id){
		try {
			return (BankBean) DBServer.quider.queryForObjectById(Id, BankBean.class);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			com.dbserver.DBServer.logger.exception(e);
			return new BankBean();
		}
	}
	
	public boolean updateBank(BankBean bank){
		try {
			DBServer.quider.updateObject(bank);
			return true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			com.dbserver.DBServer.logger.exception(e);
			return false;
		}	
	}
	
	public boolean deleteBank(BankBean bank){
		try {
			DBServer.quider.deleteObject(bank);
			return true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			com.dbserver.DBServer.logger.exception(e);
			return false;
		}
	}
}
