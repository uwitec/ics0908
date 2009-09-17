package com.manage.storage;

import java.sql.SQLException;
import java.util.List;

import com.dbserver.DBServer;
import com.mydomain.bean.baseset.StorehouseBean;

public class StorehouseManage {

	@SuppressWarnings("unchecked")
	public List<StorehouseBean> findStorehouse() throws SQLException{
		return (List<StorehouseBean>) DBServer.quider.queryForList("seletAllStorehouse");
	}
}
