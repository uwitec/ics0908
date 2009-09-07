package com.manage.baseset;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.dbserver.DBServer;
import com.mydomain.bean.baseset.SupplierBean;

public class SupplierManage {

	@SuppressWarnings("unchecked")
	public List<SupplierBean> getSupplierList(SupplierBean supplier){
		try {
			return (List<SupplierBean>) DBServer.quider.queryForList("selectSupplierDef", supplier);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			com.dbserver.DBServer.logger.exception(e);
			return new ArrayList<SupplierBean>();
		}
	}
	
	public SupplierBean getPageSupplier(SupplierBean supplier){
		PageManage pm=new PageManage();
		return (SupplierBean) pm.setPage(supplier, "selectSupplierCount");
	}
	
	public SupplierBean getSupplierOne(String Id){
		try {
			return (SupplierBean) DBServer.quider.queryForObjectById(Id, SupplierBean.class);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			com.dbserver.DBServer.logger.exception(e);
			return new SupplierBean();
		}	
	}
	
	public boolean addSupplier(SupplierBean supplier){
		try {
			DBServer.quider.insertObject(supplier);
			return true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			com.dbserver.DBServer.logger.exception(e);
			return false;
		}
	}
	
	public boolean updateSupplier(SupplierBean supplier){
		try {
			DBServer.quider.updateObject(supplier);
			return true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			com.dbserver.DBServer.logger.exception(e);
			return false;
		}
	}
	
	public boolean deleteSupplier(SupplierBean supplier){
		try {
			DBServer.quider.deleteObject(supplier);
			return true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			com.dbserver.DBServer.logger.exception(e);
			return false;
		}
	}
}
