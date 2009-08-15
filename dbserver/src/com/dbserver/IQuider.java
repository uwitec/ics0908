package com.dbserver;

import java.sql.SQLException;
import java.util.List;

public interface IQuider {

	/**
	 * <p>
	 * 执行一个映射的SQL SELECT语句，用返回的结果数据来填充一个结果对象集合。
	 * </p>
	 * 这是一个重载方法，参数是必需的。
	 * 
	 * @param methodName
	 *            　要执行SQL语句的名称，该名称必需在XML配置文件中有对应名称。
	 * @return 返回装有所有结果对象的一个List对象。
	 * @throws SQLException
	 *             　如果出现SQL错误，则抛出异常。
	 */
	public List<?> queryForList(String methodName) throws SQLException;

	/**
	 * <p>
	 * 执行一个映射的SQL SELECT语句，返回结果数据，用给定范围的结果集来填充一个结果对象集合。
	 * </p>
	 * 这是一个重载方法，参数是必需的。
	 * 
	 * @param methodName
	 *            要执行SQL语句的名称，该名称必需在XML配置文件中有对应名称。
	 * @param skip
	 *            需要忽略不计的结果数（起始号）
	 * @param max
	 *            需要返回的最大结果数（结果集个数）
	 * @return 返回装有所有结果对象的一个List对象
	 * @throws SQLException
	 *             如果出现SQL错误，则抛出异常。
	 */
	public List<?> queryForList(String methodName, int skip, int max)
			throws SQLException;

	/**
	 * <p>
	 * 执行一个映射的SQL SELECT语句，返回结果数据，用给定范围的结果集来填充一个结果对象集合。
	 * </p>
	 *<p>
	 * 参数对象是用来拼接SELECT语句中WHERE后的条件语句。
	 * </p>
	 * 这是一个重载方法，参数是必需的。
	 * 
	 * @param methodName
	 *            要执行SQL语句的名称，该名称必需在XML配置文件中有对应名称。
	 * @param parameterBean
	 *            参数对象(e.g. JavaBean, Map, XML etc.)。
	 * @param skip
	 *            需要忽略不计的结果数（起始号）
	 * @param max
	 *            需要返回的最大结果数（结果集个数）
	 * @return 返回装有所有结果对象的一个List对象
	 * @throws SQLException
	 *             如果出现SQL错误，则抛出异常。
	 */
	public List<?> queryForList(String methodName, Object parameterBean,
			int skip, int max) throws SQLException;

	/**
	 * <p>
	 * 执行一个映射的SQL SELECT语句，返回结果数据，用给定范围的结果集来填充一个结果对象集合。
	 * </p>
	 * <p>
	 * 这是一个重载方法，参数是必需的。在用此方法时，不用传XML文件里对应的方法名， 该方法会根据参数c来确定要查询的对象类型，
	 * 自动去XML文件中寻找对应的方法名。因此使用此方法时，
	 * 在XML文件中必需有"selectAllXXX"型式的方法申明，其中XXX即参数c的类型名。 如selectAllPerson
	 * </p>
	 * 
	 * @param methodName
	 *            要执行SQL语句的名称，该名称必需在XML配置文件中有对应名称。
	 * @param skip
	 *            需要忽略不计的结果数（起始号）
	 * @param max
	 *            需要返回的最大结果数（结果集个数）
	 * @param c
	 *            要查询对象的类型。
	 * @return 返回装有所有结果对象的一个List对象
	 * @throws SQLException
	 *             如果出现SQL错误，则抛出异常。
	 */
	public List<?> queryForList(int skip, int max, Class<?> c)
			throws SQLException;

