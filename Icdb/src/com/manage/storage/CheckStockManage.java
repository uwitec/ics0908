package com.manage.storage;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.dbserver.DBServer;
import com.manage.baseset.PageManage;
import com.mydomain.bean.storage.CheckStockBean;
import com.mydomain.bean.storage.CheckStockListBean;
import com.tools.ICTools;

public class CheckStockManage {

	
	@SuppressWarnings("unchecked")
	public List<CheckStockBean> getCheckStockList(CheckStockBean checkStock){
		try {
			return (List<CheckStockBean>) DBServer.quider.queryForList("", checkStock);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			com.dbserver.DBServer.logger.exception(e);
			return new ArrayList<CheckStockBean>();
		}
	}
	
	public CheckStockBean getPageCheckStock(CheckStockBean checkStock){
		PageManage pm=new PageManage();
		if(checkStock==null){
			checkStock=new CheckStockBean();
			ICTools.setBean(checkStock, "");
			checkStock.setS_value("");
		}else{
			ICTools.setBean(checkStock,checkStock.getS_value());
		}
		return (CheckStockBean) pm.setPage(checkStock, "selectCheckStockCount");
	}
	
	public boolean addCheckStockALL(List<CheckStockListBean> check_list,CheckStockBean checkStock){
		try {
			DBServer.quider.startTransaction();
			DBServer.quider.insertObject(checkStock);
			for(int i=0;i<check_list.size();i++){
				DBServer.quider.insertObject("insertCheckStockListBean",check_list.get(i));
				}
			DBServer.quider.commitTransaction();
			DBServer.quider.endTransaction();
			return true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			com.dbserver.DBServer.logger.exception(e);
			return false;
		}
	}

	public boolean addCheckStock(CheckStockBean checkStock){
		try {
			DBServer.quider.insertObject(checkStock);
			return true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			com.dbserver.DBServer.logger.exception(e);
			return false;
		}
	}
	
	public boolean updateCheckStock(CheckStockBean checkStock){
		try {
			DBServer.quider.updateObject(checkStock);
			return true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			com.dbserver.DBServer.logger.exception(e);
			return false;
		}
	}
	
}
