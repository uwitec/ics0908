package com.action.baseset;

import java.sql.SQLException;
import java.util.List;

import com.dbserver.DBServer;
import com.mydomain.bean.DepartmentBean;
import com.mydomain.bean.StructBean;
import com.opensymphony.xwork2.ActionSupport;
import com.tools.DBControl;
import com.tools.ICTools;

public class DepartmentAction extends ActionSupport{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String departmentCode;
	private String departmentName;
	private String structCode;
	private String nextPath;
	private String rePath;
	private String message;
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
	 * @return the departmentCode
	 */
	public String getDepartmentCode() {
		return departmentCode;
	}
	/**
	 * @return the departmentName
	 */
	public String getDepartmentName() {
		return departmentName;
	}
	/**
	 * @return the ldb
	 */

	/**
	 * @return the lsb
	 */
	public List<StructBean> getLsb() {
		return lsb;
	}
	/**
	 * @return the message
	 */
	public String getMessage() {
		return message;
	}
	/**
	 * @return the nextPath
	 */
	public String getNextPath() {
		return nextPath;
	}
	/**
	 * @return the rePath
	 */
	public String getRePath() {
		return rePath;
	}
	/**
	 * @return the structCode
	 */
	public String getStructCode() {
		return structCode;
	}
	/**
	 * @param department the department to set
	 */
	public void setDepartment(DepartmentBean department) {
		this.department = department;
	}
	/**
	 * @param departmentCode the departmentCode to set
	 */
	public void setDepartmentCode(String departmentCode) {
		this.departmentCode = departmentCode;
	}
	/**
	 * @param departmentName the departmentName to set
	 */
	public void setDepartmentName(String departmentName) {
		this.departmentName = departmentName;
	}
	/**
	 * @param ldb the ldb to set
	 */
	
	/**
	 * @param lsb the lsb to set
	 */
	public void setLsb(List<StructBean> lsb) {
		this.lsb = lsb;
	}
	/**
	 * @param message the message to set
	 */
	public void setMessage(String message) {
		this.message = message;
	}
	/**
	 * @param nextPath the nextPath to set
	 */
	public void setNextPath(String nextPath) {
		this.nextPath = nextPath;
	}
	/**
	 * @param rePath the rePath to set
	 */
	public void setRePath(String rePath) {
		this.rePath = rePath;
	}
	/**
	 * @param structCode the structCode to set
	 */
	public void setStructCode(String structCode) {
		this.structCode = structCode;
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
		department=new DepartmentBean();
		department.setDepartmentCode(departmentCode);
		department.setDepartmentName(departmentName);
		department.setStructCode(structCode);
		DBControl db=new DBControl();
		if(db.insert(department)){
			message="";
		}else{
			message="有已经存在为"+departmentCode+"的编号，请重新输入";
		}
		nextPath="/baseset/GoAddDepartment.action";
		rePath="/baseset/ShowDepartment.action";
		return SUCCESS;
	}
	
	@SuppressWarnings("unchecked")
	public String getOneDepartment(){
		try {
			department=(DepartmentBean) DBServer.quider.queryForObjectById(departmentCode, DepartmentBean.class);
			lsb=(List<StructBean>) DBServer.quider.queryForList(StructBean.class);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return SUCCESS;
	}
	
	@SuppressWarnings("unchecked")
	public String goAddDepartment(){
		try {
			lsb=(List<StructBean>) DBServer.quider.queryForList(StructBean.class);
			departmentCode=ICTools.randId("D");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return SUCCESS;
	}
	
	@SuppressWarnings("unchecked")
	public String showDepartment(){
		try {
			lhp=(List<DepartmentBean>) DBServer.quider.queryForList(DepartmentBean.class);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return SUCCESS;
	}
	
	public String updateDepartment(){
		department=new DepartmentBean();
		department.setDepartmentCode(departmentCode);
		department.setDepartmentName(departmentName);
		department.setStructCode(structCode);
		try {
			DBServer.quider.updateObject(department);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return SUCCESS;
	}
	
	public String deleteDepartment(){
		department=new DepartmentBean();
		department.setDepartmentCode(departmentCode);
		try {
			DBServer.quider.deleteObject(department);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return SUCCESS;
	}
	
}
