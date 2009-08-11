package com.dbserver;

import java.sql.SQLException;
import java.util.List;

public interface IQuider {

	/**
	 * <p>
	 * ִ��һ��ӳ���SQL SELECT��䣬�÷��صĽ�����������һ��������󼯺ϡ�
	 * </p>
	 * ����һ�����ط����������Ǳ���ġ�
	 * 
	 * @param methodName
	 *            ��Ҫִ��SQL�������ƣ������Ʊ�����XML�����ļ����ж�Ӧ���ơ�
	 * @return ����װ�����н�������һ��List����
	 * @throws SQLException
	 *             ���������SQL�������׳��쳣��
	 */
	public List<?> queryForList(String methodName) throws SQLException;

	/**
	 * <p>
	 * ִ��һ��ӳ���SQL SELECT��䣬���ؽ�����ݣ��ø�����Χ�Ľ���������һ��������󼯺ϡ�
	 * </p>
	 * ����һ�����ط����������Ǳ���ġ�
	 * 
	 * @param methodName
	 *            Ҫִ��SQL�������ƣ������Ʊ�����XML�����ļ����ж�Ӧ���ơ�
	 * @param skip
	 *            ��Ҫ���Բ��ƵĽ��������ʼ�ţ�
	 * @param max
	 *            ��Ҫ���ص���������������������
	 * @return ����װ�����н�������һ��List����
	 * @throws SQLException
	 *             �������SQL�������׳��쳣��
	 */
	public List<?> queryForList(String methodName, int skip, int max)
			throws SQLException;

	/**
	 * <p>
	 * ִ��һ��ӳ���SQL SELECT��䣬���ؽ�����ݣ��ø�����Χ�Ľ���������һ��������󼯺ϡ�
	 * </p>
	 *<p>
	 * ��������������ƴ��SELECT�����WHERE���������䡣
	 * </p>
	 * ����һ�����ط����������Ǳ���ġ�
	 * 
	 * @param methodName
	 *            Ҫִ��SQL�������ƣ������Ʊ�����XML�����ļ����ж�Ӧ���ơ�
	 * @param parameterBean
	 *            ��������(e.g. JavaBean, Map, XML etc.)��
	 * @param skip
	 *            ��Ҫ���Բ��ƵĽ��������ʼ�ţ�
	 * @param max
	 *            ��Ҫ���ص���������������������
	 * @return ����װ�����н�������һ��List����
	 * @throws SQLException
	 *             �������SQL�������׳��쳣��
	 */
	public List<?> queryForList(String methodName, Object parameterBean,
			int skip, int max) throws SQLException;

	/**
	 * <p>
	 * ִ��һ��ӳ���SQL SELECT��䣬���ؽ�����ݣ��ø�����Χ�Ľ���������һ��������󼯺ϡ�
	 * </p>
	 * <p>
	 * ����һ�����ط����������Ǳ���ġ����ô˷���ʱ�����ô�XML�ļ����Ӧ�ķ������� �÷�������ݲ���c��ȷ��Ҫ��ѯ�Ķ������ͣ�
	 * �Զ�ȥXML�ļ���Ѱ�Ҷ�Ӧ�ķ����������ʹ�ô˷���ʱ��
	 * ��XML�ļ��б�����"selectAllXXX"��ʽ�ķ�������������XXX������c���������� ��selectAllPerson
	 * </p>
	 * 
	 * @param methodName
	 *            Ҫִ��SQL�������ƣ������Ʊ�����XML�����ļ����ж�Ӧ���ơ�
	 * @param skip
	 *            ��Ҫ���Բ��ƵĽ��������ʼ�ţ�
	 * @param max
	 *            ��Ҫ���ص���������������������
	 * @param c
	 *            Ҫ��ѯ��������͡�
	 * @return ����װ�����н�������һ��List����
	 * @throws SQLException
	 *             �������SQL�������׳��쳣��
	 */
	public List<?> queryForList(int skip, int max, Class<?> c)
			throws SQLException;

