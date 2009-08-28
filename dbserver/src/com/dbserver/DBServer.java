package com.dbserver;

import com.dbserver.ibatis.IbatisQuider;
import com.dbserver.indexserver.DefaultIndexServer;
import com.dbserver.log.DefaultLogger;

public class DBServer {
	/**
	 * �ṩ���ݿ���ɾ�Ĳ鷽���Ľӿ�
	 */
	public static IQuider quider = new IbatisQuider();

	/**
	 * �ṩ��־����ɾ�Ĳ鷽���Ľӿ�
	 */
	public static ILogger logger = new DefaultLogger();

	/**
	 * ����һ���ṩ��������ɾ�鷽������������ʵ����
	 * 
	 * @param name
	 *            ����������
	 * @return
	 */
	public static IIndex getIndexServer(String name) {
		return new DefaultIndexServer(name);
	}
}
