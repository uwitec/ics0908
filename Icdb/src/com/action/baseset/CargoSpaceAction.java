package com.action.baseset;

import java.sql.SQLException;
import java.util.List;

import com.dbserver.DBServer;
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
		try {
			lhp=(List<CargoSpaceBean>) DBServer.quider.queryForList("getHouseSpace", cargoSpace, 0, 10);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return SUCCESS;
	}
	
	
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

	public String goAddCargoSpace(){
		cargoSpace.setCargoSpaceCode(ICTools.randId("C"));
		System.out.println(cargoSpace.getStorehouseName());
		System.out.println(cargoSpace.getStorehouseCode());
		return SUCCESS;
	}
	
	public String addCargoSpace(){
		res=new ReSourceBean();
		try {
			DBServer.quider.insertObject(cargoSpace);
			res.setMessage(ICTools.MESSAGE_OK);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			res.setMessage(ICTools.MESSAGE_ERROR);
		}
		//res.setNextPath("/baseset/GoAddCargoSpace.action");
		//res.setRePath("/baseset/ShowCargoSpace.action");
		res.setNextPath("/baseset/GoAddCargoSpace.action?cargoSpace.storehouseCode="+cargoSpace.getStorehouseCode()+"&cargoSpace.storehouseName="+cargoSpace.getCargoSpaceName());
		res.setRePath("/baseset/ShowCargoSpace.action?cargoSpace.storehouseCode="+cargoSpace.getStorehouseCode()+"&cargoSpace.storehouseName="+cargoSpace.getCargoSpaceName());
		return SUCCESS;
	}
	
	public String getOneCargoSpace(){
		try {
			cargoSpace=(CargoSpaceBean) DBServer.quider.queryForObjectById(cargoSpace.getCargoSpaceCode(), CargoSpaceBean.class);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return SUCCESS;
	}
	
	public String updateCargoSpace(){
		try {
			DBServer.quider.updateObject(cargoSpace);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return SUCCESS;
	}



}
