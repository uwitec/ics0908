package com.action.baseset;

import java.sql.SQLException;
import java.util.List;

import com.dbserver.DBServer;
import com.mydomain.bean.UnitBean;
import com.mydomain.bean.UnitTypeBean;
import com.opensymphony.xwork2.ActionSupport;
import com.tools.DBControl;

public class UnitAction extends ActionSupport{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String unitCode;
	private String unitName;
	private int unitTypeCode;
	
	private String nextPath;
	private String rePath;
	private String message;
	private List<UnitTypeBean> lutb;
	private UnitBean unit;
	private List<UnitBean> lhp;
	private int isEnabled;
	/**
	 * @return the isEnabled
	 */
	public int getIsEnabled() {
		return isEnabled;
	}
	/**
	 * @return the lhp
	 */
	public List<UnitBean> getLhp() {
		return lhp;
	}
	/**
	 * @return the lutb
	 */
	public List<UnitTypeBean> getLutb() {
		return lutb;
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
	 * @return the unit
	 */
	public UnitBean getUnit() {
		return unit;
	}
	/**
	 * @return the unitCode
	 */
	public String getUnitCode() {
		return unitCode;
	}
	/**
	 * @return the unitName
	 */
	public String getUnitName() {
		return unitName;
	}
	/**
	 * @return the unitTypeCode
	 */
	public int getUnitTypeCode() {
		return unitTypeCode;
	}
	/**
	 * @param isEnabled the isEnabled to set
	 */
	public void setIsEnabled(int isEnabled) {
		this.isEnabled = isEnabled;
	}
	/**
	 * @param lhp the lhp to set
	 */
	public void setLhp(List<UnitBean> lhp) {
		this.lhp = lhp;
	}
	/**
	 * @param lutb the lutb to set
	 */
	public void setLutb(List<UnitTypeBean> lutb) {
		this.lutb = lutb;
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
	 * @param unit the unit to set
	 */
	public void setUnit(UnitBean unit) {
		this.unit = unit;
	}
	/**
	 * @param unitCode the unitCode to set
	 */
	public void setUnitCode(String unitCode) {
		this.unitCode = unitCode;
	}
	/**
	 * @param unitName the unitName to set
	 */
	public void setUnitName(String unitName) {
		this.unitName = unitName;
	}
	/**
	 * @param unitTypeCode the unitTypeCode to set
	 */
	public void setUnitTypeCode(int unitTypeCode) {
		this.unitTypeCode = unitTypeCode;
	}
	public String addUnit(){
		unit=new UnitBean();
		unit.setUnitCode(unitCode);
		unit.setUnitName(unitName);
		unit.setUnitTypeCode(unitTypeCode);
		DBControl db=new DBControl();
		if(db.insert(unit)){
			message="";
		}else{
			message="有已经存在为"+unitCode+"的编号，请重新输入";
		}
		nextPath="/baseset/GoAddUnit.action";
		rePath="/baseset/ShowUnit.action";
		return SUCCESS;
	}
	@SuppressWarnings("unchecked")
	public String getOneUnit(){
		try {
		
			unit=(UnitBean) DBServer.quider.queryForObjectById(unitCode, UnitBean.class);
			lutb=(List<UnitTypeBean>) DBServer.quider.queryForList(UnitTypeBean.class);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return SUCCESS;
	}
	@SuppressWarnings("unchecked")
	public String goAddUnit(){
		try {
			lutb=(List<UnitTypeBean>) DBServer.quider.queryForList(UnitTypeBean.class);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return SUCCESS;
	}
	@SuppressWarnings("unchecked")
	public String showUnit(){
		
		try {
			lhp=(List<UnitBean>) DBServer.quider.queryForList(UnitBean.class);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return SUCCESS;
	}

	public String updateUnit(){
		unit=new UnitBean();
		unit.setUnitCode(unitCode);
		unit.setUnitName(unitName);
		unit.setUnitTypeCode(unitTypeCode);
		unit.setIsEnabled(isEnabled);
		try {
			DBServer.quider.updateObject(unit);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return SUCCESS;
	}
}
