package com.action.baseset;

import java.util.List;

import com.manage.baseset.CargoSpaceManage;
import com.mydomain.bean.baseset.CargoSpaceBean;
import com.mydomain.bean.baseset.ReSourceBean;
import com.opensymphony.xwork2.ActionSupport;
import com.tools.ICTools;

public class CargoSpaceAction extends ActionSupport{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private ReSourceBean res;
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
	/**
	 * @return the res
	 */
	public ReSourceBean getRes() {
		return res;
	}

	/**
	 * @param res the res to set
	 */
	public void setRes(ReSourceBean res) {
		this.res = res;
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
		res=new ReSourceBean();
		if(csm.addCargoSpace(cargoSpace)){
			res.setMessage(ICTools.MESSAGE_OK);
		}else{
			res.setMessage(ICTools.MESSAGE_ERROR);
		}
		return SUCCESS;
	}
	
	public String getOneCargoSpace(){
		
		cargoSpace=csm.getCargoSpaceOne(cargoSpace.getCargoSpaceCode());
		return SUCCESS;
	}
	
	public String updateCargoSpace(){
		
		if(csm.updateCargoSpace(cargoSpace)){
			res.setMessage(ICTools.MESSAGE_UPDATEOK);
		}else{
			res.setMessage(ICTools.MESSAGE_ERROR);
		}
		return SUCCESS;
	}



}
