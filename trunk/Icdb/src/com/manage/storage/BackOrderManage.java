package com.manage.storage;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.dbserver.DBServer;
import com.manage.baseset.PageManage;
import com.mydomain.bean.storage.BackStockBean;
import com.mydomain.bean.storage.BackStockMaterielBean;
import com.mydomain.bean.storage.StockBean;
import com.tools.ICTools;

public class BackOrderManage {

	
	
	public BackStockBean getBackPage(BackStockBean backStock){
		PageManage pm=new PageManage();
		if(backStock==null){
			backStock=new BackStockBean();
			ICTools.setBean(backStock, "");
			backStock.setStartTime(ICTools.m_startTime);
			backStock.setEndTime(ICTools.getSearchTime());
		}
		return (BackStockBean) pm.setPage(backStock, "getBackOrderCount");
		
	}
	
	@SuppressWarnings("unchecked")
	public List<BackStockBean> getBackStockList(BackStockBean backStock){
		try {
			return (List<BackStockBean>) DBServer.quider.queryForList("selectBackOrderList", backStock);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			com.dbserver.DBServer.logger.exception(e);
			return new ArrayList<BackStockBean>();
		}
	}
	
	public BackStockBean getBackStockOne(BackStockBean backStock){
		try {
			return (BackStockBean) DBServer.quider.queryForObject("getBackOrderBean", backStock.getBackOrderCode());
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			com.dbserver.DBServer.logger.exception(e);
			return new BackStockBean();
		}
	}
	
	@SuppressWarnings("unchecked")
	public List<BackStockMaterielBean> getBackStockMaterList(BackStockBean backStock){
		try {
			return (List<BackStockMaterielBean>) DBServer.quider.queryForList("selectBackOrderMaterielrList", backStock);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			com.dbserver.DBServer.logger.exception(e);
			return new ArrayList<BackStockMaterielBean>();
		}
	}
	
	public boolean addBackStock(BackStockBean backStock,List<BackStockMaterielBean> backMaterlist){
		try {
			DBServer.quider.startTransaction();
			DBServer.quider.insertObject("insertBackOrderBean", backStock);
			for(BackStockMaterielBean temp_backMater:backMaterlist){
				DBServer.quider.insertObject("insertBackOrderMaterielBean",temp_backMater);
			}
			if(backStock.getStockOutState()==1){
				for(BackStockMaterielBean temp_mater:backMaterlist){
					StockBean instock=this.getInStock(temp_mater);
					DBServer.quider.updateObject("inStock", instock);
				}
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

	public boolean updateBackStock(BackStockBean backStock,List<BackStockMaterielBean> backMaterlist){
		try {
			DBServer.quider.startTransaction();
			DBServer.quider.updateObject("updateBackOrderBean", backStock);
			DBServer.quider.deleteObject("deleteBackOrderMaterielBean", backStock.getBackOrderCode());
			for(BackStockMaterielBean temp_backMater:backMaterlist){
				DBServer.quider.insertObject("insertBackOrderMaterielBean",temp_backMater);
			}
			if(backStock.getStockOutState()==1){
				for(BackStockMaterielBean temp_mater:backMaterlist){
					StockBean instock=this.getInStock(temp_mater);
					DBServer.quider.updateObject("inStock", instock);
				}
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
	
	 private StockBean getInStock(BackStockMaterielBean backmater){
		 	StockBean instock=new StockBean();
		 	instock.setMaterielCode(backmater.getMaterielCode());
		 	instock.setCargoSpaceCode(backmater.getCargoSpaceCode());
		 	instock.setStockAmount(String.valueOf(backmater.getMaterelCount()));
		 	instock.setStockPrice(Double.valueOf(backmater.getMaterelPrice()));
			return instock;
	 }
}
