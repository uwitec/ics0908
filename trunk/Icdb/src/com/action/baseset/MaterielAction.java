package com.action.baseset;

import java.util.LinkedHashMap;
import java.util.List;

import propeties.IcdbOption;

import com.manage.baseset.MaterielManage;
import com.mydomain.bean.baseset.MaterielBean;
import com.opensymphony.xwork2.ActionSupport;
import com.tools.ICTools;

public class MaterielAction extends ActionSupport{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
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

	
	@SuppressWarnings("unchecked")
	public String showMateriel(){
		lsb=IcdbOption.getABCType();
		lsb.remove("-1");
		materiel=mm.getPageMateriel(materiel);
		lhp=mm.getMaterielList(materiel);
		return SUCCESS;
	}
	
	public String addMateriel(){
		if(mm.addMateriel(materiel)){
			materiel.setMessage(ICTools.MESSAGE_OK);
		}else{
			materiel.setMessage(ICTools.MESSAGE_ERROR);
		}
		return SUCCESS;
	}

	public String getOneMateriel(){
		lsb=IcdbOption.getABCType();
		lsb.remove("-1");
		materiel=mm.getMaterielOne(materiel.getMaterielCode());
		return SUCCESS;
	}
	
	
	public String updateMateriel(){
		if(mm.updateMateriel(materiel)){
			materiel.setMessage(ICTools.MESSAGE_UPDATEOK);
		}else{
			materiel.setMessage(ICTools.MESSAGE_ERROR);
		}
		return SUCCESS;
	}
	
	public String goAddMateriel(){
		materiel=new MaterielBean();
		materiel.setMaterielCode(ICTools.randId("M"));
		lsb=IcdbOption.getABCType();
		lsb.remove("-1");
		return SUCCESS;
	}
	
	public String findMateriel(){
		return this.showMateriel();
	}
	
}
