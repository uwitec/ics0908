package com.manage.storage;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.dbserver.DBServer;
import com.mydomain.bean.storage.Page;
import com.mydomain.bean.storage.PageUtil;
import com.mydomain.bean.storage.StockInBean;
import com.mydomain.bean.storage.StockInCheckMaterielBean;

public class StockInManage extends GenericManage<StockInBean, Long> {
	public PageUtil<StockInBean> findStockIn(Map<String, Object> parameter,
			Page page) throws SQLException {

		List<StockInBean> list = this.findQueryPage("STOCK_IN_SELECT_PAGE",
				"SELECT_STOCK_IN_COUNT", parameter, page);

		if (list == null) {
			list = new ArrayList<StockInBean>();
		}

		return new PageUtil<StockInBean>(list, page);
	}

	public PageUtil<StockInBean> findStockIn(StockInBean parameter, Page page)
			throws SQLException {
		List<StockInBean> list = this.findQueryPage("STOCK_IN_SELECT_PAGE",
				"SELECT_STOCK_IN_COUNT", parameter, page);

		if (list == null) {
			list = new ArrayList<StockInBean>();
		}

		return new PageUtil<StockInBean>(list, page);
	}

	public StockInBean getStockInInfo(String stockInCode) throws SQLException {
		Map<String, String> parameter = new HashMap<String, String>();
		parameter.put("stockInCode", stockInCode);
		StockInBean stockInBean = (StockInBean) DBServer.quider.queryForList(
				"STOCK_IN_SELECT_BY_KEY", parameter).get(0);
		return stockInBean;
	}

	@SuppressWarnings("unchecked")
	public List<StockInCheckMaterielBean> getStockInCheckMateriel(
			String stockInCode) throws SQLException {
		StockInCheckMaterielBean stockInCheckMaterielBean = new StockInCheckMaterielBean();
		stockInCheckMaterielBean.setStockInCode(stockInCode);
		List<StockInCheckMaterielBean> list = (List<StockInCheckMaterielBean>) DBServer.quider
				.queryForList("STOCK_IN_CHECK_MATERIEL_AND_MATERIEL_SELECT",
						stockInCheckMaterielBean);
		return list;
	}

	public boolean save(StockInBean stockInBean,
			List<StockInCheckMaterielBean> stockInCheckMaterielList)
			throws SQLException {
		try {
			DBServer.quider.startTransaction();
			stockInBean.setStockInStateType(2);
			stockInBean.setStockInCheckState(0);
			stockInBean.setCheckResult(-1);
			stockInBean.setStockInDate(new Date());
			if (this.getStockInInfo(stockInBean.getStockInCode()) != null) {
				DBServer.quider.updateObject("UPDATE_SELECT_STOCK_IN",
						stockInBean);
			}
			DBServer.quider.insertObject("ADD_SELECT_STOCK_IN", stockInBean);
			for (StockInCheckMaterielBean stockInCheckMaterielBean : stockInCheckMaterielList) {
				if (this.getStockInCheckMaterielCount(stockInCheckMaterielBean) > 0) {
					DBServer.quider.updateObject("UPDATE_STOCK_IN_CHECK_MATERIEL", stockInCheckMaterielBean);
				} else {
					DBServer.quider.insertObject("ADD_STOCK_IN_CHECK_MATERIEL",
							stockInCheckMaterielBean);
				}
			}

			DBServer.quider.commitTransaction();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			log.error("", e);
			return false;
		} finally {
			DBServer.quider.endTransaction();
		}
		return true;
	}

	public boolean submit(StockInBean stockInBean,
			List<StockInCheckMaterielBean> stockInCheckMaterielList)
			throws SQLException {
		try {
			DBServer.quider.startTransaction();
			stockInBean.setStockInStateType(1);
			stockInBean.setStockInCheckState(0);
			stockInBean.setCheckResult(-1);
			stockInBean.setStockInDate(new Date());
			if (this.getStockInInfo(stockInBean.getStockInCode()) != null) {
				DBServer.quider.updateObject("UPDATE_SELECT_STOCK_IN",
						stockInBean);
			}
			DBServer.quider.insertObject("ADD_SELECT_STOCK_IN", stockInBean);
			for (StockInCheckMaterielBean stockInCheckMaterielBean : stockInCheckMaterielList) {
				if (this.getStockInCheckMaterielCount(stockInCheckMaterielBean) > 0) {
					DBServer.quider.updateObject("UPDATE_STOCK_IN_CHECK_MATERIEL", stockInCheckMaterielBean);
				} else {
					DBServer.quider.insertObject("ADD_STOCK_IN_CHECK_MATERIEL",
							stockInCheckMaterielBean);
				}
			}

			DBServer.quider.commitTransaction();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			log.error("", e);
			return false;
		} finally {
			DBServer.quider.endTransaction();
		}
		return true;
	}

	@SuppressWarnings("unchecked")
	public int getStockInCheckMaterielCount(
			StockInCheckMaterielBean stockInCheckMaterielBean)
			throws SQLException {
		Map<String, Object> parameterMap = new HashMap<String, Object>();
		parameterMap.put("materielCode", stockInCheckMaterielBean
				.getMaterielCode());
		parameterMap.put("stockInCode", stockInCheckMaterielBean
				.getStockInCode());

		List<StockInCheckMaterielBean> list = (List<StockInCheckMaterielBean>) DBServer.quider.queryForList("STOCK_IN_CHECK_MATERIEL_AND_MATERIEL_SELECT",parameterMap);
		return list.size();
//		int count = (Integer) DBServer.quider.queryForObject(
//				"STOCK_IN_CHECK_MATEREIL_COUNT", parameterMap);

//		return count;
	}

	public boolean deleteStockInCheckMateriel(String marterielCode,
			String stockInCode) throws SQLException {
		Map<String, String> parameterMap = new HashMap<String, String>();
		parameterMap.put("materielCode", marterielCode);
		parameterMap.put("stockInCode", stockInCode);
		try {
			DBServer.quider.startTransaction();
			DBServer.quider.deleteObject("DELETE_STOCK_IN_CHECK_MATERIEL",
					parameterMap);
			DBServer.quider.commitTransaction();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			log.error("",e);
			return false;
		} finally {
			DBServer.quider.endTransaction();
		}
		return true;
	}

	public boolean deleteStockIn(String stockInCode) throws SQLException{

		Map<String, String> paraeterMap = new HashMap<String, String>();
		paraeterMap.put("stockInCode", stockInCode);

		try {
			DBServer.quider.startTransaction();
			DBServer.quider.deleteObject("DELETE_STOCK_IN_CHECK_MATERIEL", paraeterMap);
			DBServer.quider.deleteObject("DEKETE_STOCK_IN", paraeterMap);
			DBServer.quider.commitTransaction();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			log.error("", e);
			return false;
		}finally{
			DBServer.quider.endTransaction();
		}

		return true;
	}
}
