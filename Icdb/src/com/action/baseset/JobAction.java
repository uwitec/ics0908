package com.action.baseset;

import java.sql.SQLException;
import java.util.List;

import com.dbserver.DBServer;
import com.mydomain.bean.baseset.DepartmentBean;
import com.mydomain.bean.baseset.JobBean;
import com.mydomain.bean.baseset.ReSourceBean;
import com.opensymphony.xwork2.ActionSupport;
import com.tools.ICTools;

public class JobAction extends ActionSupport{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private ReSourceBean res;
	private List<DepartmentBean> ldb;
	private JobBean job;
	private List<JobBean> lhp;

	/**
	 * @return the job
	 */
	public JobBean getJob() {
		return job;
	}
	/**
	 * @return the ldb
	 */
	public List<DepartmentBean> getLdb() {
		return ldb;
	}
	/**
	 * @return the lhp
	 */
	public List<JobBean> getLhp() {
		return lhp;
	}
	/**
	 * @param job the job to set
	 */
	public void setJob(JobBean job) {
		this.job = job;
	}
	/**
	 * @param ldb the ldb to set
	 */
	public void setLdb(List<DepartmentBean> ldb) {
		this.ldb = ldb;
	}
	/**
	 * @param lhp the lhp to set
	 */
	public void setLhp(List<JobBean> lhp) {
		this.lhp = lhp;
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
	public String getOneJob(){
		try {
			job=(JobBean) DBServer.quider.queryForObjectById(job.getJobCode(), JobBean.class);
			ldb=(List<DepartmentBean>) DBServer.quider.queryForList(DepartmentBean.class);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return SUCCESS;
	}
	@SuppressWarnings("unchecked")
	public String goAddJob(){
		job=new JobBean();
		try {
			ldb=(List<DepartmentBean>) DBServer.quider.queryForList(DepartmentBean.class);
			job.setJobCode(ICTools.randId("J"));
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return SUCCESS;
	}
	public String addJob(){
		res=new ReSourceBean();
		try {
			DBServer.quider.insertObject(job);
			res.setMessage(ICTools.MESSAGE_OK);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			res.setMessage(ICTools.MESSAGE_ERROR);
		}
		res.setNextPath("/baseset/GoAddJob.action");
		res.setRePath("/baseset/ShowJob.action");
		
		return SUCCESS;
	}
	@SuppressWarnings("unchecked")
	public String showJob(){
		try {
			lhp=(List<JobBean>) DBServer.quider.queryForList(JobBean.class);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return SUCCESS;
	}
	public String updateJob(){
		try {
			DBServer.quider.updateObject(job);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return SUCCESS;
	}
	
	@SuppressWarnings("unchecked")
	public String selectJobDef(){
		ICTools.setBean(job, ICTools.likeString(res.getS_value()));
		try {
			lhp=(List<JobBean>) DBServer.quider.queryForList("selectJobDef", job, 0, 10);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return SUCCESS;
	}
	
	
	public String findJob(){
		this.selectJobDef();
		return SUCCESS;
	}
}
