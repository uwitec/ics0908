package com.manage.baseset;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.dbserver.DBServer;
import com.mydomain.bean.baseset.CargoSpaceBean;
import com.mydomain.bean.baseset.StorehouseBean;

public class CargoSpaceManage {

	
	@SuppressWarnings("unchecked")
	public List<CargoSpaceBean> getCargoSpaceList(CargoSpaceBean cargoSpace){
		try {
			return (List<CargoSpaceBean>) DBServer.quider.queryForList("selectAllCargoSpaceBean", cargoSpace);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			com.dbserver.DBServer.logger.exception(e);
			return new ArrayList<CargoSpaceBean>();
		}
	}
	
	@SuppressWarnings("unchecked")
	public List<CargoSpaceBean> getCargoSapceOfStoreHouse(StorehouseBean storehouse){
		try {
			CargoSpaceBean csb=new CargoSpaceBean();
			csb.setStorehouseCode(storehouse.getStorehouseCode());
			return (List<CargoSpaceBean>) DBServer.quider.queryForList("getselectCargoSpaceByStoreHouseSpace",csb);
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
	
	public StorehouseBean getCargoSapceHouse(CargoSpaceBean cargo){
		try {
			return (StorehouseBean) DBServer.quider.queryForObject("findHouse", cargo.getCargoSpaceCode());
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			com.dbserver.DBServer.logger.exception(e);
			return new StorehouseBean();
		}
	}

	
	
}
