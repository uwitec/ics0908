package com.action.baseset;

import java.sql.SQLException;
import java.util.List;

import com.dbserver.DBServer;
import com.mydomain.bean.EmployeeBean;
import com.mydomain.bean.PersonBean;
import com.opensymphony.xwork2.ActionSupport;
import com.tools.ICTools;

public class EmployeeAction extends ActionSupport{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String employeeCode; //员工编码
	private String personCode; //人员编码
	private String personName;
	private String jobCode; //岗位编码
	private String jobName;
	private String departmentCode;//部门编码
	private String departmentName;
	private String structCode;//机构编码
	private String structName;
	private String personEmail;
	private String personPhone;
	private String personSex;
	private String personPhoto;
	private String nextPath;
	private String rePath;
	private String message;
	private List<EmployeeBean> lhp;
	private EmployeeBean employee;
	private PersonBean person;

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
	 * @return the employee
	 */
	public EmployeeBean getEmployee() {
		return employee;
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
	 * @return the jobName
	 */
	public String getJobName() {
		return jobName;
	}
	/**
	 * @return the ldb
	 */
	public List<EmployeeBean> getLhp() {
		return lhp;
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
	 * @return the personCode
	 */
	public String getPersonCode() {
		return personCode;
	}
	/**
	 * @return the personName
	 */
	public String getPersonName() {
		return personName;
	}
	/**
	 * @param personCode the personCode to set
	 */
	public void setPersonCode(String personCode) {
		this.personCode = personCode;
	}
	/**
	 * @param personName the personName to set
	 */
	public void setPersonName(String personName) {
		this.personName = personName;
	}
	/**
	 * @return the person
	 */
	public PersonBean getPerson() {
		return person;
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
	 * @return the structName
	 */
	public String getStructName() {
		return structName;
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
	 * @param employee the employee to set
	 */
	public void setEmployee(EmployeeBean employee) {
		this.employee = employee;
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
	 * @param jobName the jobName to set
	 */
	public void setJobName(String jobName) {
		this.jobName = jobName;
	}
	/**
	 * @param ldb the ldb to set
	 */
	public void setLhp(List<EmployeeBean> lhp) {
		this.lhp = lhp;
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
	 * @param peopleCode the peopleCode to set
	 */

	/**
	 * @param person the person to set
	 */
	public void setPerson(PersonBean person) {
		this.person = person;
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
	 * @param structName the structName to set
	 */
	public void setStructName(String structName) {
		this.structName = structName;
	}
	/**
	 * @return the personEmail
	 */
	public String getPersonEmail() {
		return personEmail;
	}
	/**
	 * @return the personPhone
	 */
	public String getPersonPhone() {
		return personPhone;
	}
	/**
	 * @return the personPhoto
	 */
	public String getPersonPhoto() {
		return personPhoto;
	}
	/**
	 * @return the personSex
	 */
	public String getPersonSex() {
		return personSex;
	}
	/**
	 * @param personEmail the personEmail to set
	 */
	public void setPersonEmail(String personEmail) {
		this.personEmail = personEmail;
	}
	/**
	 * @param personPhone the personPhone to set
	 */
	public void setPersonPhone(String personPhone) {
		this.personPhone = personPhone;
	}
	/**
	 * @param personPhoto the personPhoto to set
	 */
	public void setPersonPhoto(String personPhoto) {
		this.personPhoto = personPhoto;
	}
	/**
	 * @param personSex the personSex to set
	 */
	public void setPersonSex(String personSex) {
		this.personSex = personSex;
	}
	@SuppressWarnings("unchecked")
	public String showEmployee(){
		try {
			lhp=(List<EmployeeBean>) DBServer.quider.queryForList(0, 10, EmployeeBean.class);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return SUCCESS;
	}
	
	@SuppressWarnings("unchecked")
	public String findEmployee(){
		employee=new EmployeeBean();
		employee.setPersonName("%"+personName+"%");
		try {
			lhp=(List<EmployeeBean>) DBServer.quider.queryForList("selectAllEmployeeFind",employee,0,10);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return SUCCESS;
	}
	
	public String goAddEmployee(){
		employeeCode=ICTools.randId("E");
		personCode=ICTools.randId("P");
		
		return SUCCESS;
	}
	
	public String addEmployee(){
		employee=new EmployeeBean();
		employee.setEmployeeCode(employeeCode);
		employee.setDepartmentCode(departmentCode);
		employee.setJobCode(jobCode);
		employee.setPersonCode(personCode);
		employee.setStructCode(structCode);
		person=new PersonBean();
		person.setPersonCode(personCode);
		person.setPersonName(personName);
		person.setPersonEmail(personEmail);
		person.setPersonPhone(personPhone);
		person.setPersonSex(personSex);
		person.setPersonPhoto(personPhoto);
		try {
			DBServer.quider.insertObject(person);
			DBServer.quider.insertObject(employee);
			message="";
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			message="请检查数据";
		}
		
		nextPath="/baseset/GoAddEmployee.action";
		rePath="/baseset/ShowEmployee.action";
		return SUCCESS;
	}

	public String getOneEmployee(){
	
		try {
			employee=(EmployeeBean) DBServer.quider.queryForObjectById(employeeCode, EmployeeBean.class);
			person=(PersonBean) DBServer.quider.queryForObjectById(employee.getPersonCode(),PersonBean.class);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return SUCCESS;
	}
	public String updateEmployee(){
		employee=new EmployeeBean();
		employee.setEmployeeCode(employeeCode);
		employee.setDepartmentCode(departmentCode);
		employee.setJobCode(jobCode);
		employee.setPersonCode(personCode);
		employee.setStructCode(structCode);
		person=new PersonBean();
		person.setPersonCode(personCode);
		person.setPersonName(personName);
		person.setPersonEmail(personEmail);
		person.setPersonPhone(personPhone);
		person.setPersonSex(personSex);
		person.setPersonPhoto(personPhoto);
		try {
			DBServer.quider.updateObject(person);
			DBServer.quider.updateObject(employee);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return SUCCESS;
	}
	
	public String deleteEmployee(){
		person=new PersonBean();
		person.setPersonCode(personCode);
		try {
			DBServer.quider.deleteObject(person);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return SUCCESS;
	}
	
}
