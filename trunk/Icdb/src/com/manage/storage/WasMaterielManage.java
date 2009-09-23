package com.manage.storage;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.dbserver.DBServer;
import com.mydomain.bean.storage.WasMaterielBean;
import com.mydomain.bean.storage.WasTageBean;

public class WasMaterielManage {

	
	@SuppressWarnings("unchecked")
	public List<WasMaterielBean> getWasMaterileList(WasMaterielBean wasMateriel){
		try {
			return (List<WasMaterielBean>) DBServer.quider.queryForList("selectWasMaterielDef", wasMateriel);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			com.dbserver.DBServer.logger.exception(e);
			return new ArrayList<WasMaterielBean>();
		}
	}
	
	public boolean addWasMateriel(WasMaterielBean wasMateriel){
		try {
			DBServer.quider.insertObject(wasMateriel);
			return true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			com.dbserver.DBServer.logger.exception(e);
			return false;
		}
	}
	
	public boolean addWasMaterielList(List<WasMaterielBean> w_List,WasTageBean wasTage){
		if(w_List!=null){
			try {
				DBServer.quider.startTransaction();
				DBServer.quider.insertObject(wasTage);
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
	
	public boolean addWasMaterielList(WasMaterielBean[] wasMater_,WasTageBean wasTage){
		if(wasMater_!=null){
			try {
				DBServer.quider.insertObject(wasTage);
				for (int i = 0; i < wasMater_.length; i++) {
					DBServer.quider.insertObject(wasMater_[i]);
				}
				DBServer.quider.commitTransaction();
				return true;
			} catch (Exception e) {
				// TODO: handle exception
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
	
	public boolean updateWasMaterList(List<WasMaterielBean> w_List){
		if(w_List!=null){
			try {
				DBServer.quider.startTransaction();
				for(int i=0;i<w_List.size();i++){
					DBServer.quider.updateObject((WasMaterielBean)w_List.get(i));
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
