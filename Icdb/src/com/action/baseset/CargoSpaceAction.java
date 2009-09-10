package com.action.baseset;

import java.util.List;

import com.manage.baseset.CargoSpaceManage;
import com.mydomain.bean.baseset.CargoSpaceBean;
import com.opensymphony.xwork2.ActionSupport;
import com.tools.ICTools;

public class CargoSpaceAction extends ActionSupport{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private List<CargoSpaceBean> lhp;
	private CargoSpaceBean cargoSpace;
	private CargoSpaceManage csm;
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
		lhp=csm.getCargoSpaceList(cargoSpace);
		return SUCCESS;
	}
	
	/*
	@SuppressWarnings("unchecked")
	public String showCargoSpace(){
		try {
			lhp=(List<CargoSpaceBean>) DBServer.quider.queryForList(CargoSpaceBean.class);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return SUCCESS;
	}
	*/
	
	public String goAddCargoSpace(){
		cargoSpace.setCargoSpaceCode(ICTools.randId("C"));
		return SUCCESS;
	}
	
	public String addCargoSpace(){
		if(csm.addCargoSpace(cargoSpace)){
			cargoSpace.setMessage(ICTools.MESSAGE_OK);
		}else{
			cargoSpace.setMessage(ICTools.MESSAGE_ERROR);
		}
		return SUCCESS;
	}
	
	public String getOneCargoSpace(){
		
		cargoSpace=csm.getCargoSpaceOne(cargoSpace.getCargoSpaceCode());
		return SUCCESS;
	}
	
	public String updateCargoSpace(){
		
		if(csm.updateCargoSpace(cargoSpace)){
			cargoSpace.setMessage(ICTools.MESSAGE_UPDATEOK);
		}else{
			cargoSpace.setMessage(ICTools.MESSAGE_ERROR);
		}
		return SUCCESS;
	}



}
