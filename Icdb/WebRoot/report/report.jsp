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
<div style="border: 1px solid gray;">
<s:form name="abcFrom" action="ABCReportAction" method="post">
	<s:select label="请选择报表类型" name="reportType" list="reportTypeList"
		listKey="key" listValue="name" onchange="javascript:abcFrom.submit()"></s:select>
	<s:hidden name="abcReportBean.csCode" value="%{abcReportBean.csCode}"></s:hidden>
	<s:hidden name="abcReportBean.oldCsCode"
		value="%{abcReportBean.oldCsCode}"></s:hidden>
	<s:hidden name="abcReportBean.beginDate"
		value="%{abcReportBean.beginDate}"></s:hidden>
	<s:hidden name="abcReportBean.endDate" value="%{abcReportBean.endDate}"></s:hidden>
	<s:select name="abcReportBean.materielType" label="物品类型"
		list="abcTypeList" listKey="value" listValue="name"
		onchange="javascript:abcFrom.submit()"></s:select>
	<s:if test="'CCREPORT'.equals(reportType)">
		<s:select name="stateType" label="报表类型"
			list="#{2:'全部',0:'正常',-1:'短缺',1:'超存'}" listKey="key"
			listValue="value" onchange="javascript:abcFrom.submit()"></s:select>
	</s:if>
	<table border="0" width="800px">
		<tr>
			<td>单位名称:XXXXXX</td>
			<td>统计时间:<s:property value="%{abcReportBean.endDate}" /> </td>
			<td align="right">单位:元</td>
		</tr>
	</table>
</s:form></div>
<div style="border: 1px solid gray;"><s:if
	test="abcReportList!=null">
	<table border="1" cellpadding="0" cellspacing="0" width="800px">
		<tr>
			<th colspan="2" rowspan="2">项目</th>
			<th rowspan="2">规格型号</th>
			<th rowspan="2">单位</th>
			<s:if test="'CCREPORT'.equals(reportType)">
				<th colspan="2">库存数量基线</th>
				<th colspan="2">实际数量</th>
			</s:if>
			<s:else>
				<s:if test="!'WLJZREPORT'.equals(reportType)">
					<th colspan="3">上期库存</th>
				</s:if>
				<th colspan="3"><s:if test="'WLJZREPORT'.equals(reportType)">库存</s:if><s:else>当期库存</s:else></th>
				<s:if test="!'WLJZREPORT'.equals(reportType)">
					<th colspan="3">本期入库</th>
					<th colspan="3">本期出库</th>
					<s:if test="'ZZREPORT'.equals(reportType)">
						<th rowspan="2">周转率</th>
					</s:if>
				</s:if>
			</s:else>
			<th rowspan="2">备注</th>
		</tr>
		<tr>
			<s:if test="'CCREPORT'.equals(reportType)">
				<th>最大数量</th>
				<th>最小数量</th>
				<th>实际数量</th>
				<th>实际状态</th>
			</s:if>
			<s:else>
				<s:if test="!'WLJZREPORT'.equals(reportType)">
					<th>单价</th>
					<th>数量</th>
					<th>金额</th>
				</s:if>

				<th>单价</th>
				<th>数量</th>
				<th>金额</th>

				<s:if test="!'WLJZREPORT'.equals(reportType)">
					<th>单价</th>
					<th>数量</th>
					<th>金额</th>

					<th>单价</th>
					<th>数量</th>
					<th>金额</th>
				</s:if>
			</s:else>
		</tr>
		<s:iterator value="abcReportList" status="stat">
			<s:if
				test="!'CCREPORT'.equals(reportType) || null == stateType || (2 == stateType) || storeState == stateType">
				<tr>
					<td><s:property value="materielType" /></td>
					<td><s:property value="name" /></td>
					<td><s:property value="specification" /></td>
					<td><s:property value="unit" /></td>
					<s:if test="'CCREPORT'.equals(reportType)">
						<td><s:property value="maxStore" /></td>
						<td><s:property value="minStore" /></td>
						<td><s:property value="amount" /></td>
						<td><s:if test="1 == storeState">超存</s:if><s:elseif
							test="-1 == storeState">短缺</s:elseif><s:else>正常</s:else> &nbsp;(<s:property
							value="storePercent" />)</td>
					</s:if>
					<s:else>
						<s:if test="!'WLJZREPORT'.equals(reportType)">
							<td><s:property value="lastAmount" /></td>
							<td><s:property value="lastPrice" /></td>
							<td><s:property value="lastTotalPrice" /></td>
						</s:if>
						<td><s:property value="amount" /></td>
						<td><s:property value="price" /></td>
						<td><s:property value="totalPrice" /></td>
						<s:if test="!'WLJZREPORT'.equals(reportType)">
							<td><s:property value="inAmount" /></td>
							<td><s:property value="inPrice" /></td>
							<td><s:property value="inTotalPrice" /></td>
							<td><s:property value="outAmount" /></td>
							<td><s:property value="outPrice" /></td>
							<td><s:property value="outTotalPrice" /></td>
							<s:if test="'ZZREPORT'.equals(reportType)">
								<td><s:property value="turnoverRate" /></td>
							</s:if>
						</s:if>
					</s:else>
					<td><s:property value="remark" /></td>
				</tr>
			</s:if>
		</s:iterator>
	</table>
</s:if></div>
<div>
<s:url id="back" action="CheckStockList"></s:url><s:a  href="%{back}">返回盘点列表</s:a>
</div>
<s:debug></s:debug>
</body>
</html>