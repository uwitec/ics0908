package com.manage.storage;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.dbserver.DBServer;
import com.manage.baseset.PageManage;
import com.mydomain.bean.baseset.MaterielBean;
import com.mydomain.bean.storage.PriceChangeBean;
import com.mydomain.bean.storage.PriceChangeMaterBean;
import com.mydomain.bean.storage.StockBean;
import com.tools.ICTools;

public class PriceChangeManage {

	
	public PriceChangeBean getPriceChangePage(PriceChangeBean pricechange){
		PageManage pm=new PageManage();
		if(pricechange==null){
			pricechange=new PriceChangeBean();
			ICTools.setBean(pricechange, "");
			pricechange.setStartTime(ICTools.m_startTime);
			pricechange.setEndTime(ICTools.getSearchTime());
			
		}
		return (PriceChangeBean) pm.setPage(pricechange, "selectPriceChangeCount");
	}
	
	public PriceChangeBean getOnePriceChange(PriceChangeBean pricechange){
		try {
			return (PriceChangeBean) DBServer.quider.queryForObject("selectOnePriceChange", pricechange);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			com.dbserver.DBServer.logger.exception(e);
			return new PriceChangeBean();
		}
	}
	
	@SuppressWarnings("unchecked")
	public List<PriceChangeBean> getPriceChangeList(PriceChangeBean pricechange){
		try {
			return (List<PriceChangeBean>) DBServer.quider.queryForList("selectPriceChangeDef", pricechange);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			com.dbserver.DBServer.logger.exception(e);
			return new ArrayList<PriceChangeBean>();
		}
	}
	
	@SuppressWarnings("unchecked")
	public List<PriceChangeMaterBean> getPriceMaterList(PriceChangeBean pricechange){
		try {
			return (List<PriceChangeMaterBean>) DBServer.quider.queryForList("selectPriceChangeMaterieltDef", pricechange.getPchangeCode());
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			com.dbserver.DBServer.logger.exception(e);
			return new ArrayList<PriceChangeMaterBean>();
		}
	}
	
	public boolean deletePriceChange(PriceChangeBean pricechange){
		try {
			DBServer.quider.deleteObject("deletePriceChangeBean", pricechange);
			return true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			com.dbserver.DBServer.logger.exception(e);
			return false;
		}
	}
	
	public boolean addPriceChange(PriceChangeBean pricechange,List<PriceChangeMaterBean> priceMaterList){
		try {
			DBServer.quider.startTransaction();
			DBServer.quider.insertObject("insertPriceChangeBean",pricechange);
			if(pricechange.getPchangeState()==1){
				for(PriceChangeMaterBean temp_PriceMater:priceMaterList){
					StockBean temp_stock=this.getStoc(temp_PriceMater);
					MaterielBean temp_mater=this.getMater(temp_PriceMater);
					DBServer.quider.insertObject("insertPriceChangeMaterielBean", temp_PriceMater);
					DBServer.quider.updateObject("updateStockPriceBean", temp_stock);
					DBServer.quider.updateObject("updateMaterielPrice", temp_mater);
				}
			}else if(pricechange.getPchangeState()==2){
				for(PriceChangeMaterBean temp_PriceMater:priceMaterList){
					DBServer.quider.insertObject("insertPriceChangeMaterielBean", temp_PriceMater);
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
	
	public boolean updatePriceChange(PriceChangeBean pricechange,List<PriceChangeMaterBean> priceMaterList){
		try {
			DBServer.quider.startTransaction();
			DBServer.quider.updateObject("updatePriceChangeBean",pricechange);
			DBServer.quider.deleteObject("deletePriceChangeMaterielBean", pricechange.getPchangeDate());
			if(pricechange.getPchangeState()==1){
				for(PriceChangeMaterBean temp_PriceMater:priceMaterList){
					StockBean temp_stock=this.getStoc(temp_PriceMater);
					MaterielBean temp_mater=this.getMater(temp_PriceMater);
					DBServer.quider.insertObject("insertPriceChangeMaterielBean", temp_PriceMater);
					DBServer.quider.updateObject("updateStockPriceBean", temp_stock);
					DBServer.quider.updateObject("updateMaterielPrice", temp_mater);
				}
			}else if(pricechange.getPchangeState()==2){
				for(PriceChangeMaterBean temp_PriceMater:priceMaterList){
					DBServer.quider.insertObject("insertPriceChangeMaterielBean", temp_PriceMater);
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
	
	private StockBean getStoc(PriceChangeMaterBean priceChageMater){
		StockBean temp_stock=new StockBean();
		temp_stock.setCargoSpaceCode(priceChageMater.getCargoSpaceCode());
		temp_stock.setMaterielCode(priceChageMater.getMaterielCode());
		temp_stock.setStockPrice(priceChageMater.getStockPriceNew());
		return temp_stock;
	}
	
	private MaterielBean getMater(PriceChangeMaterBean priceChageMater){
		MaterielBean temp_mater=new MaterielBean();
		temp_mater.setMaterielCode(priceChageMater.getMaterielCode());
		temp_mater.setMaterielPrice(String.valueOf(priceChageMater.getStockPriceNew()));
		return temp_mater;
	}
}
