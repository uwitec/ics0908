package com.action;

import java.util.List;

import com.mydomain.bean.ManageSetBean;
import com.opensymphony.xwork2.ActionSupport;

public class ManageSetAction extends ActionSupport{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private ManageSetBean manageset;
	private List<ManageSetBean> lhp;
	/**
	 * @return the lhp
	 */
	public List<ManageSetBean> getLhp() {
		return lhp;
	}
	/**
	 * @return the manageset
	 */
	public ManageSetBean getManageset() {
		return manageset;
	}
	/**
	 * @param lhp the lhp to set
	 */
	public void setLhp(List<ManageSetBean> lhp) {
		this.lhp = lhp;
	}
	/**
	 * @param manageset the manageset to set
	 */
	public void setManageset(ManageSetBean manageset) {
		this.manageset = manageset;
	}

	public String showManageSet(){
		
		return SUCCESS;
	}
}
