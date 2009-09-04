package com.action.baseset;

import java.sql.SQLException;
import java.util.LinkedHashMap;
import java.util.List;

import propeties.IcdbOption;

import com.dbserver.DBServer;
import com.manage.baseset.PageManage;
import com.mydomain.bean.baseset.MaterielBean;
import com.mydomain.bean.baseset.ReSourceBean;
import com.opensymphony.xwork2.ActionSupport;
import com.tools.ICTools;

public class MaterielAction extends ActionSupport{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private ReSourceBean res;
	private MaterielBean materiel;
	private List<MaterielBean> lhp;
	private LinkedHashMap<?,?> lsb;
	/**
	 * @return the lsb
	 */
	public LinkedHashMap<?,?>  getLsb() {
		return lsb;
	}
	/**
	 * @param lsb the lsb to set
	 */
	public void setLsb(LinkedHashMap<?,?>  lsb) {
		this.lsb = lsb;
	}
	/**
	 * @return the lhp
	 */
	public List<MaterielBean> getLhp() {
		return lhp;
	}
	/**
	 * @return the materiel
	 */
	public MaterielBean getMateriel() {
		return materiel;
	}
	/**
	 * @return the res
	 */
	public ReSourceBean getRes() {
		return res;
	}
	/**
	 * @param lhp the lhp to set
	 */
	public void setLhp(List<MaterielBean> lhp) {
		this.lhp = lhp;
	}
	/**
	 * @param materiel the materiel to set
	 */
	public void setMateriel(MaterielBean materiel) {
		this.materiel = materiel;
	}
	/**
	 * @param res the res to set
	 */
	public void setRes(ReSourceBean res) {
		this.res = res;
	}
	
	@SuppressWarnings("unchecked")
	public String showMateriel(){
		try {
			PageManage pm=new PageManage();
			if(materiel==null){
				materiel=new MaterielBean();
			}
			if(res==null){
				res=new ReSourceBean();
				ICTools.setBean(materiel, "");
				res.setS_value("");
			}else{
				ICTools.setBean(materiel,res.getS_value());
			}
			lsb=IcdbOption.getABCType();
			materiel=(MaterielBean) pm.setPage(materiel, "selectMaterielCount");
			lhp=(List<MaterielBean>) DBServer.quider.queryForList("selectMaterielDef",materiel);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return SUCCESS;
	}
	
	public String addMateriel(){
		res=new ReSourceBean();
		try {
			DBServer.quider.insertObject(materiel);
			res.setMessage(ICTools.MESSAGE_OK);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			res.setMessage(ICTools.MESSAGE_ERROR);
		}
		res.setNextPath("/baseset/GoAddMateriel.action");
		res.setRePath("/baseset/ShowMateriel.action");
		
		return SUCCESS;
	}

	public String getOneMateriel(){
		try {
			lsb=IcdbOption.getABCType();
			materiel=(MaterielBean) DBServer.quider.queryForObjectById(materiel.getMaterielCode(), MaterielBean.class);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return SUCCESS;
	}
	public String updateMateriel(){
		try {
			DBServer.quider.updateObject(materiel);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return SUCCESS;
	}
	
	public String goAddMateriel(){
		materiel=new MaterielBean();
		materiel.setMaterielCode(ICTools.randId("M"));
		lsb=IcdbOption.getABCType();
		
		return SUCCESS;
	}
	
	
}