	/**
	 * <p>
	 * ִ��һ��ӳ���SQL SELECT��䣬���ؽ�����ݣ��ø�����Χ�Ľ���������һ��������󼯺ϡ�
	 * </p>
	 * <p>
	 * ��������������ƴ��SELECT�����WHERE���������䡣
	 * </p>
	 * <p>
	 * ����һ�����ط����������Ǳ���ġ����ô˷���ʱ�����ô�XML�ļ����Ӧ�ķ��������÷�������ݲ���c��ȷ��Ҫ��ѯ�Ķ������ͣ�
	 * �Զ�ȥXML�ļ���Ѱ�Ҷ�Ӧ�ķ����������ʹ�ô˷���ʱ��
	 * ��XML�ļ��б�����"selectAllXXX"��ʽ�ķ�������������XXX������"c"������������"selectAllPerson"
	 * </p>
	 * 
	 * @param parameterBean
	 *            ��������(e.g. JavaBean, Map, XML etc.)��
	 * @param skip
	 *            ��Ҫ���Բ��ƵĽ��������ʼ�ţ�
	 * @param max
	 *            ��Ҫ���ص���������������������
	 * @param c
	 *            Ҫ��ѯ��������͡�
	 * @return ����װ�����н�������һ��List����
	 * @throws SQLException
	 *             �������SQL�������׳��쳣��
	 */
	public List<?> queryForList(Object parameterBean, int skip, int max,
			Class<?> c) throws SQLException;

	/**
	 * <p>
	 * ִ��һ��ӳ���SQL SELECT��䣬�÷��صĽ�����������һ��������󼯺ϡ�
	 * </p>
	 * <p>
	 * ����һ�����ط����������Ǳ���ġ����ô˷���ʱ�����ô�XML�ļ����Ӧ�ķ��������÷�������ݲ���c��ȷ��Ҫ��ѯ�Ķ������ͣ�
	 * �Զ�ȥXML�ļ���Ѱ�Ҷ�Ӧ�ķ����������ʹ�ô˷���ʱ��
	 * ��XML�ļ��б�����"selectAllXXX"��ʽ�ķ�������������XXX������c������������selectAllPerson
	 * </p>
	 * 
	 * @param c
	 *            Ҫ��ѯ�Ķ�������
	 * @return ����װ�����н�������һ��List����
	 * @throws SQLException
	 *             �������SQL�������׳��쳣��
	 */
	public List<?> queryForList(Class<?> c) throws SQLException;

	/**
	 * <p>
	 * ִ��һ��ӳ���SQL SELECT��䣬�÷��صĽ�����������һ��������󼯺ϡ�
	 * </p>
	 * <p>
	 * ��������������ƴ��SELECT�����WHERE���������䡣
	 * </p>
	 * <p>
	 * ����һ�����ط����������Ǳ���ġ����ô˷���ʱ�����ô�XML�ļ����Ӧ�ķ��������÷�������ݲ���c��ȷ��Ҫ��ѯ�Ķ������ͣ�
	 * �Զ�ȥXML�ļ���Ѱ�Ҷ�Ӧ�ķ����������ʹ�ô˷���ʱ��
	 * ��XML�ļ��б�����"selectAllXXX"��ʽ�ķ�������������XXX������c������������selectAllPerson
	 * </p>
	 * 
	 * @param parameterBean
	 *            ��������(e.g. JavaBean, Map, XML etc.)��������SQL�����ļ��е��������Ӧ��
	 * @param c
	 *            Ҫ��ѯ�Ķ�������
	 * @return ���ط�װ�õĽ����
	 * @throws SQLException
	 */
	public List<?> queryForList(Object parameterBean, Class<?> c)
			throws SQLException;

	/**
	 * <p>
	 * ִ��һ��ӳ���SQL SELECT��䣬�÷��صĽ�����������һ��������󼯺ϡ�
	 * </p>
	 * <p>
	 * ��������������ƴ��SELECT�����WHERE���������䡣
	 * </p>
	 * 
	 * @param methodName
	 *            Ҫִ��SQL�������ƣ������Ʊ�����XML�����ļ����ж�Ӧ���ơ�
	 * @param parameterBean
	 *            ��������(e.g. JavaBean, Map, XML etc.)��������SQL�����ļ��е��������Ӧ��
	 * @return ���ط�װ�õĽ����
	 * @throws SQLException
	 */
	public List<?> queryForList(String methodName, Object parameterBean)
			throws SQLException;

