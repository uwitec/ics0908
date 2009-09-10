package com.action.baseset;

import java.sql.SQLException;
import java.util.List;

import com.dbserver.DBServer;
import com.mydomain.bean.baseset.UnitTypeBean;
import com.opensymphony.xwork2.ActionSupport;
import com.tools.DBControl;
import com.tools.ICTools;

public class UnitTypeAction extends ActionSupport{
	/**
	 *
	 */
	private static final long serialVersionUID = 1L;
	private int unitTypeCode; //��λ���ͱ���
	private String unitTypeName; //��λ�������
	private String unitTypeRemark; //��λ
	private UnitTypeBean utb;
	public List<UnitTypeBean> lhp;
	/**
	 * @return the lhp
	 */
	public List<UnitTypeBean> getLhp() {
		return lhp;
	}
	
	/**
	 * @return the unitTypeCode
	 */
	public int getUnitTypeCode() {
		return unitTypeCode;
	}
	/**
	 * @return the unitTypeName
	 */
	public String getUnitTypeName() {
		return unitTypeName;
	}
	/**
	 * @return the unitTypeRemark
	 */
	public String getUnitTypeRemark() {
		return unitTypeRemark;
	}
	/**
	 * @return the utb
	 */
	public UnitTypeBean getUtb() {
		return utb;
	}
	/**
	 * @param lhp the lhp to set
	 */
	public void setLhp(List<UnitTypeBean> lhp) {
		this.lhp = lhp;
	}

	/**
	 * @param unitTypeCode the unitTypeCode to set
	 */
	public void setUnitTypeCode(int unitTypeCode) {
		this.unitTypeCode = unitTypeCode;
	}
	/**
	 * @param unitTypeName the unitTypeName to set
	 */
	public void setUnitTypeName(String unitTypeName) {
		this.unitTypeName = unitTypeName;
	}
	/**
	 * @param unitTypeRemark the unitTypeRemark to set
	 */
	public void setUnitTypeRemark(String unitTypeRemark) {
		this.unitTypeRemark = unitTypeRemark;
	}
	/**
	 * @param utb the utb to set
	 */
	public void setUtb(UnitTypeBean utb) {
		this.utb = utb;
	}
	public String addUnitType(){
		utb=new UnitTypeBean();
		utb.setUnitTypeCode(unitTypeCode);
		utb.setUnitTypeName(unitTypeName);
		utb.setUnitTypeRemark(unitTypeRemark);
		DBControl db=new DBControl();
		if(db.insert(utb)){
			utb.setMessage(ICTools.MESSAGE_OK);
		}else{
			utb.setMessage(ICTools.MESSAGE_ERROR);
		}
		return SUCCESS;
	}
	public String getOneUnitType(){
		try {
			utb=(UnitTypeBean) DBServer.quider.queryForObjectById(unitTypeCode, UnitTypeBean.class);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return SUCCESS;
	}
	@SuppressWarnings("unchecked")
	public String showUnitType(){
		try {
			lhp=(List<UnitTypeBean>) DBServer.quider.queryForList(UnitTypeBean.class);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return SUCCESS;
	}
	public String updateUnitType(){
		utb=new UnitTypeBean();
		utb.setUnitTypeCode(unitTypeCode);
		utb.setUnitTypeName(unitTypeName);
		utb.setUnitTypeRemark(unitTypeRemark);
		try {
			DBServer.quider.updateObject(utb);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return SUCCESS;
	}
}
