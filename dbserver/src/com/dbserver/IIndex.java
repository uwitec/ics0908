package com.dbserver;

import java.util.List;
import java.util.Set;

public interface IIndex {
	
	/**
	 * 添加一个对象到默认索引库。
	 * 
	 * @param obj
	 *            要添加到索引库的对象。
	 * @param indexKeys
	 *            需要索引的字段，可以是零个或多个。
	 * @return 添加成功返回添加的对象，失败返回空。
	 */
	public Object add(Object obj, String... indexKeys);

	/**
	 * 删除一个索引。
	 * 
	 * @param obj
	 *            要从索引中删除的对象或关键字（键值）。
	 * @return 返回删除的索引个数。
	 */
	public int delete(Object obj);

	/**
	 * 添加一个对象集合到索引库。
	 * 
	 * @param objSet
	 *            对象集合。
	 * @param indexKeys
	 *            需要索引的字段。
	 * @return 返回添加到索引库的对象个数。
	 */
	public int add(Set<?> objSet, String... indexKeys);

	/**
	 * 返回复合查询关键词条件的第一条索引。
	 * 
	 * @param keys
	 *            要搜索的关键词，可以是一个或多个。
	 * @return 返回第一个复合条件的索引对象。如果没有则返回空。
	 */
	public Object searchObj(String... keys);

	/**
	 * 查询默认索引库，查找所有复合条件的索引对象。
	 * 
	 * @param keys
	 *            搜索关键词
	 * @return 返回所有复合条件的索引对象。没有则返回空。
	 */
	public List<?> search(String... keys);

}
