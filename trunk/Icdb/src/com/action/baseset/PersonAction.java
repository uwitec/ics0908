package com.action.baseset;

import java.io.File;
import java.sql.SQLException;
import java.util.List;

import com.dbserver.DBServer;
import com.mydomain.bean.baseset.BaseBean;
import com.mydomain.bean.baseset.PersonBean;
import com.mydomain.bean.baseset.ReSourceBean;
import com.opensymphony.xwork2.ActionSupport;
import com.tools.ICTools;

public class PersonAction extends ActionSupport{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
    
	private String photoImgcontentType;
    private String photoImgFileName;
    private File photoImg;
  
    
	private ReSourceBean res;
	private PersonBean person;
	private List<PersonBean> lhp;

	/**
	 * @return the lhp
	 */	
	public List<PersonBean> getLhp() {
		return lhp;
	}
	/**
	 * @return the person
	 */
	public PersonBean getPerson() {
		return person;
	}
	/**
	 * @param lhp the lhp to set
	 */
	public void setLhp(List<PersonBean> lhp) {
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

	
	public String addPerson(){
		res=new ReSourceBean();
		if(photoImg!=null){
			person.setPersonPhoto(ICTools.sendImg(photoImgFileName, photoImg));
		}
			try {
			DBServer.quider.insertObject(person);
			res.setMessage(ICTools.MESSAGE_OK);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			res.setMessage(ICTools.MESSAGE_ERROR);
		}
		res.setNextPath("/baseset/GoAddPerson.action");
		res.setRePath("/baseset/ShowPerson.action");
		return SUCCESS;
	}
	
	public String goAddPerson(){
		person=new PersonBean();
		person.setPersonCode(ICTools.randId("P"));
		return SUCCESS;
	}
	public String getOnePerson(){
		
		try {
			person=(PersonBean) DBServer.quider.queryForObjectById(person.getPersonCode(), PersonBean.class);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return SUCCESS;
	}
	@SuppressWarnings("unchecked")
	public String showPerson(){
		try {
			if(person==null){
				person=new PersonBean();
			}
			person=(PersonBean) DBServer.quider.queryForObject("selectAllPersonBeanPag", person);
			person.setCountSize(ICTools.mathCeil(person.getCountValue(),BaseBean.countNumber));
			System.out.println(person.getCountSize()+":"+person.getStartValue()+":"+person.getCountValue());
			lhp=(List<PersonBean>) DBServer.quider.queryForList("selectAllPersonBean", person);
			//		lhp=(List<PersonBean>) DBServer.quider.queryForList(PersonBean.class);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return SUCCESS;
	}
	
	
	public String findPerson(){
		this.selectPersonDef();
		return SUCCESS;
	}
	
	@SuppressWarnings("unchecked")
	public String selectPersonDef(){
		ICTools.setBean(person, ICTools.likeString(res.getS_value()));
		try {
			lhp=(List<PersonBean>) DBServer.quider.queryForList("selectPersonDef",person,0,10);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return SUCCESS;
	}

	public String updatePerson(){
		if(photoImg!=null){
			person.setPersonPhoto(ICTools.sendImg(photoImgFileName, photoImg));
		}	
		try {
			DBServer.quider.updateObject(person);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return SUCCESS;
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
	/**
	 * @return the photoImg
	 */
	public File getPhotoImg() {
		return photoImg;
	}
	/**
	 * @param photoImg the photoImg to set
	 */
	public void setPhotoImg(File photoImg) {
		this.photoImg = photoImg;
	}

	
}
