package com.action.baseset;

import java.sql.SQLException;
import java.util.List;

import com.dbserver.DBServer;
import com.mydomain.bean.StorehouseBean;
import com.opensymphony.xwork2.ActionSupport;
import com.tools.ICTools;

public class StorehouseAction extends ActionSupport{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String storehouseCode; //库房编码
	private String storehouseName; //库房名称
	private String storehouseAddress; //库房地址
	private String storehouseDefaultCargo; //默认货位
	private String employeeCode; //管理员编码
	private String nextPath;
	private String rePath;
	private String message;
	private List<StorehouseBean> lhp;
	private StorehouseBean storehouse;
	/**
	 * @return the employeeCode
	 */
	public String getEmployeeCode() {
		return employeeCode;
	}
	/**
	 * @return the lhp
	 */
	public List<StorehouseBean> getLhp() {
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
	 * @return the storehouse
	 */
	public StorehouseBean getStorehouse() {
		return storehouse;
	}
	/**
	 * @return the storehouseAddress
	 */
	public String getStorehouseAddress() {
		return storehouseAddress;
	}
	/**
	 * @return the storehouseCode
	 */
	public String getStorehouseCode() {
		return storehouseCode;
	}
	/**
	 * @return the storehouseDefaultCargo
	 */
	public String getStorehouseDefaultCargo() {
		return storehouseDefaultCargo;
	}
	/**
	 * @return the storehouseName
	 */
	public String getStorehouseName() {
		return storehouseName;
	}
	/**
	 * @param employeeCode the employeeCode to set
	 */
	public void setEmployeeCode(String employeeCode) {
		this.employeeCode = employeeCode;
	}
	/**
	 * @param lhp the lhp to set
	 */
	public void setLhp(List<StorehouseBean> lhp) {
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
	 * @param storehouse the storehouse to set
	 */
	public void setStorehouse(StorehouseBean storehouse) {
		this.storehouse = storehouse;
	}
	/**
	 * @param storehouseAddress the storehouseAddress to set
	 */
	public void setStorehouseAddress(String storehouseAddress) {
		this.storehouseAddress = storehouseAddress;
	}
	/**
	 * @param storehouseCode the storehouseCode to set
	 */
	public void setStorehouseCode(String storehouseCode) {
		this.storehouseCode = storehouseCode;
	}
	/**
	 * @param storehouseDefaultCargo the storehouseDefaultCargo to set
	 */
	public void setStorehouseDefaultCargo(String storehouseDefaultCargo) {
		this.storehouseDefaultCargo = storehouseDefaultCargo;
	}
	/**
	 * @param storehouseName the storehouseName to set
	 */
	public void setStorehouseName(String storehouseName) {
		this.storehouseName = storehouseName;
	}

	@SuppressWarnings("unchecked")
	public String showStorehouse(){
		try {
			lhp=(List<StorehouseBean>) DBServer.quider.queryForList(0, 10, StorehouseBean.class);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return SUCCESS;
	}
	
	public String goAddStorehouse(){
		storehouseCode=ICTools.randId("ST");
		return SUCCESS;
	}
	
	public String addStorehouse(){
		storehouse=new StorehouseBean();
		storehouse.setStorehouseCode(storehouseCode);
		storehouse.setStorehouseName(storehouseName);
		storehouse.setStorehouseAddress(storehouseAddress);
		storehouse.setStorehouseDefaultCargo(storehouseDefaultCargo);
		storehouse.setEmployeeCode(employeeCode);
		try {
			DBServer.quider.insertObject(storehouse);
			message="";
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			message="请检查数据";
		}
		nextPath="/baseset/GoAddStorehouse.action";
		rePath="/baseset/ShowStorehouse.action";
		return SUCCESS;
	}
	
	public String getOneStorehouse(){
		try {
			storehouse=(StorehouseBean) DBServer.quider.queryForObjectById(storehouseCode, StorehouseBean.class);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return SUCCESS;
	}
	
	public String updateStorehouse(){
		storehouse=new StorehouseBean();
		storehouse.setStorehouseCode(storehouseCode);
		storehouse.setStorehouseName(storehouseName);
		storehouse.setStorehouseAddress(storehouseAddress);
		storehouse.setStorehouseDefaultCargo(storehouseDefaultCargo);
		storehouse.setEmployeeCode(employeeCode);
		
		try {
			DBServer.quider.updateObject(storehouse);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return SUCCESS;
	}
	
	public String deleteStorehouse(){
		storehouse=new StorehouseBean();
		storehouse.setStorehouseCode(storehouseCode);
		try {
			DBServer.quider.deleteObject(storehouse);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return SUCCESS;
	}
}
