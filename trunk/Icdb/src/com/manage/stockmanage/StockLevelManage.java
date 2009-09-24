package com.manage.stockmanage;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.dbserver.DBServer;
import com.manage.baseset.PageManage;
import com.mydomain.bean.stockmanage.StockLevel;

public class StockLevelManage {

	
	public StockLevel getStockLevelPage(StockLevel stockLevel){
		PageManage pm=new PageManage();
		return (StockLevel) pm.setPage(stockLevel,"showOutMaCount");
	}
	
	@SuppressWarnings("unchecked")
	public List<StockLevel> getStockLevelList(StockLevel stockLevel){
		try {
			return (List<StockLevel>) DBServer.quider.queryForList("showOutMa", stockLevel);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			com.dbserver.DBServer.logger.exception(e);
			return new ArrayList<StockLevel>();
		}
	}
}
