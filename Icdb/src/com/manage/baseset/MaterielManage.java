package com.manage.baseset;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.dbserver.DBServer;
import com.mydomain.bean.baseset.MaterielBean;
import com.tools.ICTools;

public class MaterielManage {

	@SuppressWarnings("unchecked")
	public List<MaterielBean> getMaterielList(MaterielBean materiel){
		try {
			return (List<MaterielBean>) DBServer.quider.queryForList("selectMaterielDef",materiel);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			com.dbserver.DBServer.logger.exception(e);
			return new ArrayList<MaterielBean>();
		}
	}
	
	public MaterielBean getMaterielOne(String Id){
		try {
			return (MaterielBean) DBServer.quider.queryForObjectById(Id, MaterielBean.class);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			com.dbserver.DBServer.logger.exception(e);
			return new MaterielBean();
		}
	}
	
	public MaterielBean getPageMateriel(MaterielBean materiel){
		PageManage pm=new PageManage();
		if(materiel==null){
			materiel=new MaterielBean();
			ICTools.setBean(materiel, "");
			materiel.setS_value("");
		}else{
			ICTools.setBean(materiel,materiel.getS_value());
		}
		return (MaterielBean) pm.setPage(materiel, "selectMaterielCount");
	}
	
	public boolean addMateriel(MaterielBean materiel){
		try {
			DBServer.quider.insertObject(materiel);
			return true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			com.dbserver.DBServer.logger.exception(e);
			return false;
		}
	}
	
	public boolean updateMateriel(MaterielBean materiel){
		try {
			DBServer.quider.updateObject(materiel);
			return true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			com.dbserver.DBServer.logger.exception(e);
			return false;
		}
	}
}
