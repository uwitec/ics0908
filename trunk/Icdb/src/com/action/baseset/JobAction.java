package com.action.baseset;

import java.util.List;

import com.manage.baseset.DepartmentManage;
import com.manage.baseset.JobManage;
import com.mydomain.bean.baseset.DepartmentBean;
import com.mydomain.bean.baseset.JobBean;
import com.opensymphony.xwork2.ActionSupport;
import com.tools.ICTools;

public class JobAction extends ActionSupport{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private List<DepartmentBean> ldb;
	private JobBean job;
	private List<JobBean> lhp;

	private JobManage jm=new JobManage();
	private DepartmentManage dm=new DepartmentManage();
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

	
	@SuppressWarnings("unchecked")
	public String getOneJob(){
		job=jm.getJobOne(job.getJobCode());
		ldb=dm.getDepartmentAllList();
		return SUCCESS;
	}
	
	
	@SuppressWarnings("unchecked")
	public String goAddJob(){
		job=new JobBean();
		ldb=dm.getDepartmentAllList();
		job.setJobCode(ICTools.randId("J"));
		return SUCCESS;
	}
	
	
	public String addJob(){
		if(jm.addJob(job)){
			job.setMessage(ICTools.MESSAGE_OK);
		}else{
			job.setMessage(ICTools.MESSAGE_ERROR);
		}
		return SUCCESS;
	}
	
	
	@SuppressWarnings("unchecked")
	public String showJob(){
		job=jm.getPageJob(job);
		lhp=jm.getJobList(job);
		return SUCCESS;
	}
	
	
	public String updateJob(){
		if(jm.updateJob(job)){
			job.setMessage(ICTools.MESSAGE_UPDATEOK);
		}else{
			job.setMessage(ICTools.MESSAGE_ERROR);
		}
		return SUCCESS;
	}

	
	public String findJob(){
		this.showJob();
		return SUCCESS;
	}
}
