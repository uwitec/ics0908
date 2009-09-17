package com.manage.storage;

import java.sql.SQLException;
import java.util.List;

import com.dbserver.DBServer;
import com.mydomain.bean.baseset.CargoSpaceBean;

public class CargoSpaceManage {

	@SuppressWarnings("unchecked")
	public List<CargoSpaceBean> getCargoSpaceList() throws SQLException{
		return (List<CargoSpaceBean>) DBServer.quider.queryForList("selectAllCargoSpace");
	}

	@SuppressWarnings("unchecked")
	public List<CargoSpaceBean> getCargoSListByCondition(CargoSpaceBean cargoSpaceBean) throws SQLException{
		return (List<CargoSpaceBean>) DBServer.quider.queryForList("selectAllCargoSpace",cargoSpaceBean);
	}
}
