package com.action.permission;

import java.util.List;

import com.manage.baseset.EmployeeManage;
import com.manage.baseset.JobManage;
import com.manage.permission.MenuReader;
import com.mydomain.bean.baseset.EmployeeBean;
import com.mydomain.bean.baseset.JobBean;
import com.mydomain.bean.permission.Menu;
import com.opensymphony.xwork2.ActionSupport;

public class PermissionAction extends ActionSupport {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private List<EmployeeBean> employeeList;
	private EmployeeBean employee;
	private JobBean job;
	private List<JobBean> jobList;

	private String role;
	private Menu userMenu;
	private Menu sysMenu;

	public String getRole() {
		return role;
	}

	public void setRole(String role) {
		this.role = role;
	}

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

	public String showJobList() {
		JobManage jm = new JobManage();
		if (null == job) {
			job = jm.getPageJob(job);
		}
		if (null == employeeList) {
			jobList = jm.getJobList(job);
		}
		return "SUCCESS";
	}

	public String showPermissioinList() {
		String ps = "";
		if ("employee".equals(role) && null != employee) {
			ps = employee.getPermissionCode();
		} else if ("job".equals(role) && null != job) {
			ps = job.getPermissionCode();
		}
		System.out.println("ps: " + ps + " job: " + role);
		userMenu = MenuReader.readMenu("userMenu");
		userMenu.setItemPermission(ps);
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

	public JobBean getJob() {
		return job;
	}

	public void setJob(JobBean job) {
		this.job = job;
	}

	public List<JobBean> getJobList() {
		return jobList;
	}

	public void setJobList(List<JobBean> jobList) {
		this.jobList = jobList;
	}

	public Menu getUserMenu() {
		return userMenu;
	}

	public void setUserMenu(Menu userMenu) {
		this.userMenu = userMenu;
	}

	public Menu getSysMenu() {
		return sysMenu;
	}

	public void setSysMenu(Menu sysMenu) {
		this.sysMenu = sysMenu;
	}

}
