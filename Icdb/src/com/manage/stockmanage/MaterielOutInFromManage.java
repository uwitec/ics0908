package com.manage.stockmanage;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.dbserver.DBServer;
import com.manage.baseset.PageManage;
import com.mydomain.bean.stockmanage.MaterInFromBean;
import com.mydomain.bean.stockmanage.MaterOutFromBean;

public class MaterielOutInFromManage {

	
	public MaterInFromBean getMaterInPage(MaterInFromBean materinf){
		PageManage pm=new PageManage();
		if(materinf==null)
			materinf=new MaterInFromBean();
		return (MaterInFromBean) pm.setPage(materinf, "materInFromCount");
	}
	
	@SuppressWarnings("unchecked")
	public List<MaterInFromBean> getMaterInFromList(MaterInFromBean materinf){
		try {
			return (List<MaterInFromBean>) DBServer.quider.queryForList("materInFromList", materinf);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			com.dbserver.DBServer.logger.exception(e);
			return new ArrayList<MaterInFromBean>();
		}
	}
	
	public MaterOutFromBean getMaterOutPage(MaterOutFromBean materoutf){
		PageManage pm=new PageManage();
		if(materoutf==null)
			materoutf=new MaterOutFromBean();
		return (MaterOutFromBean) pm.setPage(materoutf, "materOutFromCount");
	}
	
	@SuppressWarnings("unchecked")
	public List<MaterOutFromBean> getMaterOutFromList(MaterOutFromBean materoutf){
		try {
			return (List<MaterOutFromBean>) DBServer.quider.queryForList("materOutFromList", materoutf);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			com.dbserver.DBServer.logger.exception(e);
			return new ArrayList<MaterOutFromBean>();
		}
	}
}
