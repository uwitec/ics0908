package com.action.baseset;

import java.io.File;
import java.util.List;

import com.manage.baseset.EmployeeManage;
import com.manage.baseset.PersonManage;
import com.mydomain.bean.baseset.EmployeeBean;
import com.mydomain.bean.baseset.PersonBean;
import com.mydomain.bean.baseset.ReSourceBean;
import com.opensymphony.xwork2.ActionSupport;
import com.tools.ICTools;

public class EmployeeAction extends ActionSupport{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private String photoImgcontentType;
    private String photoImgFileName;
    private File photoImg;
    
	private ReSourceBean res;
	private List<EmployeeBean> lhp;
	private EmployeeBean employee;
	private PersonBean person;
	private EmployeeManage em=new EmployeeManage();
	private PersonManage pm=new PersonManage();

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
	
	/**
	 * @return the photoImg
	 */
	public File getPhotoImg() {
		return photoImg;
	}
	/**
	 * @return the photoImgcontentType
	 */
	public String getPhotoImgcontentType() {
		return photoImgcontentType;
	}
	/**
	 * @return the photoImgFileName
	 */
	public String getPhotoImgFileName() {
		return photoImgFileName;
	}
	/**
	 * @param photoImg the photoImg to set
	 */
	public void setPhotoImg(File photoImg) {
		this.photoImg = photoImg;
	}
	/**
	 * @param photoImgcontentType the photoImgcontentType to set
	 */
	public void setPhotoImgcontentType(String photoImgcontentType) {
		this.photoImgcontentType = photoImgcontentType;
	}
	/**
	 * @param photoImgFileName the photoImgFileName to set
	 */
	public void setPhotoImgFileName(String photoImgFileName) {
		this.photoImgFileName = photoImgFileName;
	}
	
	@SuppressWarnings("unchecked")
	public String showEmployee(){
		if(employee==null){
			employee=new EmployeeBean();
		}
		if(res==null){
			res=new ReSourceBean();
			ICTools.setBean(employee, "");
			res.setS_value("");
		}else{
			ICTools.setBean(employee,res.getS_value());
		}
		employee=em.getPageEmployee(employee);
		lhp=em.getEmployeeList(employee);
	
		return SUCCESS;
	}

	public String findEmployee(){
		this.showEmployee();
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
		if(photoImg!=null){
			person.setPersonPhoto(ICTools.sendImg(photoImgFileName, photoImg));
		}
		if(pm.addPerson(person)){
			if(em.addEmployee(employee)){
				res.setMessage(ICTools.MESSAGE_OK);
			}else{
				res.setMessage(ICTools.MESSAGE_ERROR);	
			}
		}else{
			res.setMessage(ICTools.MESSAGE_ERROR);	
		}
		return SUCCESS;
	}

	public String getOneEmployee(){
	
		employee=em.getEmployeeOne(employee.getEmployeeCode());
		person=pm.getPersonOne(employee.getPersonCode());
		return SUCCESS;
	}
	public String updateEmployee(){
		if(photoImg!=null){
			person.setPersonPhoto(ICTools.sendImg(photoImgFileName, photoImg));
		}
		
		if(pm.updatePerson(person)){
			if(em.updateEmployee(employee)){
				res.setMessage(ICTools.MESSAGE_UPDATEOK);
			}else{
				res.setMessage(ICTools.MESSAGE_ERROR);	
			}
		}else{
			res.setMessage(ICTools.MESSAGE_ERROR);	
		}
		return SUCCESS;
	}
}
