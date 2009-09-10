package com.manage.baseset;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.dbserver.DBServer;
import com.mydomain.bean.baseset.DepartmentBean;
import com.tools.ICTools;

public class DepartmentManage {

	
	@SuppressWarnings("unchecked")
	public List<DepartmentBean> getDepartmentList(DepartmentBean department){
		try {
			return (List<DepartmentBean>) DBServer.quider.queryForList("selectDepartmentDef",department);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			com.dbserver.DBServer.logger.exception(e);
			return new ArrayList<DepartmentBean>();
		}
	}
	
	@SuppressWarnings("unchecked")
	public List<DepartmentBean> getDepartmentAllList(){
		try {
			return (List<DepartmentBean>) DBServer.quider.queryForList(DepartmentBean.class);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			com.dbserver.DBServer.logger.exception(e);
			return new ArrayList<DepartmentBean>();
		}
	}
	
	public boolean addDepartment(DepartmentBean department){
		try {
			DBServer.quider.insertObject(department);
			return true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			com.dbserver.DBServer.logger.exception(e);
			return false;
		}
	}
	
	public boolean updateDepartment(DepartmentBean department){
		try {
			DBServer.quider.updateObject(department);
			return true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			com.dbserver.DBServer.logger.exception(e);
			return false;
		}
	}
	
	public DepartmentBean getDepartmentOne(String Id){
		try {
			return (DepartmentBean) DBServer.quider.queryForObjectById(Id, DepartmentBean.class);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			com.dbserver.DBServer.logger.exception(e);
			return new DepartmentBean();
		}
	}
	
	public boolean deleteDepartment(DepartmentBean department){
		try {
			DBServer.quider.deleteObject(department);
			return true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			com.dbserver.DBServer.logger.exception(e);
			return false;
		}
	}
	
	public DepartmentBean getPageDepartment(DepartmentBean department){
		PageManage pm=new PageManage();
		if(department==null){
			department=new DepartmentBean();
			ICTools.setBean(department, "");
			department.setS_value("");
		}else{
			ICTools.setBean(department,department.getS_value());
		}
		return  (DepartmentBean) pm.setPage(department,"selectDepartmentCount");
	}
}
