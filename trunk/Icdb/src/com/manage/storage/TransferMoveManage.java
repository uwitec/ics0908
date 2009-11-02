package com.manage.storage;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.dbserver.DBServer;
import com.manage.baseset.PageManage;
import com.mydomain.bean.baseset.EmployeeBean;
import com.mydomain.bean.storage.StockBean;
import com.mydomain.bean.storage.TransferOrderBean;
import com.mydomain.bean.storage.TransferOrderHasMaterielBean;

public class TransferMoveManage {

	
	@SuppressWarnings("unchecked")
	public List<TransferOrderBean> getTransferOrderPersonList(TransferOrderBean transfer){
		try {
			return (List<TransferOrderBean>) DBServer.quider.queryForList("selectTransferPersonDef", transfer);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			com.dbserver.DBServer.logger.exception(e);
			return new ArrayList<TransferOrderBean>();
		}
	}
	
	public TransferOrderBean getTransferOrderPersonPage(TransferOrderBean transfer,EmployeeBean emp){
		 PageManage pm=new PageManage();
		 if(transfer==null){
		 		transfer=new TransferOrderBean();
		 		
		 }else{
			 transfer.setTransferOrderCode(transfer.getS_value());
		 }
		 transfer.setTransferOrderPerson(emp.getPersonCode());	
		 return (TransferOrderBean) pm.setPage(transfer, "selectTransferPersonCount");
	 }
	
	 @SuppressWarnings("unchecked")
	public List<TransferOrderBean> getTransferOrderHis(TransferOrderBean transfer){
		 try {
			return (List<TransferOrderBean>) DBServer.quider.queryForList("selectTransferHisDef", transfer);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			com.dbserver.DBServer.logger.exception(e);
			return new ArrayList<TransferOrderBean>();
		}
	 }
	 
	 public TransferOrderBean getTransferOrderHisPage(TransferOrderBean transfer){
		 PageManage pm=new PageManage();
		 if(transfer==null){
		 		transfer=new TransferOrderBean();
		 }
		 else{
			 transfer.setTransferOrderCode(transfer.getS_value());
		 }
		 return (TransferOrderBean) pm.setPage(transfer, "selectTransferHisCount");
	 }
	 
	 public TransferOrderBean getTransferOrderOne(String Id){
		 TransferOrderBean temp_tra=new TransferOrderBean();
		 temp_tra.setTransferOrderCode(Id);
		 try {
			return (TransferOrderBean) DBServer.quider.queryForObject("getTransferBean", temp_tra);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			com.dbserver.DBServer.logger.exception(e);
			return new TransferOrderBean();
		}
	 }
	 
	 public boolean deleteTransfer(TransferOrderBean transfer){
		 try {
			DBServer.quider.deleteObject("deleteTransferBean", transfer);
			return true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			com.dbserver.DBServer.logger.exception(e);
			return false;
		}
	 }
	 
	 public boolean addTransfer(TransferOrderBean transfer,List<TransferOrderHasMaterielBean> transferlist){	
		 try {
			DBServer.quider.startTransaction();
			DBServer.quider.insertObject("insertTransferBean",transfer);
			for(TransferOrderHasMaterielBean transerMater: transferlist){
				DBServer.quider.insertObject("insertTransferOrderHasMaterielBean", transerMater);
			}
			if(transfer.getTransferState()==1){
				for(TransferOrderHasMaterielBean transerMaterinOrout: transferlist){
					StockBean outstock=getOutStock(transerMaterinOrout);
					StockBean instock=getInStock(transerMaterinOrout);
					DBServer.quider.updateObject("outStock", outstock);
					if(DBServer.quider.queryForList("STOCK_SELECT_BY_KEY", instock).size()==1){
						DBServer.quider.updateObject("inStock", instock);
					}else{
						DBServer.quider.insertObject("insertStockBean", instock);
					}
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
	 
	 public boolean updateTransfer(TransferOrderBean transfer,List<TransferOrderHasMaterielBean> transferlist){
		 try {
				DBServer.quider.startTransaction();
				DBServer.quider.updateObject("updateTransferBean",transfer);
				TransferOrderHasMaterielBean temptranserMater=new TransferOrderHasMaterielBean();
				temptranserMater.setTransferOrderCode(transfer.getTransferOrderCode());
				DBServer.quider.deleteObject("deleteTransferOrderHasMaterielBean", temptranserMater);
				for(TransferOrderHasMaterielBean transerMater: transferlist){
					DBServer.quider.insertObject("insertTransferOrderHasMaterielBean", transerMater);
				}
				if(transfer.getTransferState()==1){
					for(TransferOrderHasMaterielBean transerMaterinOrout: transferlist){
						StockBean outstock=getOutStock(transerMaterinOrout);
						StockBean instock=getInStock(transerMaterinOrout);
						DBServer.quider.updateObject("outStock", outstock);
						if(DBServer.quider.queryForList("STOCK_SELECT_BY_KEY", instock).size()==1){
							DBServer.quider.updateObject("inStock", instock);
						}else{
							DBServer.quider.insertObject("insertStockBean", instock);
						}
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
	 
	 @SuppressWarnings("unchecked")
	public List<TransferOrderHasMaterielBean> getTransferOrderMaterList(TransferOrderBean transfer){
		 TransferOrderHasMaterielBean temp_transferMater=new TransferOrderHasMaterielBean();
		 temp_transferMater.setTransferOrderCode(transfer.getTransferOrderCode());
		 try {
			return (List<TransferOrderHasMaterielBean>) DBServer.quider.queryForList("selectTransferOrderHasMateriel", temp_transferMater);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			com.dbserver.DBServer.logger.exception(e);
			return new ArrayList<TransferOrderHasMaterielBean>();
		}
	 }
	 
	 private StockBean getOutStock(TransferOrderHasMaterielBean transerMaterinOrout){
		 	StockBean outstock=new StockBean();
			outstock.setMaterielCode(transerMaterinOrout.getMaterielCode());
			outstock.setCargoSpaceCode(transerMaterinOrout.getCargoSpaceCode());
			outstock.setStockAmount(String.valueOf(transerMaterinOrout.getMoveAmount()));
			return outstock;
	 }
	 
	 private StockBean getInStock(TransferOrderHasMaterielBean transerMaterinOrout){
		 	StockBean instock=new StockBean();
		 	instock.setMaterielCode(transerMaterinOrout.getMaterielCode());
		 	instock.setCargoSpaceCode(transerMaterinOrout.getNewcargoSpaceCode());
		 	instock.setStockAmount(String.valueOf(transerMaterinOrout.getMoveAmount()));
		 	instock.setStockPrice(Double.valueOf(transerMaterinOrout.getStockPrice()));
			return instock;
	 }
}
