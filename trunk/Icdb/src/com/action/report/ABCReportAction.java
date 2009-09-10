package com.action.report;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;

import propeties.IcdbOption;

import com.dbserver.DBServer;
import com.dbserver.conf.ALCFFactory;
import com.dbserver.conf.AutoConfiger;
import com.mydomain.bean.report.ABCReportBean;
import com.mydomain.bean.report.ABCType;
import com.opensymphony.xwork2.ActionSupport;

public class ABCReportAction extends ActionSupport {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private List<ABCReportBean> abcReportList;

	private ABCReportBean abcReportBean;

	private List<ABCType> abcTypeList;

	private void initABCType() {
		if (null != abcTypeList) {
			return;
		}
		abcTypeList = new ArrayList<ABCType>();
		AutoConfiger acf;
		try {
			acf = ALCFFactory.createAutoConfiger("propeties/icdb_option.cfg");
			String value = acf.getValue("materiel_type");
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
							abcTypeList.add(t);
						}
					}
				}
			}
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}

	}

	private boolean isQueryAllType(String mtype) {
		initABCType();
		// 如果类型为空，返回真，查询所有数据。
		if (null == mtype) {
			return true;
		}

		try {
			Integer i = Integer.parseInt(mtype);
			if (0 > i) { // 如果类型值小于0，则返回真。
				return true;
			} else { // 如果类型值大于等于0，则返回假，即按给定的类型查询。
				return false;
			}
		} catch (NumberFormatException e) {
			// 入参不是一个数字，返回真，查询所有数据。
			return true;
		}

	}

	public String showReportList() {
		try {
			abcReportList = new ArrayList<ABCReportBean>();
			if (null == abcReportBean) {
				abcReportBean = new ABCReportBean();
			}
			List<?> list = null;
			if (isQueryAllType(abcReportBean.getMaterielType())) {

				list = DBServer.quider.queryForList("selectAllABCReportBean",
						abcReportBean);
			} else {
				list = DBServer.quider.queryForList("queryABCReportBean",
						abcReportBean);
			}
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

	public List<ABCType> getAbcTypeList() {
		return abcTypeList;
	}

	public void setAbcTypeList(List<ABCType> abcTypeList) {
		this.abcTypeList = abcTypeList;
	}

}
