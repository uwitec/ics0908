package com.action.baseset;

import java.util.LinkedHashMap;
import java.util.List;

import propeties.IcdbOption;

import com.manage.baseset.MaterielManage;
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
	private MaterielManage mm=new MaterielManage();
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
		materiel=mm.getPageMateriel(materiel);
		lhp=mm.getMaterielList(materiel);
		return SUCCESS;
	}
	
	public String addMateriel(){
		res=new ReSourceBean();
		if(mm.addMateriel(materiel)){
			res.setMessage(ICTools.MESSAGE_OK);
		}else{
			res.setMessage(ICTools.MESSAGE_ERROR);
		}
		return SUCCESS;
	}

	public String getOneMateriel(){
		lsb=IcdbOption.getABCType();
		materiel=mm.getMaterielOne(materiel.getMaterielCode());
		return SUCCESS;
	}
	
	
	public String updateMateriel(){
		if(mm.updateMateriel(materiel)){
			res.setMessage(ICTools.MESSAGE_UPDATEOK);
		}else{
			res.setMessage(ICTools.MESSAGE_ERROR);
		}
		return SUCCESS;
	}
	
	public String goAddMateriel(){
		materiel=new MaterielBean();
		materiel.setMaterielCode(ICTools.randId("M"));
		lsb=IcdbOption.getABCType();
		
		return SUCCESS;
	}
	
	public String findMateriel(){
		return this.showMateriel();
	}
	
}
