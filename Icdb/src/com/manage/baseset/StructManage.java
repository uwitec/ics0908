package com.manage.baseset;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.dbserver.DBServer;
import com.mydomain.bean.baseset.StructBean;
import com.tools.ICTools;

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
		if(struct==null){
			struct=new StructBean();
			ICTools.setBean(struct, "");
			struct.setS_value("");
		}else{
			ICTools.setBean(struct,struct.getS_value());
		}
		return (StructBean) pm.setPage(struct, "selectStructcount");
	}
}
