package com.action.baseset;

import java.sql.SQLException;
import java.util.List;

import com.dbserver.DBServer;
import com.mydomain.bean.DepartmentBean;
import com.mydomain.bean.JobBean;
import com.opensymphony.xwork2.ActionSupport;
import com.tools.DBControl;
import com.tools.ICTools;

public class JobAction extends ActionSupport{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String jobCode;
	private String jobName;
	private String departmentCode;
	private String nextPath;
	private String rePath;
	private String message;
	private List<DepartmentBean> ldb;
	private JobBean job;
	private List<JobBean> lhp;
	/**
	 * @return the departmentCode
	 */
	public String getDepartmentCode() {
		return departmentCode;
	}
	/**
	 * @return the job
	 */
	public JobBean getJob() {
		return job;
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
	 * @return the rePath
	 */
	public String getRePath() {
		return rePath;
	}
	/**
	 * @param departmentCode the departmentCode to set
	 */
	public void setDepartmentCode(String departmentCode) {
		this.departmentCode = departmentCode;
	}
	/**
	 * @param job the job to set
	 */
	public void setJob(JobBean job) {
		this.job = job;
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
	 * @param rePath the rePath to set
	 */
	public void setRePath(String rePath) {
		this.rePath = rePath;
	}
	
	@SuppressWarnings("unchecked")
	public String getOneJob(){
		try {
			job=(JobBean) DBServer.quider.queryForObjectById(jobCode, JobBean.class);
			ldb=(List<DepartmentBean>) DBServer.quider.queryForList(DepartmentBean.class);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return SUCCESS;
	}
	@SuppressWarnings("unchecked")
	public String goAddJob(){
		try {
			ldb=(List<DepartmentBean>) DBServer.quider.queryForList(DepartmentBean.class);
			jobCode=ICTools.randId("J");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return SUCCESS;
	}
	public String addJob(){
		job=new JobBean();
		job.setJobCode(jobCode);
		job.setJobName(jobName);
		job.setDepartmentCode(departmentCode);
		DBControl db=new DBControl();
		if(db.insert(job))
		{
			message="";
		}else{
			message="有已经存在为"+jobCode+"的编号，请重新输入";
		}
		nextPath="/baseset/GoAddJob.action";
		rePath="/baseset/ShowJob.action";
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
		job=new JobBean();
		job.setJobCode(jobCode);
		job.setJobName(jobName);
		job.setDepartmentCode(departmentCode);
		try {
			DBServer.quider.updateObject(job);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return SUCCESS;
	}
	
	@SuppressWarnings("unchecked")
	public String findJob(){
		job=new JobBean();
		job.setJobName("%"+jobName+"%");
		try {
			lhp=(List<JobBean>) DBServer.quider.queryForList("selectAllJobFind", job, 0, 10);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return SUCCESS;
	}
}
