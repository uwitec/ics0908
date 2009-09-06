package com.manage.storage;

import java.io.Serializable;
import java.lang.reflect.InvocationTargetException;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.apache.commons.beanutils.BeanUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.dbserver.DBServer;
import com.mydomain.bean.storage.Page;

public class GenericManage<T, PK extends Serializable> {
	protected final Log log = LogFactory.getLog(getClass());

	@SuppressWarnings("unchecked")
	public List<T> findQueryPage(String statementList, String statementCount,
			Object parameter, Page page) throws SQLException {
		// 查询记录数量,如果需要的话
		if (statementCount != null && !statementCount.equals("")) {
			Integer count = (Integer) DBServer.quider.queryForObject(
					statementCount, parameter);
			if (null == page) {
				page = new Page();
			}
			int currentPage = page.getCurrentPage();
			page.setTotalRowsAmount(count);
			page.setCurrentPage(currentPage);
		}
		// 将参数统一转化成Map
		Map m = new HashMap();
		// 判断parameter是否是Map类型,如果不是,将它转化成Map
		if (!(parameter instanceof Map)) {

			try {
				m = BeanUtils.describe(parameter);
			} catch (IllegalAccessException e) {
				// TODO Auto-generated catch block
				log.error("", e);
			} catch (InvocationTargetException e) {
				// TODO Auto-generated catch block
				log.error("", e);
			} catch (NoSuchMethodException e) {
				// TODO Auto-generated catch block
				log.error("", e);
			}

		} else {
			m = (Map) parameter;
		}

		// 加入分页信息
		if (null != page) {
			// 将分页信息放在参数Map中传到SqlMap里,进行物理分页.
			m.put("pageStart", page.getPageStart());
			m.put("pageSize", page.getPageSize());
		}

		// 分页查询
		List list = DBServer.quider.queryForList(statementList, m);

		return list;
	}
}
