package com.action.stockmanage;

import java.util.LinkedHashMap;
import java.util.List;

import propeties.IcdbOption;

import com.manage.stockmanage.MaterielOutInFromManage;
import com.mydomain.bean.stockmanage.MaterInFromBean;
import com.mydomain.bean.stockmanage.MaterOutFromBean;
import com.opensymphony.xwork2.ActionSupport;
import com.tools.ICTools;

public class MaterielOutInFromAction extends ActionSupport{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private MaterInFromBean materinf;
	private MaterOutFromBean materoutf;
	private List<MaterInFromBean> lhp;
	private List<MaterOutFromBean> lhp2;
	private LinkedHashMap<String, String> lsb;
	
	
	/**
	 * @return the lhp2
	 */
	public List<MaterOutFromBean> getLhp2() {
		return lhp2;
	}
	/**
	 * @return the materoutf
	 */
	public MaterOutFromBean getMateroutf() {
		return materoutf;
	}
	/**
	 * @param lhp2 the lhp2 to set
	 */
	public void setLhp2(List<MaterOutFromBean> lhp2) {
		this.lhp2 = lhp2;
	}
	/**
	 * @param materoutf the materoutf to set
	 */
	public void setMateroutf(MaterOutFromBean materoutf) {
		this.materoutf = materoutf;
	}
	/**
	 * @return the lhp
	 */
	public List<MaterInFromBean> getLhp() {
		return lhp;
	}
	/**
	 * @return the lsb
	 */
	public LinkedHashMap<String, String> getLsb() {
		return lsb;
	}
	/**
	 * @return the materinf
	 */
	public MaterInFromBean getMaterinf() {
		return materinf;
	}
	/**
	 * @param lhp the lhp to set
	 */
	public void setLhp(List<MaterInFromBean> lhp) {
		this.lhp = lhp;
	}
	/**
	 * @param lsb the lsb to set
	 */
	public void setLsb(LinkedHashMap<String, String> lsb) {
		this.lsb = lsb;
	}
	/**
	 * @param materinf the materinf to set
	 */
	public void setMaterinf(MaterInFromBean materinf) {
		this.materinf = materinf;
	}
	
	@SuppressWarnings("unchecked")
	public String showMaterInFrom(){
		MaterielOutInFromManage moum=new MaterielOutInFromManage();
		if(materinf==null){
			materinf=new MaterInFromBean();
			materinf.setStartTime("2000-01-01");
			materinf.setEndTime(ICTools.getSearchTime());
		}
		if(materinf.getMaterielABC().equals("-1"))
			materinf.setMaterielABC("");
		materinf=moum.getMaterInPage(materinf);
		lhp=moum.getMaterInFromList(materinf);
		lsb=(LinkedHashMap<String, String>) IcdbOption.getABCType();		
		return SUCCESS;
	}
	
	@SuppressWarnings("unchecked")
	public String showMaterOutFrom(){
		MaterielOutInFromManage moum=new MaterielOutInFromManage();
		if(materoutf==null){
			materoutf=new MaterOutFromBean();
			materoutf.setStartTime("2000-01-01");
			materoutf.setEndTime(ICTools.getSearchTime());
		}
		if(materoutf.getMaterielABC().equals("-1"))
			materoutf.setMaterielABC("");
		materoutf=moum.getMaterOutPage(materoutf);
		lhp2=moum.getMaterOutFromList(materoutf);
		lsb=(LinkedHashMap<String, String>) IcdbOption.getABCType();	
		return SUCCESS;
	}
}
