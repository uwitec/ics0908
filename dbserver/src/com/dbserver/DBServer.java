package com.dbserver;

import com.dbserver.ibatis.IbatisQuider;

public class DBServer {
	/**
	 * �ṩ���ݿ���ɾ�Ĳ鷽���Ľӿ�
	 */
	public static IQuider quider = new IbatisQuider();

	/**
	 * �ṩ��������ɾ�Ĳ鷽���Ľӿ�
	 */
	public static IIndex index = null;

	/**
	 * �ṩ��־����ɾ�Ĳ鷽���Ľӿ�
	 */
	public static ILogger logger = null;
}
