package com.dbserver;

public interface ILogger {

	/**
	 * ��¼��־��Ϣ
	 * 
	 * @param info
	 *            ��־��Ϣ
	 */
	public void info(String info);

	/**
	 * ������Ϣ
	 * 
	 * @param debug
	 */
	public void debug(String debug);

	/**
	 * ������Ϣ
	 * 
	 * @param error
	 */
	public void error(String error);

	/**
	 * ������Ϣ
	 * 
	 * @param warm
	 */
	public void warm(String warm);

	/**
	 * ��¼�����쳣
	 * 
	 * @param e
	 */
	public void exception(Exception e);
}
