package com.manage.baseset;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.dbserver.DBServer;
import com.mydomain.bean.baseset.EmployeeBean;
import com.tools.ICTools;

public class EmployeeManage {

	@SuppressWarnings("unchecked")
	public List<EmployeeBean> getEmployeeList(EmployeeBean employee){
		try {
			return (List<EmployeeBean>) DBServer.quider.queryForList("selectEmployeeDef",employee);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			com.dbserver.DBServer.logger.exception(e);
			return new ArrayList<EmployeeBean>();
		}
		
	}
	
	public EmployeeBean login(String userName,String passWord){
		EmployeeBean temp_embean=new EmployeeBean();
		temp_embean.setUserName(userName);
		temp_embean.setPassWord(passWord);
		try {
			return (EmployeeBean) DBServer.quider.queryForObject("loginEmp", temp_embean);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			com.dbserver.DBServer.logger.exception(e);
			return null;
		}
	}
	
	public boolean addEmployee(EmployeeBean employee){
	
		try {
			DBServer.quider.insertObject(employee);
			return true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			com.dbserver.DBServer.logger.exception(e);
			return false;
		}
	}
	
	public boolean updateEmployee(EmployeeBean employee){
		try {
			DBServer.quider.updateObject(employee);
			return true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			com.dbserver.DBServer.logger.exception(e);
			return false;
		}
	}
	
	public EmployeeBean getEmployeeOne(String Id){
		try {
			return (EmployeeBean) DBServer.quider.queryForObjectById(Id, EmployeeBean.class);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			com.dbserver.DBServer.logger.exception(e);
			return new EmployeeBean();
		}
		
	}
	
	public boolean changePassword(EmployeeBean emp){
		try {
			DBServer.quider.updateObject("updateUserPassword",emp);
			return true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			com.dbserver.DBServer.logger.exception(e);
			return false;
		}
	}
	
	public EmployeeBean getPageEmployee(EmployeeBean employee){
		PageManage pm=new PageManage();
		if(employee==null){
			employee=new EmployeeBean();
			ICTools.setBean(employee, "");
			employee.setS_value("");
		}else{
			ICTools.setBean(employee,employee.getS_value());
		}
		return (EmployeeBean)pm.setPage(employee, "selectEmployeeCount");
	}
}
