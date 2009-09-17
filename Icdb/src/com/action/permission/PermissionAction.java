package com.action.permission;

import java.util.List;

import com.manage.baseset.EmployeeManage;
import com.mydomain.bean.baseset.EmployeeBean;
import com.opensymphony.xwork2.ActionSupport;

public class PermissionAction extends ActionSupport {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private List<EmployeeBean> employeeList;
	private EmployeeBean employee;

	public String showEmployeeList() {
		EmployeeManage em = new EmployeeManage();
		if (null == employee) {
			employee = em.getPageEmployee(employee);
		}
		if (null == employeeList) {
			employeeList = em.getEmployeeList(employee);
		}
		return "SUCCESS";
	}

	public List<EmployeeBean> getEmployeeList() {
		return employeeList;
	}

	public void setEmployeeList(List<EmployeeBean> employeeList) {
		this.employeeList = employeeList;
	}

	public EmployeeBean getEmployee() {
		return employee;
	}

	public void setEmployee(EmployeeBean employee) {
		this.employee = employee;
	}

}
