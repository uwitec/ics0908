package com.action.baseset;

import java.sql.SQLException;
import java.util.List;

import com.dbserver.DBServer;
import com.manage.baseset.PageManage;
import com.mydomain.bean.baseset.DepartmentBean;
import com.mydomain.bean.baseset.ReSourceBean;
import com.mydomain.bean.baseset.StructBean;
import com.opensymphony.xwork2.ActionSupport;
import com.tools.ICTools;

public class DepartmentAction extends ActionSupport{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private ReSourceBean res;
	private List<StructBean> lsb;
	private DepartmentBean department;
	public List<DepartmentBean> lhp;
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
		res=new ReSourceBean();
		try {
			DBServer.quider.insertObject(department);
			res.setMessage(ICTools.MESSAGE_OK);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			res.setMessage(ICTools.MESSAGE_ERROR);
		}
		res.setNextPath("/baseset/GoAddDepartment.action");
		res.setRePath("/baseset/ShowDepartment.action");
		return SUCCESS;
	}
	
	@SuppressWarnings("unchecked")
	public String getOneDepartment(){
		try {
			department=(DepartmentBean) DBServer.quider.queryForObjectById(department.getDepartmentCode(), DepartmentBean.class);
			lsb=(List<StructBean>) DBServer.quider.queryForList(StructBean.class);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return SUCCESS;
	}
	
	@SuppressWarnings("unchecked")
	public String goAddDepartment(){
		department=new DepartmentBean();
		try {
			lsb=(List<StructBean>) DBServer.quider.queryForList(StructBean.class);
			department.setDepartmentCode(ICTools.randId("D"));
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return SUCCESS;
	}
	
	/*
	@SuppressWarnings("unchecked")
	public String selectDepartmentDef(){
		ICTools.setBean(department, ICTools.likeString(res.getS_value()));
		try {
			lhp=(List<DepartmentBean>) DBServer.quider.queryForList("selectDepartmentDef", department, 0, 10);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return SUCCESS;
	}
	*/
	@SuppressWarnings("unchecked")
	public String showDepartment(){
		try {
			PageManage pm=new PageManage();
			if(department==null){
				department=new DepartmentBean();
			}
			if(res==null){
				res=new ReSourceBean();
				ICTools.setBean(department, "");
				res.setS_value("");
			}else{
				ICTools.setBean(department,res.getS_value());
			}
			department=(DepartmentBean) pm.setPage(department, "selectDepartmentCount");
			lhp=(List<DepartmentBean>) DBServer.quider.queryForList("selectDepartmentDef",department);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return SUCCESS;
	}
	
	public String updateDepartment(){
		try {
			DBServer.quider.updateObject(department);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return SUCCESS;
	}
	
	public String deleteDepartment(){
		try {
			DBServer.quider.deleteObject(department);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return SUCCESS;
	}
	
	
}
