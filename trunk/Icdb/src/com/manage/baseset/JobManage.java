package com.manage.baseset;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.dbserver.DBServer;
import com.mydomain.bean.baseset.JobBean;

public class JobManage {

	@SuppressWarnings("unchecked")
	public List<JobBean> getJobList(JobBean job){
		try {
			return (List<JobBean>) DBServer.quider.queryForList("selectJobDef",job);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			com.dbserver.DBServer.logger.exception(e);
			return new ArrayList<JobBean>();
		}
	}
	
	public JobBean getJobOne(String Id){
		try {
			return (JobBean) DBServer.quider.queryForObjectById(Id, JobBean.class);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			com.dbserver.DBServer.logger.exception(e);
			return new JobBean();
		}
	}
	
	public boolean addJob(JobBean job){
		try {
			DBServer.quider.insertObject(job);
			return true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			com.dbserver.DBServer.logger.exception(e);
			return false;
		}
	}
	
	public boolean updateJob(JobBean job){
		try {
			DBServer.quider.updateObject(job);
			return true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			com.dbserver.DBServer.logger.exception(e);
			return false;
		}
	}
	
	public JobBean getPageJob(JobBean job){
		PageManage pm=new PageManage();
		return (JobBean) pm.setPage(job, "selectJobcount");
	}
}
