package com.dbserver.ibatis;

import java.io.IOException;
import java.io.Reader;
import java.sql.SQLException;
import java.util.List;

import com.dbserver.IQuider;
import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;

public class IbatisQuider implements IQuider {

	private static SqlMapClient sqlMapper;

	static {
		try {
			Reader reader = Resources
					.getResourceAsReader("ibatisconf/SqlMapConfig.xml");
			sqlMapper = SqlMapClientBuilder.buildSqlMapClient(reader);
			reader.close();
		} catch (IOException e) {
			// Fail fast.
			throw new RuntimeException(
					"Something bad happened while building the SqlMapClient instance."
							+ e, e);
		}
	}

	// delete methods

	public int deleteObject(Object bean) throws SQLException {
		if (null != bean) {
			String methodName = "delete" + bean.getClass().getSimpleName();
			return sqlMapper.delete(methodName, bean);
		}
		return -1;
	}

	public int deleteObject(String methodName, Object parameterBean)
			throws SQLException {
		if (null != parameterBean) {
			return sqlMapper.delete(methodName, parameterBean);
		}
		return -1;
	}

	// insert methods

	public Object insertObject(Object bean) throws SQLException {
		if (null != bean) {
			String methodName = "insert" + bean.getClass().getSimpleName();
			return sqlMapper.insert(methodName, bean);
		}
		return null;
	}

	public Object insertObject(String methodName, Object parameterBean)
			throws SQLException {
		if (null != parameterBean) {
			return sqlMapper.insert(methodName, parameterBean);
		}
		return null;
	}

	// query

	public List<?> queryForList(String methodName) throws SQLException {
		return sqlMapper.queryForList(methodName);
	}

	public List<?> queryForList(String methodName, int skip, int max)
			throws SQLException {
		return sqlMapper.queryForList(methodName, skip, max);
	}

	public List<?> queryForList(String methodName, Object parameterBean,
			int skip, int max) throws SQLException {
		return sqlMapper.queryForList(methodName, parameterBean, skip, max);
	}

	public List<?> queryForList(Class<?> c) throws SQLException {
		if (null != c) {
			String methodName = "selectAll" + c.getSimpleName();

			return sqlMapper.queryForList(methodName);
		}
		return null;
	}

	public List<?> queryForList(int skip, int max, Class<?> c)
			throws SQLException {
		if (null != c) {
			String methodName = "selectAll" + c.getSimpleName();

			return queryForList(methodName, skip, max);
		}
		return null;
	}

	public List<?> queryForList(Object parameterBean, Class<?> c)
			throws SQLException {
		if (null != c) {
			String methodName = "query" + c.getSimpleName();
			return sqlMapper.queryForList(methodName, parameterBean);
		}
		return null;
	}

	public List<?> queryForList(Object parameterBean, int skip, int max,
			Class<?> c) throws SQLException {
		if (null != c) {
			String methodName = "query" + c.getSimpleName();
			return queryForList(methodName, parameterBean, skip, max);
		}
		return null;
	}

	public List<?> queryForList(String methodName, Object parameterBean)
			throws SQLException {
		if (null != parameterBean) {
			return sqlMapper.queryForList(methodName, parameterBean);
		}
		return null;
	}

	public Object queryForObject(String methodName, Object parameterBean)
			throws SQLException {
		if (null != parameterBean) {
			return sqlMapper.queryForObject(methodName);
		}
		return null;
	}

	public Object queryForObjectById(Object id, Class<?> c) throws SQLException {
		if (null != c) {
			String methodName = "get" + c.getSimpleName();
			return sqlMapper.queryForObject(methodName, id);
		}
		return null;
	}

	// update methods

	public int updateObject(Object bean) throws SQLException {
		if (null != bean) {
			String methodName = "update" + bean.getClass().getSimpleName();
			return sqlMapper.update(methodName, bean);
		}
		return -1;
	}

	public int updateObject(String methodName, Object parameterBean)
			throws SQLException {
		if (null != parameterBean && null != methodName) {
			return sqlMapper.update(methodName, parameterBean);
		}
		return -1;
	}
	
	// Transaction
	
	public void startTransaction() throws SQLException{
		sqlMapper.startTransaction();
	}
	
	public void commitTransaction() throws SQLException{
		sqlMapper.commitTransaction();
	}
	
	public void endTransaction() throws SQLException{
		sqlMapper.endTransaction();
	}
	
	public void startBatch() throws SQLException{
		sqlMapper.startBatch();
	}
	
	public int executeBatch() throws SQLException{
		return sqlMapper.executeBatch();
	}

}
