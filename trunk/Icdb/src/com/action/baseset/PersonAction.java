package com.action.baseset;

import java.io.File;
import java.util.List;

import com.manage.baseset.PersonManage;
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
	private PersonManage pm=new PersonManage();

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
		if(pm.addPerson(person)){
			res.setMessage(ICTools.MESSAGE_OK);
		}else{
			res.setMessage(ICTools.MESSAGE_ERROR);
		}
		return SUCCESS;
	}
	
	public String goAddPerson(){
		person=new PersonBean();
		person.setPersonCode(ICTools.randId("P"));
		return SUCCESS;
	}
	
	public String getOnePerson(){
		person=pm.getPersonOne(person.getPersonCode());
		return SUCCESS;
	}
	
	@SuppressWarnings("unchecked")
	public String showPerson(){
		if(person==null){
			person=new PersonBean();
		}
		if(res==null){
			res=new ReSourceBean();
			ICTools.setBean(person, "");
			res.setS_value("");
		}else{
			ICTools.setBean(person,res.getS_value());
		}
		person=pm.getPagePerson(person);
		lhp=pm.getPersonList(person);
		return SUCCESS;
	}
	
	
	public String findPerson(){
		this.showPerson();
		return SUCCESS;
	}
	
	public String updatePerson(){
		if(photoImg!=null){
			person.setPersonPhoto(ICTools.sendImg(photoImgFileName, photoImg));
		}	
		if(pm.updatePerson(person)){
			res.setMessage(ICTools.MESSAGE_UPDATEOK);
		}else{
			res.setMessage(ICTools.MESSAGE_ERROR);
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
