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
<title>����</title>
<SCRIPT type="text/javascript">
	function sub_back(){
	 		if(confirm("�Ƿ���ֹ��ǰ������������һҳ��")){
				window.location.href="CheckStockList.action";
			}
 		}
</SCRIPT>
</head>
	<body class="stock_body">
		<div class="stock_title"><img src="<%=base%>/images/img01.gif">����������Ϣ</div>
		<div class="stock_con">
		<s:form name="abcFrom" action="ABCReportAction" method="post">
		<s:select label="��ѡ�񱨱�����" name="reportType" list="reportTypeList" cssClass="sub3_border"
			listKey="key" listValue="name" onchange="javascript:abcFrom.submit()"></s:select>
		<s:hidden name="abcReportBean.csCode" value="%{abcReportBean.csCode}"></s:hidden>
		<s:hidden name="abcReportBean.oldCsCode"
			value="%{abcReportBean.oldCsCode}"></s:hidden>
		<s:hidden name="abcReportBean.beginDate"
			value="%{abcReportBean.beginDate}"></s:hidden>
		<s:hidden name="abcReportBean.endDate" value="%{abcReportBean.endDate}"></s:hidden>
		<s:select name="abcReportBean.materielType" label="��Ʒ����" cssClass="sub3_border"
			list="abcTypeList" listKey="value" listValue="name"
			onchange="javascript:abcFrom.submit()"></s:select>
		<s:if test="'CCREPORT'.equals(reportType)">
			<s:select name="stateType" label="��������" cssClass="sub_small_border"
				list="#{2:'ȫ��',0:'����',-1:'��ȱ',1:'����'}" listKey="key"
				listValue="value" onchange="javascript:abcFrom.submit()"></s:select>
		</s:if>
	<table border="0" width="800px">
		<tr>
			<td>��λ����:XXXXXX</td>
			<td>ͳ��ʱ��:<s:property value="%{abcReportBean.endDate}" /></td>
			<td align="right">��λ:Ԫ</td>
		</tr>
	</table>
</s:form>
	<s:if test="abcReportList!=null">
	<table class="center_table" style="width: 1002px; margin: 0;">
		<tr style="text-align: center; font-weight: bold;"  class="table_tr__even">
			<td colspan="2" rowspan="2">��Ŀ</td>
			<td rowspan="2">����ͺ�</td>
			<td rowspan="2">��λ</td>
			<s:if test="'CCREPORT'.equals(reportType)">
				<td colspan="2">�����������</td>
				<td colspan="2">ʵ������</td>
			</s:if>
			<s:else>
				<s:if test="!'WLJZREPORT'.equals(reportType)">
					<td colspan="3">���ڿ��</td>
				</s:if>
				<td colspan="3"><s:if test="'WLJZREPORT'.equals(reportType)">���</s:if><s:else>���ڿ��</s:else></td>
				<s:if test="!'WLJZREPORT'.equals(reportType)">
					<td colspan="3">�������</td>
					<td colspan="3">���ڳ���</td>
					<s:if test="'ZZREPORT'.equals(reportType)">
						<td rowspan="2">��ת��</td>
					</s:if>
				</s:if>
			</s:else>
			<td rowspan="2">��ע</td>
		</tr>
		<tr style="text-align: center; font-weight: bold;"  class="table_tr__even">
			<s:if test="'CCREPORT'.equals(reportType)">
				<td>�������</td>
				<td>��С����</td>
				<td>ʵ������</td>
				<td>ʵ��״̬</td>
			</s:if>
			<s:else>
				<s:if test="!'WLJZREPORT'.equals(reportType)">
					<td>����</td>
					<td>����</td>
					<td>���</td>
				</s:if>

				<td>����</td>
				<td>����</td>
				<td>���</td>

				<s:if test="!'WLJZREPORT'.equals(reportType)">
					<td>����</td>
					<td>����</td>
					<td>���</td>

					<td>����</td>
					<td>����</td>
					<td>���</td>
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
						<td><s:if test="1 == storeState">����</s:if><s:elseif
							test="-1 == storeState">��ȱ</s:elseif><s:else>����</s:else> &nbsp;(<s:property
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
	<a href="#" onclick="sub_back()"><img src="<%=base%>/images/back.gif" border="0" alt="����" title="����" style="margin-top: 8px;"></a>
</div>
</body>
</html>