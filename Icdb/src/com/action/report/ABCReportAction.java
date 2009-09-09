package com.action.report;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.dbserver.DBServer;
import com.mydomain.bean.report.ABCReportBean;
import com.opensymphony.xwork2.ActionSupport;

public class ABCReportAction extends ActionSupport {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private List<ABCReportBean> abcReportList;

	private ABCReportBean abcReportBean;

	public String showReportList() {
		try {
			abcReportList = new ArrayList<ABCReportBean>();
			if (null == abcReportBean) {
				abcReportBean = new ABCReportBean();
			}
			//abcReportBean.setBeginDate("2009-09-01 00:00:00");
			//abcReportBean.setEndDate("2009-09-08 23:59:59");
			// System.out.println("abcbean: " + abcReportBean.getBeginDate());
			// System.out.println("abcbean: " + abcReportBean.getEndDate());
			List<?> list = DBServer.quider.queryForList(
					"selectAllABCReportBean", abcReportBean);
			if (null != list) {
				for (int i = 0; i < list.size(); i++) {
					Object o = list.get(i);
					if (o instanceof ABCReportBean) {
						abcReportList.add((ABCReportBean) o);
					}
				}
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "SUCCESS";
	}

	public List<ABCReportBean> getAbcReportList() {
		return abcReportList;
	}

	public void setAbcReportList(List<ABCReportBean> abcReportList) {
		this.abcReportList = abcReportList;
	}

	public ABCReportBean getAbcReportBean() {
		return abcReportBean;
	}

	public void setAbcReportBean(ABCReportBean abcReportBean) {
		this.abcReportBean = abcReportBean;
	}

}
