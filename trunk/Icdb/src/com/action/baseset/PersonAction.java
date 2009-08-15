package com.action.baseset;

import java.sql.SQLException;
import java.util.List;

import com.dbserver.DBServer;
import com.mydomain.bean.PersonBean;
import com.opensymphony.xwork2.ActionSupport;
import com.tools.DBControl;
import com.tools.ICTools;

public class PersonAction extends ActionSupport{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private String personCode; //人员编码
	private String personName; //姓名
	private String personPhone; //电话
	private String personEmail; //电邮
	private String personSex;  //性别
	private String personPhoto;  //像片
	
	private String nextPath;
	private String rePath;
	private String message;
	private PersonBean person;
	private List<PersonBean> lhp;
	
	
	public String addPerson(){
		person=new PersonBean();
		person.setPersonCode(personCode);
		person.setPersonName(personName);
		person.setPersonPhone(personPhone);
		person.setPersonEmail(personEmail);
		person.setPersonSex(personSex);
		person.setPersonPhoto(personPhoto);
		DBControl db=new DBControl();
		if(db.insert(person)){
			message="";
		}else{
			message="有已经存在为"+personCode+"的编号，请重新输入";
		}
		nextPath="/baseset/GoAddPerson.action";
		rePath="/baseset/ShowPerson.action";
		return SUCCESS;
	}
	
	public String goAddPerson(){
		personCode=ICTools.randId("P");
		return SUCCESS;
	}
	public String getOnePerson(){
		
		try {
			person=(PersonBean) DBServer.quider.queryForObjectById(personCode, PersonBean.class);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return SUCCESS;
	}
	@SuppressWarnings("unchecked")
	public String showPerson(){
		try {
			lhp=(List<PersonBean>) DBServer.quider.queryForList(PersonBean.class);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return SUCCESS;
	}
	
	@SuppressWarnings("unchecked")
	public String findPerson(){
		person=new PersonBean();
		person.setPersonName("%"+personName+"%");
		try {
			lhp=(List<PersonBean>) DBServer.quider.queryForList("selectAllfind",person,0,10);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return SUCCESS;
	}
	

	public String updatePerson(){
		person=new PersonBean();
		person.setPersonCode(personCode);
		person.setPersonEmail(personEmail);
		person.setPersonName(personName);
		person.setPersonPhone(personPhone);
		person.setPersonPhoto(personPhoto);
		person.setPersonSex(personSex);
		try {
			DBServer.quider.updateObject(person);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return SUCCESS;
	}
	/**
	 * @return the lhp
	 */
	
	

	public List<PersonBean> getLhp() {
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
	 * @return the person
	 */
	public PersonBean getPerson() {
		return person;
	}

	/**
	 * @return the personCode
	 */
	public String getPersonCode() {
		return personCode;
	}

	/**
	 * @return the personEmail
	 */
	public String getPersonEmail() {
		return personEmail;
	}

	/**
	 * @return the personName
	 */
	public String getPersonName() {
		return personName;
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
	 * @return the rePath
	 */
	public String getRePath() {
		return rePath;
	}

	/**
	 * @param lhp the lhp to set
	 */
	public void setLhp(List<PersonBean> lhp) {
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
	 * @param person the person to set
	 */
	public void setPerson(PersonBean person) {
		this.person = person;
	}

	/**
	 * @param personCode the personCode to set
	 */
	public void setPersonCode(String personCode) {
		this.personCode = personCode;
	}

	/**
	 * @param personEmail the personEmail to set
	 */
	public void setPersonEmail(String personEmail) {
		this.personEmail = personEmail;
	}

	/**
	 * @param personName the personName to set
	 */
	public void setPersonName(String personName) {
		this.personName = personName;
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

	/**
	 * @param rePath the rePath to set
	 */
	public void setRePath(String rePath) {
		this.rePath = rePath;
	}

}
