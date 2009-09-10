package com.manage.baseset;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.dbserver.DBServer;
import com.mydomain.bean.baseset.UnitBean;

public class UnitManage {

	@SuppressWarnings("unchecked")
	public List<UnitBean> getUnitList(UnitBean unit){
		try {
			return (List<UnitBean>) DBServer.quider.queryForList("selectUnitDef",unit);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			com.dbserver.DBServer.logger.exception(e);
			return new ArrayList<UnitBean>();
		}
	}
	
	@SuppressWarnings("unchecked")
	public List<UnitBean> getUnitAllList(){
		try {
			return (List<UnitBean>) DBServer.quider.queryForList(UnitBean.class);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			com.dbserver.DBServer.logger.exception(e);
			return new ArrayList<UnitBean>();
		}
	}
	
	public UnitBean getUnitOne(String Id){
		try {
			return (UnitBean) DBServer.quider.queryForObjectById(Id, UnitBean.class);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			com.dbserver.DBServer.logger.exception(e);
			return new UnitBean();
		}
	}
	
	public boolean addUnit(UnitBean unit){
		try {
			DBServer.quider.insertObject(unit);
			return true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			com.dbserver.DBServer.logger.exception(e);
			return false;
		}
	}
	
	public boolean updateUnit(UnitBean unit){
		try {
			DBServer.quider.updateObject(unit);
			return true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			com.dbserver.DBServer.logger.exception(e);
			return false;
		}
	}
}
