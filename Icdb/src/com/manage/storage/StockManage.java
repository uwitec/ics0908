package com.manage.storage;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.dbserver.DBServer;
import com.mydomain.bean.baseset.StorehouseBean;
import com.mydomain.bean.storage.StockBean;

public class StockManage {

	@SuppressWarnings("unchecked")
	public List<StockBean> getStockListOfStoreHouse(StockBean stock){
		try {
			return (List<StockBean>) DBServer.quider.queryForList("selectStockOfStoreHouse", stock);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			com.dbserver.DBServer.logger.exception(e);
			return new ArrayList<StockBean>();
		}
	}
	
	public StockBean getStockOne(String Id){
		try {
			return (StockBean) DBServer.quider.queryForObjectById(Id, StorehouseBean.class);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			com.dbserver.DBServer.logger.exception(e);
			return new StockBean();
		}
	}
	
	public boolean addStock(StockBean stock){
		try {
			DBServer.quider.insertObject(stock);
			return true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			com.dbserver.DBServer.logger.exception(e);
			return false;
		}
	}
	
	public boolean updateStock(StockBean stock){
		try {
			DBServer.quider.updateObject(stock);
			return true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			com.dbserver.DBServer.logger.exception(e);
			return false;
		}
	}
	
	public boolean updateStockList(List<StockBean> stock_list){
		if(stock_list==null)
			return false;
		try {
			DBServer.quider.startTransaction();
			for(int i=0;i<stock_list.size();i++){
				DBServer.quider.updateObject(stock_list.get(i));
			}
			DBServer.quider.commitTransaction();
			return true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			com.dbserver.DBServer.logger.exception(e);
			return false;
		}finally{
			try {
				DBServer.quider.endTransaction();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				com.dbserver.DBServer.logger.exception(e);
			}
		}
	}
	
	public boolean outStockList(List<StockBean> stock_list){
		
		try {
			DBServer.quider.startTransaction();
			for(int i=0;i<stock_list.size();i++){
				DBServer.quider.updateObject("outStock", stock_list.get(i));
			}
			DBServer.quider.commitTransaction();
			return true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			com.dbserver.DBServer.logger.exception(e);
			return false;
		}finally{
			try {
				DBServer.quider.endTransaction();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				com.dbserver.DBServer.logger.exception(e);
			}
		}
	}
	
	public boolean inStockList(List<StockBean> stock_list){
		
		try {
			DBServer.quider.startTransaction();
			for(int i=0;i<stock_list.size();i++){
				DBServer.quider.updateObject("inStock", stock_list.get(i));
			}
			DBServer.quider.commitTransaction();
			return true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			com.dbserver.DBServer.logger.exception(e);
			return false;
		}finally{
			try {
				DBServer.quider.endTransaction();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				com.dbserver.DBServer.logger.exception(e);
			}
		}
	}
}
