package com.action.baseset;

import java.sql.SQLException;
import java.util.List;

import com.dbserver.DBServer;
import com.manage.baseset.UnitManage;
import com.mydomain.bean.baseset.UnitTypeBean;
import com.mydomain.bean.baseset.UnitBean;
import com.opensymphony.xwork2.ActionSupport;
import com.tools.ICTools;

public class UnitAction extends ActionSupport{
	/**
	 *
	 */
	private static final long serialVersionUID = 1L;

	private List<UnitTypeBean> lutb;
	private UnitBean unit;
	private List<UnitBean> lhp;

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
	 * @return the unit
	 */
	public UnitBean getUnit() {
		return unit;
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
	 * @param unit the unit to set
	 */
	public void setUnit(UnitBean unit) {
		this.unit = unit;
	}

	public String addUnit(){
		UnitManage um=new UnitManage();
		if(um.addUnit(unit)){
			unit.setMessage(ICTools.MESSAGE_OK);
		}else{
			unit.setMessage(ICTools.MESSAGE_ERROR);
		}
		return SUCCESS;
	}
	@SuppressWarnings("unchecked")
	public String getOneUnit(){
		UnitManage um=new UnitManage();
		try {
			unit=um.getUnitOne(unit.getUnitCode());
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
	public String selectUnitDef(){
		ICTools.setBean(unit, ICTools.likeString(unit.getS_value()));
		UnitManage um=new UnitManage();
		lhp=um.getUnitList(unit);
		return SUCCESS;
	}

	@SuppressWarnings("unchecked")
	public String showUnit(){
		UnitManage um=new UnitManage();
		lhp=um.getUnitAllList();
		return SUCCESS;
	}

	public String updateUnit(){
		UnitManage um=new UnitManage();
		if(um.updateUnit(unit)){
			unit.setMessage(ICTools.MESSAGE_UPDATEOK);
		}else{
			unit.setMessage(ICTools.MESSAGE_ERROR);
		}
		return SUCCESS;
	}

}
