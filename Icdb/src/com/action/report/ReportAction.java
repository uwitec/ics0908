package com.action.report;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.dbserver.DBServer;
import com.dbserver.conf.ALCFFactory;
import com.dbserver.conf.AutoConfiger;
import com.mydomain.bean.report.ABCReportBean;
import com.mydomain.bean.report.ABCType;
import com.mydomain.bean.report.CheckStock;
import com.mydomain.bean.report.Type;
import com.opensymphony.xwork2.ActionSupport;

public class ReportAction extends ActionSupport {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private List<CheckStock> csList;
	private CheckStock csBean;
	private ABCReportBean abcReportBean;

	private List<Type> abcTypeList;

	private List<Type> reportTypeList;

	private void initABCType() {
		if (null != abcTypeList) {
			return;
		}
		AutoConfiger acf;
		try {
			acf = ALCFFactory.createAutoConfiger("propeties/icdb_option.cfg");
			abcTypeList = getType(acf.getValue("materiel_type"));
			reportTypeList = getType(acf.getValue("report_type"));
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}

	}

	private List<Type> getType(String value) {
		List<Type> typeList = new ArrayList<Type>();
		if (null != value) {
			String[] vArr = value.split(",");
			if (0 < vArr.length) {
				for (int i = 0; i < vArr.length; i++) {
					ABCType t = new ABCType();
					String[] vs = vArr[i].split(":");
					if (3 == vs.length) {
						t.setKey(vs[0]);
						t.setName(vs[1]);
						t.setValue(vs[2]);
						typeList.add(t);
					}
				}
			}
		}
		return typeList;
	}

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
			DBServer.logger.exception(e);
		}
		return "SUCCESS";
	}

	public String showReportList() {
		initABCType();
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

	public ABCReportBean getAbcReportBean() {
		return abcReportBean;
	}

	public void setAbcReportBean(ABCReportBean abcReportBean) {
		this.abcReportBean = abcReportBean;
	}

	public List<Type> getAbcTypeList() {
		return abcTypeList;
	}

	public void setAbcTypeList(List<Type> abcTypeList) {
		this.abcTypeList = abcTypeList;
	}

	public List<Type> getReportTypeList() {
		return reportTypeList;
	}

	public void setReportTypeList(List<Type> reportTypeList) {
		this.reportTypeList = reportTypeList;
	}

}
