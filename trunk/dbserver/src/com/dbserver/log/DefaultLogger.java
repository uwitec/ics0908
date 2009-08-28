package com.dbserver.log;

import com.dbserver.ILogger;

public class DefaultLogger implements ILogger {

	/*
	 * (non-Javadoc)
	 * 
	 * @see com.dbserver.ILogger#debug(java.lang.String)
	 */
	public void debug(String debug) {
		System.out.println(debug);
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see com.dbserver.ILogger#error(java.lang.String)
	 */
	public void error(String error) {
		System.out.println(error);
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see com.dbserver.ILogger#exception(java.lang.Exception)
	 */
	public void exception(Exception e) {
		e.printStackTrace();
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see com.dbserver.ILogger#info(java.lang.String)
	 */
	public void info(String info) {
		System.out.println(info);
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see com.dbserver.ILogger#warm(java.lang.String)
	 */
	public void warm(String warm) {
		System.out.println(warm);
	}

}
