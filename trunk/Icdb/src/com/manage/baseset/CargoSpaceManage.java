package com.manage.baseset;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.dbserver.DBServer;
import com.mydomain.bean.baseset.CargoSpaceBean;

public class CargoSpaceManage {

	
	@SuppressWarnings("unchecked")
	public List<CargoSpaceBean> getCargoSpaceList(CargoSpaceBean cargoSpace){
		try {
			return (List<CargoSpaceBean>) DBServer.quider.queryForList("getHouseSpace", cargoSpace);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			com.dbserver.DBServer.logger.exception(e);
			return new ArrayList<CargoSpaceBean>();
		}
	}
	
	public boolean addCargoSpace(CargoSpaceBean cargoSpace){
		try {
			DBServer.quider.insertObject(cargoSpace);
			return true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			com.dbserver.DBServer.logger.exception(e);
			return false;
		}
	}
	
	public boolean updateCargoSpace(CargoSpaceBean cargoSpace){
		try {
			DBServer.quider.updateObject(cargoSpace);
			return true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			com.dbserver.DBServer.logger.exception(e);
			return false;
		}
	}
	
	public CargoSpaceBean getCargoSpaceOne(String Id){
		try {
			return (CargoSpaceBean) DBServer.quider.queryForObjectById(Id, CargoSpaceBean.class);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			com.dbserver.DBServer.logger.exception(e);
			return new CargoSpaceBean();
		}
	}
	
	
}
