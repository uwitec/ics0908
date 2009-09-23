package com.manage.stockmanage;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.dbserver.DBServer;
import com.manage.baseset.PageManage;
import com.mydomain.bean.stockmanage.StockMaxMin;

public class StockMaxMinManage {
	
	
	/*********MAX**********/
	public StockMaxMin getStocMaxAllPage(StockMaxMin stockmm){
		PageManage pm=new PageManage();
		if(stockmm==null)
			stockmm=new StockMaxMin();
		return stockmm=(StockMaxMin) pm.setPage(stockmm, "showMaxCount");
	}
	
	public StockMaxMin getStockMaxDefPage(StockMaxMin stockmm){
		PageManage pm=new PageManage();
		if(stockmm==null)
			stockmm=new StockMaxMin();
		return stockmm=(StockMaxMin) pm.setPage(stockmm, "showStockMaxDefCount");
	}

	@SuppressWarnings("unchecked")
	public List<StockMaxMin> getStockMaxAll(StockMaxMin stockmm){
		try {
			return (List<StockMaxMin>) DBServer.quider.queryForList("showMaxStockAll", stockmm);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			com.dbserver.DBServer.logger.exception(e);
			return new ArrayList<StockMaxMin>();
		}
	}
	
	@SuppressWarnings("unchecked")
	public List<StockMaxMin> getStockMaxDef(StockMaxMin stockmm){
		try {
			return (List<StockMaxMin>) DBServer.quider.queryForList("showStockMaxDef", stockmm);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			com.dbserver.DBServer.logger.exception(e);
			return new ArrayList<StockMaxMin>();
		}
	}
	
	/********MIN*********/
	public StockMaxMin getStockMinAllPage(StockMaxMin stockmm){
		PageManage pm=new PageManage();
		if(stockmm==null)
			stockmm=new StockMaxMin();
		return stockmm=(StockMaxMin) pm.setPage(stockmm, "showStockMinCount");
	}
	
	public StockMaxMin getStockMinDefPage(StockMaxMin stockmm){
		PageManage pm=new PageManage();
		if(stockmm==null)
			stockmm=new StockMaxMin();
		return stockmm=(StockMaxMin) pm.setPage(stockmm, "showStockMinDefCount");
	}
	
	@SuppressWarnings("unchecked")
	public List<StockMaxMin> getStockMinAll(StockMaxMin stockmm){
		try {
			return (List<StockMaxMin>) DBServer.quider.queryForList("showStockMinAll", stockmm);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			com.dbserver.DBServer.logger.exception(e);
			return new ArrayList<StockMaxMin>();
		}
	}
	
	@SuppressWarnings("unchecked")
	public List<StockMaxMin> getStockMinDef(StockMaxMin stockmm){
		try {
			return (List<StockMaxMin>) DBServer.quider.queryForList("showStockMinDef", stockmm);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			com.dbserver.DBServer.logger.exception(e);
			return new ArrayList<StockMaxMin>();
		}
	}
}
