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
import com.mydomain.bean.storage.StockBean;
import com.mydomain.bean.storage.StockInBean;
import com.mydomain.bean.storage.StockInCheckMaterielBean;
import com.mydomain.bean.storage.StockOutBean;
import com.mydomain.bean.storage.StockOutHasMaterielBean;

public class StockOutManage extends GenericManage<StockOutBean, Long> {
	public PageUtil<StockOutBean> findStockOut(Map<String, Object> parameter,
			Page page) throws SQLException {

		List<StockOutBean> list = this.findQueryPage("STOCK_OUT_SELECT_PAGE",
				"SELECT_STOCK_OUT_COUNT", parameter, page);

		if (list == null) {
			list = new ArrayList<StockOutBean>();
		}

		return new PageUtil<StockOutBean>(list, page);
	}

	public PageUtil<StockOutBean> findStockOut(StockOutBean parameter, Page page)
			throws SQLException {
		List<StockOutBean> list = this.findQueryPage("STOCK_OUT_SELECT_PAGE",
				"SELECT_STOCK_OUT_COUNT", parameter, page);

		if (list == null) {
			list = new ArrayList<StockOutBean>();
		}

		return new PageUtil<StockOutBean>(list, page);
	}

	public StockOutBean getStockOutInfo(String stockOutCode)
			throws SQLException {
		Map<String, String> parameter = new HashMap<String, String>();
		parameter.put("stockOutOrderCode", stockOutCode);
		StockOutBean stockOutBean = (StockOutBean) DBServer.quider
				.queryForList("STOCK_OUT_SELECT_BY_KEY", parameter).get(0);
		return stockOutBean;
	}

	@SuppressWarnings("unchecked")
	public List<StockOutHasMaterielBean> getStockOutHaskMateriel(
			String stockOutOrderCode) throws SQLException {
		StockOutHasMaterielBean stockOutHasMaterielBean = new StockOutHasMaterielBean();
		stockOutHasMaterielBean.setStockOutOrderCode(stockOutOrderCode);
		List<StockOutHasMaterielBean> list = (List<StockOutHasMaterielBean>) DBServer.quider
				.queryForList("STOCK_OUT_MATERIEL_SELECT",
						stockOutHasMaterielBean);
		return list;
	}

	@SuppressWarnings("unchecked")
	public List<StockOutHasMaterielBean> getStockOutHaskMaterielAndStock(
			String stockOutOrderCode) throws SQLException {
		StockOutHasMaterielBean stockOutHasMaterielBean = new StockOutHasMaterielBean();
		stockOutHasMaterielBean.setStockOutOrderCode(stockOutOrderCode);
		List<StockOutHasMaterielBean> list = (List<StockOutHasMaterielBean>) DBServer.quider
				.queryForList("STOCK_OUT_MATERIEL_AND_STOCK_SELECT",
						stockOutHasMaterielBean);
		return list;
	}

