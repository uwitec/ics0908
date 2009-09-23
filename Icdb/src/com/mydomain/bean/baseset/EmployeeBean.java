package com.mydomain.bean.baseset;

import com.mydomain.bean.BaseBean;

/*
 * 员工表
 * */
public class EmployeeBean extends BaseBean{

	private String employeeCode; //员工编码
	private String personCode; //人员编码
	private String personName;
	private String jobCode; //岗位编码
	private String jobName;
	private String departmentCode;//部门编码
	private String departmentName;
	private String structCode;//机构编码
	private String structName;
	private String userName;
	private String passWord;
	private String permissionCode;
	private int isAlowLogin;
	
	/**
	 * @return the isAlowLogin
	 */
	public int getIsAlowLogin() {
		return isAlowLogin;
	}
	/**
	 * @return the passWord
	 */
	public String getPassWord() {
		return passWord;
	}
	/**
	 * @return the permissionCode
	 */
	public String getPermissionCode() {
		return permissionCode;
	}
	/**
	 * @return the userName
	 */
	public String getUserName() {
		return userName;
	}
	/**
	 * @param isAlowLogin the isAlowLogin to set
	 */
	public void setIsAlowLogin(int isAlowLogin) {
		this.isAlowLogin = isAlowLogin;
	}
	/**
	 * @param passWord the passWord to set
	 */
	public void setPassWord(String passWord) {
		this.passWord = passWord;
	}
	/**
	 * @param permissionCode the permissionCode to set
	 */
	public void setPermissionCode(String permissionCode) {
		this.permissionCode = permissionCode;
	}
	/**
	 * @param userName the userName to set
	 */
	public void setUserName(String userName) {
		this.userName = userName;
	}
	/**
	 * @return the departmentCode
	 */
	public String getDepartmentCode() {
		return departmentCode;
	}
	/**
	 * @return the employeeCode
	 */
	public String getEmployeeCode() {
		return employeeCode;
	}
	/**
	 * @return the jobCode
	 */
	public String getJobCode() {
		return jobCode;
	}
	/**
	 * @return the peopleCode
	 */
	
	/**
	 * @return the structCode
	 */
	public String getStructCode() {
		return structCode;
	}
	/**
	 * @param departmentCode the departmentCode to set
	 */
	public void setDepartmentCode(String departmentCode) {
		this.departmentCode = departmentCode;
	}
	/**
	 * @param employeeCode the employeeCode to set
	 */
	public void setEmployeeCode(String employeeCode) {
		this.employeeCode = employeeCode;
	}
	/**
	 * @param jobCode the jobCode to set
	 */
	public void setJobCode(String jobCode) {
		this.jobCode = jobCode;
	}
	/**
	 * @param peopleCode the peopleCode to set
	 */
	
	/**
	 * @param structCode the structCode to set
	 */
	public void setStructCode(String structCode) {
		this.structCode = structCode;
	}
	/**
	 * @return the departmentName
	 */
	public String getDepartmentName() {
		return departmentName;
	}
	/**
	 * @return the jobName
	 */
	public String getJobName() {
		return jobName;
	}

	/**
	 * @return the structName
	 */
	public String getStructName() {
		return structName;
	}
	/**
	 * @param departmentName the departmentName to set
	 */
	public void setDepartmentName(String departmentName) {
		this.departmentName = departmentName;
	}
	/**
	 * @param jobName the jobName to set
	 */
	public void setJobName(String jobName) {
		this.jobName = jobName;
	}

	/**
	 * @return the peronName
	 */
	public String getPersonName() {
		return personName;
	}
	/**
	 * @return the personCode
	 */
	public String getPersonCode() {
		return personCode;
	}
	/**
	 * @param peronName the peronName to set
	 */
	public void setPersonName(String personName) {
		this.personName = personName;
	}
	/**
	 * @param personCode the personCode to set
	 */
	public void setPersonCode(String personCode) {
		this.personCode = personCode;
	}
	/**
	 * @param structName the structName to set
	 */
	public void setStructName(String structName) {
		this.structName = structName;
	}
}
