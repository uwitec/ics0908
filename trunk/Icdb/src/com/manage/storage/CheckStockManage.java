package com.manage.storage;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.dbserver.DBServer;
import com.manage.baseset.PageManage;
import com.mydomain.bean.baseset.StorehouseBean;
import com.mydomain.bean.storage.CheckStockBean;
import com.mydomain.bean.storage.CheckStockListBean;
import com.tools.ICTools;

public class CheckStockManage {

	
	@SuppressWarnings("unchecked")
	public List<CheckStockBean> getCheckStockList(CheckStockBean checkStock){
		try {
			return (List<CheckStockBean>) DBServer.quider.queryForList("selectCheckStockDef", checkStock);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			com.dbserver.DBServer.logger.exception(e);
			return new ArrayList<CheckStockBean>();
		}
	}
	
	@SuppressWarnings("unchecked")
	public ArrayList<StorehouseBean> getCheckHouse(String dateTime){
		try {
			return (ArrayList<StorehouseBean>) DBServer.quider.queryForList("getCheckHouse", dateTime);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			com.dbserver.DBServer.logger.exception(e);
			return new ArrayList<StorehouseBean>();
		}
	}	
	
	public CheckStockBean getPageCheckState(CheckStockBean checkStock){
		PageManage pm=new PageManage();
		if(checkStock==null)
			checkStock=new CheckStockBean();
		checkStock=(CheckStockBean) pm.setPage(checkStock, "getCheckNoComCount");
		return checkStock;
	}

	
	public CheckStockBean getPageShowCheckState(CheckStockBean checkStock){
		PageManage pm=new PageManage();
		if(checkStock==null)
			checkStock=new CheckStockBean();
		checkStock=(CheckStockBean) pm.setPage(checkStock, "getCheckStateCount");
		return checkStock;
	}
	
	
	@SuppressWarnings("unchecked")
	public List<CheckStockBean> getCheckShowStateList(CheckStockBean checkStock){
		try {
			return (List<CheckStockBean>) DBServer.quider.queryForList("getCheckStateDef", checkStock);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			com.dbserver.DBServer.logger.exception(e);
			return new ArrayList<CheckStockBean>();
		}
	}
	
	
	@SuppressWarnings("unchecked")
	public List<CheckStockBean> getCheckStateList(CheckStockBean checkStock){
		try {
			return (List<CheckStockBean>) DBServer.quider.queryForList("getCheckNoComDef", checkStock);
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
	
	@SuppressWarnings("unchecked")
	public List<CheckStockListBean> getOneCheckList(CheckStockBean checkStock){
		CheckStockListBean tem_CheckStock=new CheckStockListBean();
		if(checkStock!=null){
			tem_CheckStock.setCsCode(checkStock.getCsCode());
		}else{
			tem_CheckStock.setCsCode("");
		}
		try {
			return (List<CheckStockListBean>) DBServer.quider.queryForList("selectOneCheckList", tem_CheckStock);
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			com.dbserver.DBServer.logger.exception(e);
			return new ArrayList<CheckStockListBean>();
		}
	}
	
	public CheckStockBean getCheckStock(String Id){
		try {
			return (CheckStockBean) DBServer.quider.queryForObjectById(Id, CheckStockBean.class);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			com.dbserver.DBServer.logger.exception(e);
			return new CheckStockBean();
		}
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
	
	public boolean updateCheckStockAll(List<CheckStockListBean> check_list,CheckStockBean checkStock){
		try {
			DBServer.quider.startTransaction();
			DBServer.quider.updateObject("updateCheckStockBean",checkStock);
			for(int i=0;i<check_list.size();i++){
				DBServer.quider.updateObject("updateCheckStockListBean",check_list.get(i));
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