	/**
	 * ������������ѯ����
	 * 
	 * @param id
	 *            ��������
	 * @param c
	 *            Ҫ��ѯ���������
	 * @return ���ط���������Ψһ�������û���򷵻�NULL��
	 * @throws SQLException
	 */
	public Object queryForObjectById(Object id, Class<?> c) throws SQLException;

	/**
	 * ���Զ��巽����ѯ����
	 * 
	 * @param methodName
	 *            �Զ��巽����
	 * @param parameterBean
	 *            ��������
	 * @return ���ط���������Ψһ�������û���򷵻�NULL��
	 * @throws SQLException
	 */
	public Object queryForObject(String methodName, Object parameterBean)
			throws SQLException;

	/**
	 * ����һ������
	 * 
	 * @param bean
	 *            Ҫ����Ķ���
	 * @return �����û��Զ���ķ������͡�
	 * @throws SQLException
	 */
	public Object insertObject(Object bean) throws SQLException;

	/**
	 * ���Զ��巽������һ������
	 * 
	 * @param methodName
	 *            �Զ��巽����
	 * @param parameterBean
	 *            ��������Ҳ��Ҫ����Ķ���
	 * @return �����û��Զ���ķ������͡�
	 * @throws SQLException
	 */
	public Object insertObject(String methodName, Object parameterBean)
			throws SQLException;

	/**
	 * ɾ��һ������
	 * 
	 * @param bean
	 *            Ҫɾ���Ķ���
	 * @return �����û��Զ���ķ������͡�
	 * @throws SQLException
	 */
	public int deleteObject(Object bean) throws SQLException;

	/**
	 * ���Զ��巽��ɾ������
	 * 
	 * @param methodName
	 *            �Զ��巽����
	 * @param parameterBean
	 *            ��������Ҳ��Ҫɾ���Ķ���
	 * @return �����û��Զ���ķ������͡�
	 * @throws SQLException
	 */
	public int deleteObject(String methodName, Object parameterBean)
			throws SQLException;

	/**
	 * ���¶���
	 * 
	 * @param bean
	 *            Ҫ���µĶ���
	 * @return �����û��Զ���ķ������͡�
	 * @throws SQLException
	 */
	public int updateObject(Object bean) throws SQLException;

	/**
	 * ���Զ��巽������һ������
	 * 
	 * @param methodName
	 *            �Զ��巽����
	 * @param parameterBean
	 *            ��������Ҳ��Ҫ���µĶ���
	 * @return �����û��Զ���ķ������͡�
	 * @throws SQLException
	 */
	public int updateObject(String methodName, Object parameterBean)
			throws SQLException;

	/**
	 * ȷ��һ������Ŀ�ʼ�߽磬��ʼһ��������������ǿ�����Ч�ύ��ع��ġ���������Ĵ��룺
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
	 * endTransaction()������Ӧ����һ��startTransaction()������Ӧ��
	 * 
	 * @throws SQLException
	 *             �����޷�����ʱ��ʼ��������з��������׳����쳣��
	 */
	public void startTransaction() throws SQLException;

	/**
	 * �ύ��ǰ�ѿ�ʼ������
	 * 
	 * @throws SQLException
	 *             ������ύ����ʱ��������������޷��ύʱ�׳����쳣��
	 */
	public void commitTransaction() throws SQLException;

	/**
	 * ǿ�ƽ�����ع��������һ������ʼ�˵�û�н�����ϵͳ��ع�endTransaction()����֮ǰ���õ���䡣
	 * 
	 * @throws SQLException
	 *             �ڻع����ܽ����������ͳ����쳣��
	 */
	public void endTransaction() throws SQLException;

	/**
	 * ��ʼһ�����������ж���ǲ�ѯ��insert/update/delete������䣬SQL MAP��������Щ�������ݵ���䣬Ȼͨ����JDBC
	 * Driver�����Ż�������ѹ������һ���Է��͵����ݿ�ִ�С�
	 * 
	 * @throws SQLException
	 *             ����������޷���ʼ�׳����쳣��
	 */
	public void startBatch() throws SQLException;

	/**
	 * ִ�е�ǰ�����������е����
	 * 
	 * @return ���������������ݣ�������ӡ�ɾ�������µ����ݣ���������
	 * @throws SQLException
	 *             �����������ִ�л�����д����׳����쳣��
	 */
	public int executeBatch() throws SQLException;

}
