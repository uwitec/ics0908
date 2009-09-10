package com.manage.baseset;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.dbserver.DBServer;
import com.mydomain.bean.baseset.AccountBean;
import com.tools.ICTools;

public class AccountManage {

	
	@SuppressWarnings("unchecked")
	public List<AccountBean> getAccountList(AccountBean account){
		try {
			return (List<AccountBean>) DBServer.quider.queryForList("selectAccountDef", account);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			com.dbserver.DBServer.logger.exception(e);
			return new ArrayList<AccountBean>();
		}
	}
	
	public AccountBean getAccountOne(String	 Id){
		try {
			return (AccountBean) DBServer.quider.queryForObjectById(Id, AccountBean.class);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			com.dbserver.DBServer.logger.exception(e);
			return new AccountBean();
		}
	}
	
	public boolean addAccount(AccountBean account){
		try {
			DBServer.quider.insertObject(account);
			return true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			com.dbserver.DBServer.logger.exception(e);
			return false;
		}
	}
	
	public boolean updateAccount(AccountBean account){
		try {
			DBServer.quider.updateObject(account);
			return true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			com.dbserver.DBServer.logger.exception(e);
			return false;
		}
	}
	
	public boolean deleteAccount(AccountBean account){
		try {
			DBServer.quider.deleteObject(account);
			return true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			com.dbserver.DBServer.logger.exception(e);
			return false;
		}
	}
	
	public AccountBean getPageAccount(AccountBean account){
		PageManage pm=new PageManage();
		if(account==null){
			account=new AccountBean();
			ICTools.setBean(account, "");
			account.setS_value("");
		}else{
			ICTools.setBean(account,account.getS_value());
		}
		return  (AccountBean) pm.setPage(account,"selectAccountCount");
	}
}