	/**
	 * <p>
	 * 执行一个映射的SQL SELECT语句，返回结果数据，用给定范围的结果集来填充一个结果对象集合。
	 * </p>
	 * <p>
	 * 参数对象是用来拼接SELECT语句中WHERE后的条件语句。
	 * </p>
	 * <p>
	 * 这是一个重载方法，参数是必需的。在用此方法时，不用传XML文件里对应的方法名，该方法会根据参数c来确定要查询的对象类型，
	 * 自动去XML文件中寻找对应的方法名。因此使用此方法时，
	 * 在XML文件中必需有"selectAllXXX"型式的方法申明，其中XXX即参数"c"的类型名。如"selectAllPerson"
	 * </p>
	 * 
	 * @param parameterBean
	 *            参数对象(e.g. JavaBean, Map, XML etc.)。
	 * @param skip
	 *            需要忽略不计的结果数（起始号）
	 * @param max
	 *            需要返回的最大结果数（结果集个数）
	 * @param c
	 *            要查询对象的类型。
	 * @return 返回装有所有结果对象的一个List对象
	 * @throws SQLException
	 *             如果出现SQL错误，则抛出异常。
	 */
	public List<?> queryForList(Object parameterBean, int skip, int max,
			Class<?> c) throws SQLException;

	/**
	 * <p>
	 * 执行一个映射的SQL SELECT语句，用返回的结果数据来填充一个结果对象集合。
	 * </p>
	 * <p>
	 * 这是一个重载方法，参数是必需的。在用此方法时，不用传XML文件里对应的方法名，该方法会根据参数c来确定要查询的对象类型，
	 * 自动去XML文件中寻找对应的方法名。因此使用此方法时，
	 * 在XML文件中必需有"selectAllXXX"型式的方法申明，其中XXX即参数c的类型名。如selectAllPerson
	 * </p>
	 * 
	 * @param c
	 *            要查询的对象类型
	 * @return 返回装有所有结果对象的一个List对象。
	 * @throws SQLException
	 *             如果出现SQL错误，则抛出异常。
	 */
	public List<?> queryForList(Class<?> c) throws SQLException;

	/**
	 * <p>
	 * 执行一个映射的SQL SELECT语句，用返回的结果数据来填充一个结果对象集合。
	 * </p>
	 * <p>
	 * 参数对象是用来拼接SELECT语句中WHERE后的条件语句。
	 * </p>
	 * <p>
	 * 这是一个重载方法，参数是必需的。在用此方法时，不用传XML文件里对应的方法名，该方法会根据参数c来确定要查询的对象类型，
	 * 自动去XML文件中寻找对应的方法名。因此使用此方法时，
	 * 在XML文件中必需有"selectAllXXX"型式的方法申明，其中XXX即参数c的类型名。如selectAllPerson
	 * </p>
	 * 
	 * @param parameterBean
	 *            条件对象(e.g. JavaBean, Map, XML etc.)，用来与SQL配置文件中的条件相对应。
	 * @param c
	 *            要查询的对象类型
	 * @return 返回封装好的结果集
	 * @throws SQLException
	 */
	public List<?> queryForList(Object parameterBean, Class<?> c)
			throws SQLException;

	/**
	 * <p>
	 * 执行一个映射的SQL SELECT语句，用返回的结果数据来填充一个结果对象集合。
	 * </p>
	 * <p>
	 * 参数对象是用来拼接SELECT语句中WHERE后的条件语句。
	 * </p>
	 * 
	 * @param methodName
	 *            要执行SQL语句的名称，该名称必需在XML配置文件中有对应名称。
	 * @param parameterBean
	 *            条件对象(e.g. JavaBean, Map, XML etc.)，用来与SQL配置文件中的条件相对应。
	 * @return 返回封装好的结果集
	 * @throws SQLException
	 */
	public List<?> queryForList(String methodName, Object parameterBean)
			throws SQLException;

	/**
	 * 根据主键来查询对象
	 * 
	 * @param id
	 *            主键对象
	 * @param c
	 *            要查询对象的类型
	 * @return 返回符合条件的唯一对象，如果没有则返回NULL。
	 * @throws SQLException
	 */
	public Object queryForObjectById(Object id, Class<?> c) throws SQLException;

