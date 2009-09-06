package com.manage.storage;

import java.sql.SQLException;
import java.util.List;

import com.dbserver.DBServer;
import com.mydomain.bean.baseset.SupplierBean;

public class SupplierManange {

	@SuppressWarnings("unchecked")
	public List<SupplierBean> getSupliers() throws SQLException{
		return (List<SupplierBean>) DBServer.quider.queryForList("selectAllSupplier");
	}
}
