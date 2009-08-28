package com.dbserver;

import com.dbserver.ibatis.IbatisQuider;
import com.dbserver.indexserver.DefaultIndexServer;
import com.dbserver.log.DefaultLogger;

public class DBServer {
	/**
	 * 提供数据库增删改查方法的接口
	 */
	public static IQuider quider = new IbatisQuider();

	/**
	 * 提供日志库增删改查方法的接口
	 */
	public static ILogger logger = new DefaultLogger();

	/**
	 * 返回一个提供索引库增删查方法的索引服务实例。
	 * 
	 * @param name
	 *            索引库名称
	 * @return
	 */
	public static IIndex getIndexServer(String name) {
		return new DefaultIndexServer(name);
	}
}