	public boolean save(StockOutBean stockOutBean,
			List<StockOutHasMaterielBean> StockOutHasMaterielList)
			throws SQLException {
		try {
			DBServer.quider.startTransaction();
			stockOutBean.setStockOutWithState(0);
			stockOutBean.setStockOutDealState(0);
			stockOutBean.setStockOutCheckState(0);
			stockOutBean.setStockOutWithState(0);
			stockOutBean.setStockOutStateType(2);
			if (this.getStockOutCount(stockOutBean) > 0) {
				DBServer.quider.updateObject("UPDATE_SELECT_STOCK_OUT",
						stockOutBean);
			} else {
				stockOutBean.setStockOutWillDate(new Date());
				DBServer.quider.insertObject("ADD_STOCK_OUT", stockOutBean);
			}
			for (StockOutHasMaterielBean stockOutHasMaterielBean : StockOutHasMaterielList) {
				if (this.getStockOutHasMaterielCount(stockOutHasMaterielBean) > 0) {
					DBServer.quider.updateObject("UPDATE_STOCK_OUT_MATERIEL",
							stockOutHasMaterielBean);
				} else {
					DBServer.quider.insertObject("ADD_STOCK_OUT_MATERIEL",
							stockOutHasMaterielBean);
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

	public boolean submit(StockOutBean stockOutBean,
			List<StockOutHasMaterielBean> StockOutHasMaterielList)
			throws SQLException {
		try {
			DBServer.quider.startTransaction();
			stockOutBean.setStockOutWithState(0);
			stockOutBean.setStockOutDealState(0);
			stockOutBean.setStockOutCheckState(0);
			stockOutBean.setStockOutWithState(0);
			stockOutBean.setStockOutStateType(1);
			if (this.getStockOutCount(stockOutBean) > 0) {
				DBServer.quider.updateObject("UPDATE_SELECT_STOCK_OUT",
						stockOutBean);
			} else {
				DBServer.quider.insertObject("ADD_STOCK_OUT", stockOutBean);
			}
			for (StockOutHasMaterielBean stockOutHasMaterielBean : StockOutHasMaterielList) {
				if (this.getStockOutHasMaterielCount(stockOutHasMaterielBean) > 0) {
					DBServer.quider.updateObject("UPDATE_STOCK_OUT_MATERIEL",
							stockOutHasMaterielBean);
				} else {
					DBServer.quider.insertObject("ADD_STOCK_OUT_MATERIEL",
							stockOutHasMaterielBean);
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
	private int getStockOutHasMaterielCount(
			StockOutHasMaterielBean stockOutHasMaterielBean)
			throws SQLException {
		Map<String, Object> parameterMap = new HashMap<String, Object>();
		parameterMap.put("materielCode", stockOutHasMaterielBean
				.getMaterielCode());
		parameterMap.put("stockOutOrderCode", stockOutHasMaterielBean
				.getStockOutOrderCode());

		List<StockInCheckMaterielBean> list = (List<StockInCheckMaterielBean>) DBServer.quider
				.queryForList("STOCK_OUT_MATERIEL_SELECT", parameterMap);
		return list.size();
		// int count = (Integer) DBServer.quider.queryForObject(
		// "STOCK_IN_CHECK_MATEREIL_COUNT", parameterMap);

		// return count;
	}

	@SuppressWarnings("unchecked")
	private int getStockOutCount(StockOutBean stockOutBean) throws SQLException {
		Map<String, Object> parameterMap = new HashMap<String, Object>();
		parameterMap.put("stockOutOrderCode", stockOutBean
				.getStockOutOrderCode());

		List<StockInBean> list = (List<StockInBean>) DBServer.quider
				.queryForList("STOCK_OUT_SELECT", parameterMap);
		return list.size();
	}

	public boolean deleteStockOutMateriel(String marterielCode,
			String stockOutCode) throws SQLException {
		Map<String, String> parameterMap = new HashMap<String, String>();
		parameterMap.put("materielCode", marterielCode);
		parameterMap.put("stockOutOrderCode", stockOutCode);
		try {
			DBServer.quider.startTransaction();
			DBServer.quider.deleteObject("DELETE_STOCK_OUT_HAS_MATERIEL",
					parameterMap);
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

	public boolean deleteStockOut(String stockOutOrderCode) throws SQLException {

		Map<String, String> paraeterMap = new HashMap<String, String>();
		paraeterMap.put("stockOutOrderCode", stockOutOrderCode);

		try {
			DBServer.quider.startTransaction();
			DBServer.quider.deleteObject("DELETE_STOCK_OUT_HAS_MATERIEL",
					paraeterMap);
			DBServer.quider.deleteObject("DEKETE_STOCK_OUT", paraeterMap);
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

	public boolean approvalSave(StockOutBean stockOutBean) throws SQLException {

		try {
			DBServer.quider.startTransaction();
			stockOutBean.setStockOutDealState(0);
			stockOutBean.setStockOutWithState(0);
			stockOutBean.setStockOutCheckDate(new Date());

			DBServer.quider.updateObject("UPDATE_SELECT_STOCK_OUT",
					stockOutBean);
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

	public boolean complStockOut(StockOutBean stockOutBean,
			List<StockOutHasMaterielBean> stockOutHasMaterielList)
			throws SQLException {

		try {
			DBServer.quider.startTransaction();
			int temp = stockOutBean.getStockOutStateType();
			if (temp == 3) {
				stockOutBean.setStockOutWithState(1);
				stockOutBean.setStockOutStateType(1);
			}

			DBServer.quider.updateObject("UPDATE_SELECT_STOCK_OUT",
					stockOutBean);

			for (StockOutHasMaterielBean stockOutHasMaterielBean : stockOutHasMaterielList) {
				DBServer.quider.updateObject("UPDATE_STOCK_OUT_MATERIEL",
						stockOutHasMaterielBean);

				if (temp == 3) {
					StockBean stock = new StockBean();
					stock.setCargoSpaceCode(stockOutHasMaterielBean
							.getCargoSpaceCode());
					stock.setMaterielCode(stockOutHasMaterielBean
							.getMaterielCode());
					stock = (StockBean) DBServer.quider.queryForObject(
							"STOCK_SELECT_BY_KEY", stock);
					stock.setStockAmount((Float.parseFloat(stock
							.getStockAmount()) - stockOutHasMaterielBean
							.getStockOutAmount())
							+ "");
					DBServer.quider.updateObject("STOCK_UPDATE_FOR_STOCK_OUT",
							stock);
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

	public boolean checkSave(StockOutBean stockOutBean,
			List<StockOutHasMaterielBean> stockOutHasMaterielList)
			throws SQLException {
		try {
			DBServer.quider.startTransaction();
			stockOutBean.setStockOutDealDate(new Date());

			DBServer.quider.updateObject("UPDATE_SELECT_STOCK_OUT",
					stockOutBean);

			for (StockOutHasMaterielBean stockOutHasMaterielBean : stockOutHasMaterielList) {

				DBServer.quider.updateObject("UPDATE_STOCK_OUT_MATERIEL",
						stockOutHasMaterielBean);

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

	public boolean checkSubmit(StockOutBean stockOutBean,
			List<StockOutHasMaterielBean> stockOutHasMaterielList)
			throws SQLException {
		try {
			DBServer.quider.startTransaction();

			stockOutBean.setStockOutDealDate(new Date());

			DBServer.quider.updateObject("UPDATE_SELECT_STOCK_OUT",
					stockOutBean);

			for (StockOutHasMaterielBean stockOutHasMaterielBean : stockOutHasMaterielList) {

				DBServer.quider.updateObject("UPDATE_STOCK_OUT_MATERIEL",
						stockOutHasMaterielBean);
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
}
