package com.manage.stockmanage;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.dbserver.DBServer;
import com.manage.baseset.PageManage;
import com.mydomain.bean.stockmanage.StockTurn;

public class StockTurnManage {

	
	public StockTurn getStockTurnPage(StockTurn stockturn){
		PageManage pm=new PageManage();
		if(stockturn==null)
			stockturn=new StockTurn();
		if(stockturn.getMaterielABC().equals("-1"))
			stockturn.setMaterielABC("");
		return (StockTurn) pm.setPage(stockturn, "showStockTurnCount");
	}
	
	@SuppressWarnings("unchecked")
	public List<StockTurn> getStockTurnList(StockTurn stockturn){
		try {
			if(stockturn.getMaterielABC().equals("-1"))
				stockturn.setMaterielABC("");
			return (List<StockTurn>) DBServer.quider.queryForList("showStockTurnList", stockturn);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			com.dbserver.DBServer.logger.exception(e);
			return new ArrayList<StockTurn>();
			
		}
	}
}