	/**
	 * 用自定义方法查询对象
	 * 
	 * @param methodName
	 *            自定义方法名
	 * @param parameterBean
	 *            参数对象
	 * @return 返回符合条件的唯一对象，如果没有则返回NULL。
	 * @throws SQLException
	 */
	public Object queryForObject(String methodName, Object parameterBean)
			throws SQLException;

	/**
	 * 插入一个对象
	 * 
	 * @param bean
	 *            要插入的对象
	 * @return 返回用户自定义的返回类型。
	 * @throws SQLException
	 */
	public Object insertObject(Object bean) throws SQLException;

	/**
	 * 用自定义方法插入一个对象
	 * 
	 * @param methodName
	 *            自定义方法名
	 * @param parameterBean
	 *            参数对象也是要插入的对象
	 * @return 返回用户自定义的返回类型。
	 * @throws SQLException
	 */
	public Object insertObject(String methodName, Object parameterBean)
			throws SQLException;

	/**
	 * 删除一个对象
	 * 
	 * @param bean
	 *            要删除的对象
	 * @return 返回用户自定义的返回类型。
	 * @throws SQLException
	 */
	public int deleteObject(Object bean) throws SQLException;

	/**
	 * 用自定义方法删除对象
	 * 
	 * @param methodName
	 *            自定义方法名
	 * @param parameterBean
	 *            参数对象也是要删除的对象
	 * @return 返回用户自定义的返回类型。
	 * @throws SQLException
	 */
	public int deleteObject(String methodName, Object parameterBean)
			throws SQLException;

	/**
	 * 更新对象
	 * 
	 * @param bean
	 *            要更新的对象
	 * @return 返回用户自定义的返回类型。
	 * @throws SQLException
	 */
	public int updateObject(Object bean) throws SQLException;

	/**
	 * 用自定义方法更新一个对象
	 * 
	 * @param methodName
	 *            自定义方法名
	 * @param parameterBean
	 *            参数对象也是要更新的对象
	 * @return 返回用户自定义的返回类型。
	 * @throws SQLException
	 */
	public int updateObject(String methodName, Object parameterBean)
			throws SQLException;

	/**
	 * 确定一个事务的开始边界，开始一个事务，事务必需是可以有效提交或回滚的。参照下面的代码：
	 * 
	 * <pre>
	 * try {
	 * 	sqlMap.startTransaction();
	 * 	// do work
	 * 	sqlMap.commitTransaction();
	 * } finally {
	 * 	sqlMap.endTransaction();
	 * }
	 * </pre>
	 * 
	 * endTransaction()方法总应该有一个startTransaction()和他对应。
	 * 
	 * @throws SQLException
	 *             事务无法开启时或开始事务过程中发生错误抛出此异常。
	 */
	public void startTransaction() throws SQLException;

	/**
	 * 提交当前已开始的事务
	 * 
	 * @throws SQLException
	 *             如果在提交事务时发错误或是事务无法提交时抛出此异常。
	 */
	public void commitTransaction() throws SQLException;

	/**
	 * 强制结束或回滚事务，如果一个事务开始了但没有结束，系统会回滚endTransaction()方法之前调用的语句。
	 * 
	 * @throws SQLException
	 *             在回滚或不能结束事务里掏出此异常。
	 */
	public void endTransaction() throws SQLException;

	/**
	 * 开始一个批处理，在有多个非查询（insert/update/delete）的语句，SQL MAP将缓存这些更新数据的语句，然通过对JDBC
	 * Driver进行优化（例如压缩）后一次性发送到数据库执行。
	 * 
	 * @throws SQLException
	 *             如果批处理无法开始抛出此异常。
	 */
	public void startBatch() throws SQLException;

	/**
	 * 执行当前批处理中所有的语句
	 * 
	 * @return 批处理语句更新数据（包括添加、删除、更新的数据）的行数。
	 * @throws SQLException
	 *             如果批处理不能执行或语句有错误将抛出此异常。
	 */
	public int executeBatch() throws SQLException;

}
