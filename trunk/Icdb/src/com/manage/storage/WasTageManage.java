package com.manage.storage;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.dbserver.DBServer;
import com.manage.baseset.PageManage;
import com.mydomain.bean.storage.WasMaterielBean;
import com.mydomain.bean.storage.WasTageBean;
import com.tools.ICTools;


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
		if(wasTage==null){
			wasTage=new WasTageBean();
			ICTools.setBean(wasTage, "");
			wasTage.setS_value("");
		}else{
			ICTools.setBean(wasTage,wasTage.getS_value());
		}
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
	
	public boolean deleteWasTage(WasTageBean wasTage){
		try {
			DBServer.quider.deleteObject("deleteWasTageBean", wasTage);
			return true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			com.dbserver.DBServer.logger.exception(e);
			return false;
		}
		
	}
	
	public boolean updateWasTageAll(List<WasMaterielBean> w_List,WasTageBean wasTage){
		if(w_List!=null){
			try {
				WasMaterielBean temp_wmb=new WasMaterielBean();
				temp_wmb.setWasCode(wasTage.getWasCode());
				
				DBServer.quider.startTransaction();
				DBServer.quider.deleteObject(temp_wmb);
				DBServer.quider.updateObject(wasTage);
				for(int i=0;i<w_List.size();i++){
					DBServer.quider.insertObject((WasMaterielBean)w_List.get(i));
				}
				DBServer.quider.commitTransaction();
				return true;
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				com.dbserver.DBServer.logger.exception(e);
				return false;
			}finally{
				try {
					DBServer.quider.endTransaction();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					com.dbserver.DBServer.logger.exception(e);
				}
			}
		}else{
			return false;
		}
	}
	
}
