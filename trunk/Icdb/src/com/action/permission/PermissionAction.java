package com.action.permission;

import java.sql.SQLException;
import java.util.Arrays;
import java.util.List;

import com.dbserver.DBServer;
import com.manage.baseset.EmployeeManage;
import com.manage.baseset.JobManage;
import com.manage.permission.MenuReader;
import com.mydomain.bean.baseset.EmployeeBean;
import com.mydomain.bean.baseset.JobBean;
import com.mydomain.bean.permission.Menu;
import com.opensymphony.xwork2.ActionContext;
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
	private Integer[] permission;

	public String getTopMenu() {
		userMenu = null;
		Object empObj = ActionContext.getContext().getSession().get("user");
		if (empObj instanceof EmployeeBean) {
			EmployeeBean emp = (EmployeeBean) empObj;
			JobBean aJob = new JobManage().getJobOne(emp.getJobCode());
			if (null != aJob) {
				String filter = aJob.getPermissionCode();
				userMenu = MenuReader.readMenu("userMenu", emp
						.getPermissionCode(), filter);
			}
		}

		return "SUCCESS";
	}

	public String updatePermission() {
		if (null != permission) {
			Arrays.sort(permission);
			boolean isFirst = true;
			char[] cs = {};
			for (int i = permission.length - 1; i >= 0; i--) {
				if (isFirst) {
					cs = new char[permission[i] + 1];
					Arrays.fill(cs, '0');
					isFirst = false;
				}
				cs[permission[i]] = '1';
			}
			String permissionCode = new String(cs);
			if ("job".equals(role) && null != job) {
				job.setPermissionCode(permissionCode);
				try {
					DBServer.quider.updateObject("updateJobPermission", job);
				} catch (SQLException e) {
					e.printStackTrace();
				}
			} else if ("employee".equals(role) && null != employee) {
				employee.setPermissionCode(permissionCode);
				try {
					DBServer.quider.updateObject("updateEmployeePermission",
							employee);
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
		return "SUCCESS";
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
		userMenu = MenuReader.readMenu("userMenu");
		String ps = "";
		if ("employee".equals(role) && null != employee) {
			employee = new EmployeeManage().getEmployeeOne(employee
					.getEmployeeCode());
			JobBean aJob = new JobManage().getJobOne(employee.getJobCode());
			if (null != aJob) {
				String filter = aJob.getPermissionCode();
				userMenu.setFilter(filter);
			}
			ps = employee.getPermissionCode();
		} else if ("job".equals(role) && null != job) {
			job = new JobManage().getJobOne(job.getJobCode());
			ps = job.getPermissionCode();
			userMenu.setFilter("");
		}
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

	public Integer[] getPermission() {
		return permission;
	}

	public void setPermission(Integer[] permission) {
		this.permission = permission;
	}

	public String getRole() {
		return role;
	}

	public void setRole(String role) {
		this.role = role;
	}
}
