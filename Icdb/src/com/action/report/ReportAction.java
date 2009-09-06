package com.action.report;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.dbserver.DBServer;
import com.mydomain.bean.report.CheckStock;
import com.opensymphony.xwork2.ActionSupport;

public class ReportAction extends ActionSupport {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private List<CheckStock> csList;
	private CheckStock csBean;

	public String selectCheckStock() {
		try {
			csList = new ArrayList<CheckStock>();
			if (null == csBean) {
				csBean = new CheckStock();
			}
			List<?> list = DBServer.quider.queryForList(csBean, csBean
					.getClass());
			if (null != list && 0 < list.size()) {
				for (int i = 0; i < list.size(); i++) {
					Object o = list.get(i);
					if (o instanceof CheckStock) {
						csList.add((CheckStock) (o));
					}
				}
			} else {
				return "NULLRESULT";
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			DBServer.logger.exception(e);
		}
		return "SUCCESS";
	}

	public List<CheckStock> getCsList() {
		return csList;
	}

	public void setCsList(List<CheckStock> csList) {
		this.csList = csList;
	}

	public CheckStock getCsBean() {
		return csBean;
	}

	public void setCsBean(CheckStock csBean) {
		this.csBean = csBean;
	}

}
