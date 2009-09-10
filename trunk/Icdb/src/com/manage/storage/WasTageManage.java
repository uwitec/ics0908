package com.manage.storage;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.dbserver.DBServer;
import com.manage.baseset.PageManage;
import com.mydomain.bean.storage.WasTageBean;


public class WasTageManage {

	@SuppressWarnings("unchecked")
	public List<WasTageBean> getWasPersonList(WasTageBean wasTage){
		try {
			return  (List<WasTageBean>) DBServer.quider.queryForList("selectWasPerson", wasTage);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			com.dbserver.DBServer.logger.exception(e);
			return new ArrayList<WasTageBean>();
		}
	}
	
	public WasTageBean getPageWasTagePerson(WasTageBean wasTage){
		PageManage pm=new PageManage();
		return (WasTageBean) pm.setPage(wasTage, "selectWasPersonCount");
	}
	
	@SuppressWarnings("unchecked")
	public List<WasTageBean> getWasTageList(WasTageBean wasTage){
		try {
			return  (List<WasTageBean>) DBServer.quider.queryForList("selectWasTageDef", wasTage);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			com.dbserver.DBServer.logger.exception(e);
			return new ArrayList<WasTageBean>();
		}
	}
	
	public WasTageBean getPageWasTage(WasTageBean wasTage){
		PageManage pm=new PageManage();
		return (WasTageBean) pm.setPage(wasTage, "selectWasCount");
	}
	
	public WasTageBean getWasTageOne(String Id){
		try {
			return (WasTageBean) DBServer.quider.queryForObjectById(Id, WasTageBean.class);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			com.dbserver.DBServer.logger.exception(e);
			return new WasTageBean();
		}
	}
	
	public boolean addWasTage(WasTageBean wasTage){
		try {
			DBServer.quider.insertObject(wasTage);
			return true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			com.dbserver.DBServer.logger.exception(e);
			return false;
		}
	}
	
	public boolean updateWasTage(WasTageBean wasTage){
		try {
			DBServer.quider.updateObject(wasTage);
			return true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			com.dbserver.DBServer.logger.exception(e);
			return false;
		}
	}
}
