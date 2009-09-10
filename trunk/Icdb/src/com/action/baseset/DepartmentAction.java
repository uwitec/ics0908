package com.action.baseset;

import java.util.List;

import com.manage.baseset.DepartmentManage;
import com.manage.baseset.StructManage;
import com.mydomain.bean.baseset.DepartmentBean;
import com.mydomain.bean.baseset.StructBean;
import com.opensymphony.xwork2.ActionSupport;
import com.tools.ICTools;

public class DepartmentAction extends ActionSupport{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private List<StructBean> lsb;
	private DepartmentBean department;
	private List<DepartmentBean> lhp;
	private DepartmentManage dm=new DepartmentManage();
	private StructManage sm=new StructManage();
	/**
	 * @return the department
	 */
	public DepartmentBean getDepartment() {
		return department;
	}
	/**
	 * @return the lsb
	 */
	public List<StructBean> getLsb() {
		return lsb;
	}
	/**
	 * @param department the department to set
	 */
	public void setDepartment(DepartmentBean department) {
		this.department = department;
	}
	/**
	 * @param lsb the lsb to set
	 */
	public void setLsb(List<StructBean> lsb) {
		this.lsb = lsb;
	}
	/**
	 * @return the lhp
	 */
	public List<DepartmentBean> getLhp() {
		return lhp;
	}
	/**
	 * @param lhp the lhp to set
	 */
	public void setLhp(List<DepartmentBean> lhp) {
		this.lhp = lhp;
	}
	public String addDepartment(){
		if(dm.addDepartment(department)){
			department.setMessage(ICTools.MESSAGE_OK);
		}else{
			department.setMessage(ICTools.MESSAGE_ERROR);
		}
		return SUCCESS;
	}
	
	public String getOneDepartment(){
		department=dm.getDepartmentOne(department.getDepartmentCode());
		lsb=sm.getStructAllList();
		return SUCCESS;
	}
	
	public String goAddDepartment(){
		department=new DepartmentBean();
		department.setDepartmentCode(ICTools.randId("D"));
		lsb=sm.getStructAllList();
		return SUCCESS;
	}
	
	@SuppressWarnings("unchecked")
	public String showDepartment(){
		department=dm.getPageDepartment(department);
		lhp=dm.getDepartmentList(department);
		return SUCCESS;
	}
	
	public String updateDepartment(){
		if(dm.updateDepartment(department)){
			department.setMessage(ICTools.MESSAGE_UPDATEOK);
		}else{
			department.setMessage(ICTools.MESSAGE_ERROR);
		}
		return SUCCESS;
	}
	
	public String deleteDepartment(){
		if(dm.deleteDepartment(department)){
			department.setMessage(ICTools.MESSAGE_DELETEOK);
		}else{
			department.setMessage(ICTools.MESSAGE_ERROR);
		}
		return SUCCESS;
	}
	
	
}
