<%@ page language="java" contentType="text/html; charset=GBK"
	pageEncoding="GBK"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%
    String base = request.getContextPath();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
 		 <link href="<%=base%>/css/form_css.css" type="text/css" rel="stylesheet">
		<link href="<%=base%>/css/body_css.css" type="text/css" rel="stylesheet">
		<link href="<%=base%>/css/center_css.css" type="text/css" rel="stylesheet">
		<link href="<%=base%>/css/stock_css.css" type="text/css" rel="stylesheet">
<title>报表</title>
<SCRIPT type="text/javascript">
	function sub_back(){
	 		if(confirm("是否终止当前工作，返回上一页？")){
				window.location.href="CheckStockList.action";
			}
 		}
</SCRIPT>
</head>
	<body class="stock_body">
		<div class="stock_title"><img src="<%=base%>/images/img01.gif">新增调价信息</div>
		<div class="stock_con">
		<s:form name="abcFrom" action="ABCReportAction" method="post">
		<s:select label="请选择报表类型" name="reportType" list="reportTypeList" cssClass="sub3_border"
			listKey="key" listValue="name" onchange="javascript:abcFrom.submit()"></s:select>
		<s:hidden name="abcReportBean.csCode" value="%{abcReportBean.csCode}"></s:hidden>
		<s:hidden name="abcReportBean.oldCsCode"
			value="%{abcReportBean.oldCsCode}"></s:hidden>
		<s:hidden name="abcReportBean.beginDate"
			value="%{abcReportBean.beginDate}"></s:hidden>
		<s:hidden name="abcReportBean.endDate" value="%{abcReportBean.endDate}"></s:hidden>
		<s:select name="abcReportBean.materielType" label="物品类型" cssClass="sub3_border"
			list="abcTypeList" listKey="value" listValue="name"
			onchange="javascript:abcFrom.submit()"></s:select>
		<s:if test="'CCREPORT'.equals(reportType)">
			<s:select name="stateType" label="报表类型" cssClass="sub_small_border"
				list="#{2:'全部',0:'正常',-1:'短缺',1:'超存'}" listKey="key"
				listValue="value" onchange="javascript:abcFrom.submit()"></s:select>
		</s:if>
	<table border="0" width="800px">
		<tr>
			<td>单位名称:XXXXXX</td>
			<td>统计时间:<s:property value="%{abcReportBean.endDate}" /></td>
			<td align="right">单位:元</td>
		</tr>
	</table>
</s:form>
	<s:if test="abcReportList!=null">
	<table class="center_table" style="width: 1002px; margin: 0;">
		<tr style="text-align: center; font-weight: bold;"  class="table_tr__even">
			<td colspan="2" rowspan="2">项目</td>
			<td rowspan="2">规格型号</td>
			<td rowspan="2">单位</td>
			<s:if test="'CCREPORT'.equals(reportType)">
				<td colspan="2">库存数量基线</td>
				<td colspan="2">实际数量</td>
			</s:if>
			<s:else>
				<s:if test="!'WLJZREPORT'.equals(reportType)">
					<td colspan="3">上期库存</td>
				</s:if>
				<td colspan="3"><s:if test="'WLJZREPORT'.equals(reportType)">库存</s:if><s:else>当期库存</s:else></td>
				<s:if test="!'WLJZREPORT'.equals(reportType)">
					<td colspan="3">本期入库</td>
					<td colspan="3">本期出库</td>
					<s:if test="'ZZREPORT'.equals(reportType)">
						<td rowspan="2">周转率</td>
					</s:if>
				</s:if>
			</s:else>
			<td rowspan="2">备注</td>
		</tr>
		<tr style="text-align: center; font-weight: bold;"  class="table_tr__even">
			<s:if test="'CCREPORT'.equals(reportType)">
				<td>最大数量</td>
				<td>最小数量</td>
				<td>实际数量</td>
				<td>实际状态</td>
			</s:if>
			<s:else>
				<s:if test="!'WLJZREPORT'.equals(reportType)">
					<td>单价</td>
					<td>数量</td>
					<td>金额</td>
				</s:if>

				<td>单价</td>
				<td>数量</td>
				<td>金额</td>

				<s:if test="!'WLJZREPORT'.equals(reportType)">
					<td>单价</td>
					<td>数量</td>
					<td>金额</td>

					<td>单价</td>
					<td>数量</td>
					<td>金额</td>
				</s:if>
			</s:else>
		</tr>
		<s:iterator value="abcReportList" status="stat">
			<s:if
				test="!'CCREPORT'.equals(reportType) || null == stateType || (2 == stateType) || storeState == stateType">
				<tr
					<s:if test="#stat.even">
                    class="table_tr_odd"
                </s:if>
					<s:else>
                    class="table_tr__even"
                </s:else>>
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
</s:if>
<div>
	<a href="#" onclick="sub_back()"><img src="<%=base%>/images/back.gif" border="0" alt="返回" title="返回" style="margin-top: 8px;"></a>
</div>
</body>
</html>