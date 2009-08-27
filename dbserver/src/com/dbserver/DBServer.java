package com.dbserver;

import com.dbserver.ibatis.IbatisQuider;

public class DBServer {
	/**
	 * 提供数据库增删改查方法的接口
	 */
	public static IQuider quider = new IbatisQuider();

	/**
	 * 提供索引库增删改查方法的接口
	 */
	public static IIndex index = null;

	/**
	 * 提供日志库增删改查方法的接口
	 */
	public static ILogger logger = null;
}
