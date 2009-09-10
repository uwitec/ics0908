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
		</s:url> <s:a href="%{ABCReport}">ABC报表</s:a></th>
		<th>超储报表</th>
		<th>周转率报表</th>
		<th>物料价值资产表</th>
		<th>损耗物料资产表</th>
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

			<s:select name="abcReportBean.materielType" label="物品类型" 
				list="abcTypeList" listKey="value"
				listValue="name" onchange="javascript:abcFrom.submit()"></s:select>
		</s:form></td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
	</tr>
	<tr>
		<td>单位名称:XXXXXX</td>
		<td>统计时间:2009年9月8日</td>
		<td>单位:元</td>
	</tr>
</table>



</div>
<div style="border: 1px solid gray;"><s:if
	test="abcReportList!=null">
	<table border="1" cellpadding="0" cellspacing="0" width="800px">
		<tr>
			<th colspan="2" rowspan="2">项目</th>
			<th colspan="2">&nbsp;</th>
			<th colspan="3">上期库存</th>
			<th colspan="3">当期库存</th>
			<th colspan="3">本期入库</th>
			<th colspan="3">本期出库</th>
			<th rowspan="2">备注</th>
		</tr>
		<tr>
			<th>规格型号</th>
			<th>单位</th>

			<th>单价</th>
			<th>数量</th>
			<th>金额</th>

			<th>单价</th>
			<th>数量</th>
			<th>金额</th>

			<th>单价</th>
			<th>数量</th>
			<th>金额</th>

			<th>单价</th>
			<th>数量</th>
			<th>金额</th>

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