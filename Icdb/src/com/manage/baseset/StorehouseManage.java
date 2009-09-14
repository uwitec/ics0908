package com.manage.baseset;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.dbserver.DBServer;
import com.mydomain.bean.baseset.StorehouseBean;
import com.tools.ICTools;

public class StorehouseManage {

	@SuppressWarnings("unchecked")
	public List<StorehouseBean> getStorhouesList(StorehouseBean storehouse){
		try {
			return (List<StorehouseBean>) DBServer.quider.queryForList("selectStorehouseDef",storehouse);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			com.dbserver.DBServer.logger.exception(e);
			return new ArrayList<StorehouseBean>();
		}
	}
	
	@SuppressWarnings("unchecked")
	public List<StorehouseBean> getStorhouseAllList(){
		try {
			return (List<StorehouseBean>) DBServer.quider.queryForList("seletStorehouseALL");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return new ArrayList<StorehouseBean>();
		}
	}
	
	public StorehouseBean getStorehouseOne(String Id){
		try {
			return (StorehouseBean) DBServer.quider.queryForObjectById(Id, StorehouseBean.class);
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			com.dbserver.DBServer.logger.exception(e);
			System.out.println("2");
			return new StorehouseBean();
		
		}
	}
	
	public boolean addStorehouse(StorehouseBean storehouse){
		try {
			DBServer.quider.insertObject(storehouse);
			return true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			com.dbserver.DBServer.logger.exception(e);
			return false;
		}
	}
	
	public boolean updateStorehouse(StorehouseBean storehouse){
		try {
			DBServer.quider.updateObject(storehouse);
			return true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			com.dbserver.DBServer.logger.exception(e);
			return false;
		}
	}
	
	public boolean deleteStorehouse(StorehouseBean storehouse){
		try {
			DBServer.quider.deleteObject(storehouse);
			return true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			com.dbserver.DBServer.logger.exception(e);
			return false;
		}
	}
	
	
	
	public StorehouseBean getPageStorehouse(StorehouseBean storehouse){
		PageManage pm=new PageManage();
		if(storehouse==null){
			storehouse=new StorehouseBean();
			ICTools.setBean(storehouse, "");
			storehouse.setS_value("");
		}else{
			ICTools.setBean(storehouse,storehouse.getS_value());
		}
		return (StorehouseBean) pm.setPage(storehouse, "selectStorehousecount");
	}
}
