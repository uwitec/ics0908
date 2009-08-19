package com.action.baseset;

import java.sql.SQLException;
import java.util.List;

import com.dbserver.DBServer;
import com.mydomain.bean.EmployeeBean;
import com.mydomain.bean.PersonBean;
import com.mydomain.bean.ReSourceBean;
import com.opensymphony.xwork2.ActionSupport;
import com.tools.ICTools;

public class EmployeeAction extends ActionSupport{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private ReSourceBean res;
	private List<EmployeeBean> lhp;
	private EmployeeBean employee;
	private PersonBean person;

	/**
	 * @return the employee
	 */
	public EmployeeBean getEmployee() {
		return employee;
	}
	/**
	 * @return the ldb
	 */
	public List<EmployeeBean> getLhp() {
		return lhp;
	}
	
	/**
	 * @return the person
	 */
	public PersonBean getPerson() {
		return person;
	}
	
	
	/**
	 * @param employee the employee to set
	 */
	public void setEmployee(EmployeeBean employee) {
		this.employee = employee;
	}
	
	/**
	 * @param ldb the ldb to set
	 */
	public void setLhp(List<EmployeeBean> lhp) {
		this.lhp = lhp;
	}
	/**
	 * @param person the person to set
	 */
	public void setPerson(PersonBean person) {
		this.person = person;
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
	public String selectEmployeeDef(){
		ICTools.setBean(employee, ICTools.likeString(res.getS_value()));
		try {
			lhp=(List<EmployeeBean>) DBServer.quider.queryForList("selectEmployeeDef",employee,0,10);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return SUCCESS;
	}

	public String findEmployee(){
		this.selectEmployeeDef();
		return SUCCESS;
	}
	
	public String goAddEmployee(){
		employee=new EmployeeBean();
		employee.setEmployeeCode(ICTools.randId("E"));
		employee.setPersonCode(ICTools.randId("P"));
		return SUCCESS;
	}
	
	public String addEmployee(){
		res=new ReSourceBean();
		try {
			employee.setPersonCode(person.getPersonCode());
			DBServer.quider.insertObject(person);
			DBServer.quider.insertObject(employee);
			res.setMessage(ICTools.MESSAGE_OK);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			res.setMessage(ICTools.MESSAGE_ERROR);	
		}
		res.setNextPath("/baseset/GoAddEmployee.action");
		res.setRePath("/baseset/ShowEmployee.action");
		return SUCCESS;
	}

	public String getOneEmployee(){
	
		try {
			employee=(EmployeeBean) DBServer.quider.queryForObjectById(employee.getEmployeeCode(), EmployeeBean.class);
			person=(PersonBean) DBServer.quider.queryForObjectById(employee.getPersonCode(),PersonBean.class);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return SUCCESS;
	}
	public String updateEmployee(){
		try {
			employee.setPersonCode(person.getPersonCode());
			DBServer.quider.updateObject(person);
			DBServer.quider.updateObject(employee);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return SUCCESS;
	}
	
	/*
	public String deleteEmployee(){
		try {
			DBServer.quider.deleteObject(person);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return SUCCESS;
	}
	*/
}
