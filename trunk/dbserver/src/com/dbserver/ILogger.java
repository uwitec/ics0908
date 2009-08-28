package com.dbserver;

public interface ILogger {

	/**
	 * 记录日志信息
	 * 
	 * @param info
	 *            日志信息
	 */
	public void info(String info);

	/**
	 * 调试信息
	 * 
	 * @param debug
	 */
	public void debug(String debug);

	/**
	 * 错误信息
	 * 
	 * @param error
	 */
	public void error(String error);

	/**
	 * 警告信息
	 * 
	 * @param warm
	 */
	public void warm(String warm);

	/**
	 * 记录程序异常
	 * 
	 * @param e
	 */
	public void exception(Exception e);
}
