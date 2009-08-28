package com.dbserver.indexserver;

import java.util.List;
import java.util.Set;

import com.dbserver.IIndex;

public class DefaultIndexServer implements IIndex {

	public DefaultIndexServer(String name) {

	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see com.dbserver.IIndex#add(java.lang.Object, java.lang.String[])
	 */
	public Object add(Object obj, String... indexKeys) {
		return null;
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see com.dbserver.IIndex#add(java.util.Set, java.lang.String[])
	 */
	public int add(Set<?> objSet, String... indexKeys) {
		return 0;
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see com.dbserver.IIndex#delete(java.lang.Object)
	 */
	public int delete(Object obj) {
		return 0;
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see com.dbserver.IIndex#search(java.lang.String[])
	 */
	public List<?> search(String... keys) {
		return null;
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see com.dbserver.IIndex#searchObj(java.lang.String[])
	 */
	public Object searchObj(String... keys) {
		return null;
	}

}
