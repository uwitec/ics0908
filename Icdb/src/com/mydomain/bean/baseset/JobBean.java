package com.mydomain.bean.baseset;

import com.mydomain.bean.BaseBean;

/*
 * 岗位BEAN
 * */
public class JobBean extends BaseBean{

	private String jobCode; //岗位编码
	private String jobName; //岗位名称
	private String departmentCode;  //部门编码
	private String departmentName;
	private String structCode;
	private String structName;
	/**
	 * @return the structCode
	 */
	public String getStructCode() {
		return structCode;
	}
	/**
	 * @return the structName
	 */
	public String getStructName() {
		return structName;
	}
	/**
	 * @param structCode the structCode to set
	 */
	public void setStructCode(String structCode) {
		this.structCode = structCode;
	}
	/**
	 * @param structName the structName to set
	 */
	public void setStructName(String structName) {
		this.structName = structName;
	}
	/**
	 * @return the departmentName
	 */
	public String getDepartmentName() {
		return departmentName;
	}
	/**
	 * @param departmentName the departmentName to set
	 */
	public void setDepartmentName(String departmentName) {
		this.departmentName = departmentName;
	}
	/**
	 * @return the departmentCode
	 */
	public String getDepartmentCode() {
		return departmentCode;
	}
	/**
	 * @return the jobCode
	 */
	public String getJobCode() {
		return jobCode;
	}
	/**
	 * @return the jonName
	 */
	public String getJobName() {
		return jobName;
	}
	/**
	 * @param departmentCode the departmentCode to set
	 */
	public void setDepartmentCode(String departmentCode) {
		this.departmentCode = departmentCode;
	}
	/**
	 * @param jobCode the jobCode to set
	 */
	public void setJobCode(String jobCode) {
		this.jobCode = jobCode;
	}
	/**
	 * @param jonName the jonName to set
	 */
	public void setJobName(String jobName) {
		this.jobName = jobName;
	}
}
