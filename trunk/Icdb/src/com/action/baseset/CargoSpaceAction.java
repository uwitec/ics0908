package com.action.baseset;

import java.util.List;

import com.manage.baseset.CargoSpaceManage;
import com.manage.baseset.StorehouseManage;
import com.mydomain.bean.baseset.CargoSpaceBean;
import com.mydomain.bean.baseset.StorehouseBean;
import com.opensymphony.xwork2.ActionSupport;
import com.tools.ICTools;

public class CargoSpaceAction extends ActionSupport{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private List<CargoSpaceBean> lhp;
	private CargoSpaceBean cargoSpace;
	private StorehouseBean storehouse;
	
	
	/**
	 * @return the storehouse
	 */
	public StorehouseBean getStorehouse() {
		return storehouse;
	}

	/**
	 * @param storehouse the storehouse to set
	 */
	public void setStorehouse(StorehouseBean storehouse) {
		this.storehouse = storehouse;
	}

	/**
	 * @return the cargoSapce
	 */
	public CargoSpaceBean getCargoSpace() {
		return cargoSpace;
	}
	
	/**
	 * @return the lhp
	 */
	public List<CargoSpaceBean> getLhp() {
		return lhp;
	}
	
	/**
	 * @param cargoSapce the cargoSapce to set
	 */
	public void setCargoSpace(CargoSpaceBean cargoSpace) {
		this.cargoSpace = cargoSpace;
	}
	/**
	 * @param lhp the lhp to set
	 */
	public void setLhp(List<CargoSpaceBean> lhp) {
		this.lhp = lhp;
	}

	
	@SuppressWarnings("unchecked")
	public String getHouseSapce(){
		CargoSpaceManage csm=new CargoSpaceManage();
		lhp=csm.getCargoSpaceList(cargoSpace);
		return SUCCESS;
	}
	
	
	@SuppressWarnings("unchecked")
	public String showCargoSpace(){
		CargoSpaceManage csm=new CargoSpaceManage();
		StorehouseManage sm=new StorehouseManage();
		storehouse=sm.getStorehouseOne(cargoSpace.getStorehouseCode());
		lhp=csm.getCargoSapceOfStoreHouse(storehouse);
		return SUCCESS;
	}
	
	
	public String goAddCargoSpace(){
		cargoSpace.setCargoSpaceCode(ICTools.randId("C"));
		return SUCCESS;
	}
	
	public String addCargoSpace(){
		CargoSpaceManage csm=new CargoSpaceManage();
		if(csm.addCargoSpace(cargoSpace)){
			cargoSpace.setMessage(ICTools.MESSAGE_OK);
		}else{
			cargoSpace.setMessage(ICTools.MESSAGE_ERROR);
		}
		return SUCCESS;
	}
	
	public String getOneCargoSpace(){
		CargoSpaceManage csm=new CargoSpaceManage();
		cargoSpace=csm.getCargoSpaceOne(cargoSpace.getCargoSpaceCode());
		return SUCCESS;
	}
	
	public String updateCargoSpace(){
		CargoSpaceManage csm=new CargoSpaceManage();
		if(csm.updateCargoSpace(cargoSpace)){
			cargoSpace.setMessage(ICTools.MESSAGE_UPDATEOK);
		}else{
			cargoSpace.setMessage(ICTools.MESSAGE_ERROR);
		}
		return SUCCESS;
	}



}
