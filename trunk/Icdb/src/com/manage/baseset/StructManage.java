package com.manage.baseset;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.dbserver.DBServer;
import com.mydomain.bean.baseset.StructBean;

public class StructManage {

	@SuppressWarnings("unchecked")
	public List<StructBean> getStructList(StructBean struct){
		try {
			return (List<StructBean>) DBServer.quider.queryForList("selectStructDef",struct);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			com.dbserver.DBServer.logger.exception(e);
			return new ArrayList<StructBean>();
		}
	}
	
	@SuppressWarnings("unchecked")
	public List<StructBean> getStructAllList(){
		try {
			return (List<StructBean>) DBServer.quider.queryForList(StructBean.class);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			com.dbserver.DBServer.logger.exception(e);
			return new ArrayList<StructBean>();
		}
	}
	
	public StructBean getStructOne(String Id){
		try {
			return (StructBean) DBServer.quider.queryForObjectById(Id, StructBean.class);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			com.dbserver.DBServer.logger.exception(e);
			return new StructBean();
		}
	}
	
	public boolean addStruct(StructBean struct){
		try {
			DBServer.quider.insertObject(struct);
			return true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			com.dbserver.DBServer.logger.exception(e);
			return false;
		}
	}
	
	public boolean updateStruct(StructBean struct){
		try {
			DBServer.quider.updateObject(struct);
			return true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			com.dbserver.DBServer.logger.exception(e);
			return false;
		}
	}
	
	public StructBean getPageStruct(StructBean struct){
		PageManage pm=new PageManage();
		return (StructBean) pm.setPage(struct, "selectStructcount");
	}
}
