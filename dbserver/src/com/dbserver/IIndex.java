package com.dbserver;

import java.util.List;
import java.util.Set;

public interface IIndex {
	
	/**
	 * ���һ������Ĭ�������⡣
	 * 
	 * @param obj
	 *            Ҫ��ӵ�������Ķ���
	 * @param indexKeys
	 *            ��Ҫ�������ֶΣ����������������
	 * @return ��ӳɹ�������ӵĶ���ʧ�ܷ��ؿա�
	 */
	public Object add(Object obj, String... indexKeys);

	/**
	 * ɾ��һ��������
	 * 
	 * @param obj
	 *            Ҫ��������ɾ���Ķ����ؼ��֣���ֵ����
	 * @return ����ɾ��������������
	 */
	public int delete(Object obj);

	/**
	 * ���һ�����󼯺ϵ������⡣
	 * 
	 * @param objSet
	 *            ���󼯺ϡ�
	 * @param indexKeys
	 *            ��Ҫ�������ֶΡ�
	 * @return ������ӵ�������Ķ��������
	 */
	public int add(Set<?> objSet, String... indexKeys);

	/**
	 * ���ظ��ϲ�ѯ�ؼ��������ĵ�һ��������
	 * 
	 * @param keys
	 *            Ҫ�����Ĺؼ��ʣ�������һ��������
	 * @return ���ص�һ�����������������������û���򷵻ؿա�
	 */
	public Object searchObj(String... keys);

	/**
	 * ��ѯĬ�������⣬�������и�����������������
	 * 
	 * @param keys
	 *            �����ؼ���
	 * @return �������и�����������������û���򷵻ؿա�
	 */
	public List<?> search(String... keys);

}
