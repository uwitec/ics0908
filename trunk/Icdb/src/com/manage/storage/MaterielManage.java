package com.manage.storage;

import java.sql.SQLException;
import java.util.List;

import com.dbserver.DBServer;
import com.mydomain.bean.storage.MaterielBean;

public class MaterielManage {

	private MaterielBean materielBean;

	private List<MaterielBean> materielList;

	@SuppressWarnings("unchecked")
	public List<MaterielBean> getAllMateriel(MaterielBean materielBean) throws SQLException{

		this.materielBean = materielBean;
		this.materielList = (List<MaterielBean>) DBServer.quider.queryForList(
				"SHOW_MATERIEL",materielBean);

		return materielList;
	}

	public MaterielBean getMaterielBean() {
		return materielBean;
	}

	public void setMaterielBean(MaterielBean materielBean) {
		this.materielBean = materielBean;
	}

	public List<MaterielBean> getMaterielList() {
		return materielList;
	}

	public void setMaterielList(List<MaterielBean> materielList) {
		this.materielList = materielList;
	}


}
