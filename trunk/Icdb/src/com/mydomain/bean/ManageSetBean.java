package com.mydomain.bean;

public class ManageSetBean {

	private String m_MaterNum;
	private String m_MaterOutNum;
	private String m_MaterInNum;
	private String m_MaterABC;
	private String m_MaterErverTime;
	
	
	
	public ManageSetBean(){
		this.m_MaterABC="";
		this.m_MaterErverTime="";
		this.m_MaterInNum="";
		this.m_MaterNum="";
		this.m_MaterOutNum="";
	}
	/**
	 * @return the m_MaterABC
	 */
	public String getM_MaterABC() {
		return m_MaterABC;
	}
	/**
	 * @return the m_MaterErverTime
	 */
	public String getM_MaterErverTime() {
		return m_MaterErverTime;
	}
	/**
	 * @return the m_MaterInNum
	 */
	public String getM_MaterInNum() {
		return m_MaterInNum;
	}
	/**
	 * @return the m_MaterNum
	 */
	public String getM_MaterNum() {
		return m_MaterNum;
	}
	/**
	 * @return the m_MaterOutNum
	 */
	public String getM_MaterOutNum() {
		return m_MaterOutNum;
	}
	/**
	 * @param materABC the m_MaterABC to set
	 */
	public void setM_MaterABC(String materABC) {
		m_MaterABC = materABC;
	}
	/**
	 * @param materErverTime the m_MaterErverTime to set
	 */
	public void setM_MaterErverTime(String materErverTime) {
		m_MaterErverTime = materErverTime;
	}
	/**
	 * @param materInNum the m_MaterInNum to set
	 */
	public void setM_MaterInNum(String materInNum) {
		m_MaterInNum = materInNum;
	}
	/**
	 * @param materNum the m_MaterNum to set
	 */
	public void setM_MaterNum(String materNum) {
		m_MaterNum = materNum;
	}
	/**
	 * @param materOutNum the m_MaterOutNum to set
	 */
	public void setM_MaterOutNum(String materOutNum) {
		m_MaterOutNum = materOutNum;
	}
	
}
