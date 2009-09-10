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

	private boolean isQueryAllType(String mtype) {
		// �������Ϊ�գ������棬��ѯ�������ݡ�
		if (null == mtype) {
			return true;
		}

		try {
			Integer i = Integer.parseInt(mtype);
			if (0 > i) { // �������ֵС��0���򷵻��档
				return true;
			} else { // �������ֵ���ڵ���0���򷵻ؼ٣��������������Ͳ�ѯ��
				return false;
			}
		} catch (NumberFormatException e) {
			// ��β���һ�����֣������棬��ѯ�������ݡ�
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

}
