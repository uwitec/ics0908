<%@ page language="java" contentType="text/html; charset=GBK"
	pageEncoding="GBK"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<title>Insert title here</title>
<SCRIPT type="text/javascript">

</SCRIPT>
</head>
<body>
<table border="1" cellpadding="2" cellspacing="2">
	<tr>
		<th><s:url id="ABCReport" action="ABCReportAction">
			<s:param name="abcReportBean.csCode" value="%{abcReportBean.csCode}"></s:param>
			<s:param name="abcReportBean.oldCsCode"
				value="%{abcReportBean.oldCsCode}"></s:param>
			<s:param name="abcReportBean.beginDate"
				value="%{abcReportBean.beginDate}"></s:param>
			<s:param name="abcReportBean.endDate"
				value="%{abcReportBean.endDate}"></s:param>
		</s:url> <s:a href="%{ABCReport}">ABC����</s:a></th>
		<th>��������</th>
		<th>��ת�ʱ���</th>
		<th>���ϼ�ֵ�ʲ���</th>
		<th>��������ʲ���</th>
	</tr>
</table>
<div style="border: 1px solid gray;">
<table border="0" width="800px">
	<tr>
		<td><s:form name="abcFrom" action="ABCReportAction" method="post">
			<s:hidden name="abcReportBean.csCode" value="%{abcReportBean.csCode}"></s:hidden>
			<s:hidden name="abcReportBean.oldCsCode"
				value="%{abcReportBean.oldCsCode}"></s:hidden>
			<s:hidden name="abcReportBean.beginDate"
				value="%{abcReportBean.beginDate}"></s:hidden>
			<s:hidden name="abcReportBean.endDate"
				value="%{abcReportBean.endDate}"></s:hidden>

			<s:select name="abcReportBean.materielType" label="��Ʒ����" 
				list="abcTypeList" listKey="value"
				listValue="name" onchange="javascript:abcFrom.submit()"></s:select>
		</s:form></td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
	</tr>
	<tr>
		<td>��λ����:XXXXXX</td>
		<td>ͳ��ʱ��:2009��9��8��</td>
		<td>��λ:Ԫ</td>
	</tr>
</table>



</div>
<div style="border: 1px solid gray;"><s:if
	test="abcReportList!=null">
	<table border="1" cellpadding="0" cellspacing="0" width="800px">
		<tr>
			<th colspan="2" rowspan="2">��Ŀ</th>
			<th colspan="2">&nbsp;</th>
			<th colspan="3">���ڿ��</th>
			<th colspan="3">���ڿ��</th>
			<th colspan="3">�������</th>
			<th colspan="3">���ڳ���</th>
			<th rowspan="2">��ע</th>
		</tr>
		<tr>
			<th>����ͺ�</th>
			<th>��λ</th>

			<th>����</th>
			<th>����</th>
			<th>���</th>

			<th>����</th>
			<th>����</th>
			<th>���</th>

			<th>����</th>
			<th>����</th>
			<th>���</th>

			<th>����</th>
			<th>����</th>
			<th>���</th>

		</tr>
		<s:iterator value="abcReportList" status="stat">
			<tr>
				<td><s:property value="materielType" /></td>
				<td><s:property value="name" /></td>
				<td><s:property value="specification" /></td>
				<td><s:property value="unit" /></td>
				<td><s:property value="lastAmount" /></td>
				<td><s:property value="lastPrice" /></td>
				<td><s:property value="lastTotalPrice" /></td>
				<td><s:property value="amount" /></td>
				<td><s:property value="price" /></td>
				<td><s:property value="totalPrice" /></td>
				<td><s:property value="inAmount" /></td>
				<td><s:property value="inPrice" /></td>
				<td><s:property value="inTotalPrice" /></td>
				<td><s:property value="outAmount" /></td>
				<td><s:property value="outPrice" /></td>
				<td><s:property value="outTotalPrice" /></td>
				<td><s:property value="remark" /></td>
			</tr>
		</s:iterator>
	</table>
</s:if></div>

<s:debug></s:debug>
</body>
</html>