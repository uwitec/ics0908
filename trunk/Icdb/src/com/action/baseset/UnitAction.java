package com.action.baseset;

import java.sql.SQLException;
import java.util.List;

import com.dbserver.DBServer;
import com.mydomain.bean.baseset.UnitTypeBean;
import com.mydomain.bean.baseset.ReSourceBean;
import com.mydomain.bean.baseset.UnitBean;
import com.opensymphony.xwork2.ActionSupport;
import com.tools.ICTools;

public class UnitAction extends ActionSupport{
	/**
	 *
	 */
	private static final long serialVersionUID = 1L;

	private ReSourceBean res;
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
	public String addUnit(){
		res=new ReSourceBean();
		try {
			DBServer.quider.insertObject(unit);
			res.setMessage(ICTools.MESSAGE_OK);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			res.setMessage(ICTools.MESSAGE_ERROR);
		}
		res.setNextPath("/baseset/GoAddUnit.action");
		res.setRePath("/baseset/ShowUnit.action");

		return SUCCESS;
	}
	@SuppressWarnings("unchecked")
	public String getOneUnit(){
		try {
			unit=(UnitBean) DBServer.quider.queryForObjectById(unit.getUnitCode(), UnitBean.class);
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
		ICTools.setBean(unit, ICTools.likeString(res.getS_value()));
		try {
			lhp=(List<UnitBean>) DBServer.quider.queryForList("selectUnitDef",unit,0,10);
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
		try {
			DBServer.quider.updateObject(unit);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return SUCCESS;
	}

}
