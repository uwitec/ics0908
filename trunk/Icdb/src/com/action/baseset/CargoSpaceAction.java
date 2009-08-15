package com.action.baseset;

import java.sql.SQLException;
import java.util.List;

import com.dbserver.DBServer;
import com.mydomain.bean.CargoSapceBean;
import com.opensymphony.xwork2.ActionSupport;
import com.tools.ICTools;

public class CargoSpaceAction extends ActionSupport{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String cargoSpaceCode; //货位编码
	private String cargoSpaceName; //货位名称
	private String cargoSpaceAddress; //货位地址
	private String storehouseCode; //库房编码
	private String nextPath;
	private String rePath;
	private String message;
	private List<CargoSapceBean> lhp;
	private CargoSapceBean cargoSpace;
	/**
	 * @return the cargoSapce
	 */
	public CargoSapceBean getCargoSpace() {
		return cargoSpace;
	}
	/**
	 * @return the cargoSpaceAddress
	 */
	public String getCargoSpaceAddress() {
		return cargoSpaceAddress;
	}
	/**
	 * @return the cargoSpaceCode
	 */
	public String getCargoSpaceCode() {
		return cargoSpaceCode;
	}
	/**
	 * @return the cargoSpaceName
	 */
	public String getCargoSpaceName() {
		return cargoSpaceName;
	}
	/**
	 * @return the lhp
	 */
	public List<CargoSapceBean> getLhp() {
		return lhp;
	}
	/**
	 * @return the message
	 */
	public String getMessage() {
		return message;
	}
	/**
	 * @return the nextPath
	 */
	public String getNextPath() {
		return nextPath;
	}
	/**
	 * @return the rePath
	 */
	public String getRePath() {
		return rePath;
	}
	/**
	 * @return the storehouseCode
	 */
	public String getStorehouseCode() {
		return storehouseCode;
	}
	/**
	 * @param cargoSapce the cargoSapce to set
	 */
	public void setCargoSpace(CargoSapceBean cargoSpace) {
		this.cargoSpace = cargoSpace;
	}
	/**
	 * @param cargoSpaceAddress the cargoSpaceAddress to set
	 */
	public void setCargoSpaceAddress(String cargoSpaceAddress) {
		this.cargoSpaceAddress = cargoSpaceAddress;
	}
	/**
	 * @param cargoSpaceCode the cargoSpaceCode to set
	 */
	public void setCargoSpaceCode(String cargoSpaceCode) {
		this.cargoSpaceCode = cargoSpaceCode;
	}
	/**
	 * @param cargoSpaceName the cargoSpaceName to set
	 */
	public void setCargoSpaceName(String cargoSpaceName) {
		this.cargoSpaceName = cargoSpaceName;
	}
	/**
	 * @param lhp the lhp to set
	 */
	public void setLhp(List<CargoSapceBean> lhp) {
		this.lhp = lhp;
	}
	/**
	 * @param message the message to set
	 */
	public void setMessage(String message) {
		this.message = message;
	}
	/**
	 * @param nextPath the nextPath to set
	 */
	public void setNextPath(String nextPath) {
		this.nextPath = nextPath;
	}
	/**
	 * @param rePath the rePath to set
	 */
	public void setRePath(String rePath) {
		this.rePath = rePath;
	}
	/**
	 * @param storehouseCode the storehouseCode to set
	 */
	public void setStorehouseCode(String storehouseCode) {
		this.storehouseCode = storehouseCode;
	}
	
	@SuppressWarnings("unchecked")
	public String showCargoSpace(){
		try {
			lhp=(List<CargoSapceBean>) DBServer.quider.queryForList(CargoSapceBean.class);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return SUCCESS;
	}

	public String goAddCargoSpace(){
		cargoSpaceCode=ICTools.randId("C");
		return SUCCESS;
	}
	
	public String addCargoSpace(){
		cargoSpace=new CargoSapceBean();
		cargoSpace.setCargoSpaceCode(cargoSpaceCode);
		cargoSpace.setCargoSpaceName(cargoSpaceName);
		cargoSpace.setCargoSpaceAddress(cargoSpaceAddress);
		cargoSpace.setStorehouseCode(storehouseCode);
		try {
			DBServer.quider.insertObject(cargoSpace);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return SUCCESS;
	}
	
	public String getOneCargoSpace(){
		try {
			cargoSpace=(CargoSapceBean) DBServer.quider.queryForObjectById(cargoSpaceCode, CargoSapceBean.class);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return SUCCESS;
	}
	
	public String updateCargoSpace(){
		cargoSpace=new CargoSapceBean();
		cargoSpace.setCargoSpaceCode(cargoSpaceCode);
		cargoSpace.setCargoSpaceName(cargoSpaceName);
		cargoSpace.setCargoSpaceAddress(cargoSpaceAddress);
		cargoSpace.setStorehouseCode(storehouseCode);
		try {
			DBServer.quider.updateObject(cargoSpace);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return SUCCESS;
	}
}
