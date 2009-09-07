<%@ page language="java" contentType="text/html; charset=GB18030"
	pageEncoding="GB18030"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%
	String base = request.getContextPath();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GB18030">
<title>报表列表</title>
</head>
<body>
<div style="border: 1px solid gray;">条件区</div>
<div>请选择：
<hr />
<s:if test="csList.size>0">
	<table border="1" cellpadding="0" cellspacing="0" style="border: gray;">
		<tr>
			<th>盘点号</th>
			<th>仓库名</th>
			<th>盘点日期</th>
			<th>审批人</th>
			<th>审批意见</th>
			<th>审批状态</th>
			<th>经手人</th>
			<th>操作员</th>
			<th>单据状态</th>
			<th>是否初期库存</th>
		</tr>
		<s:iterator value="csList" status="stat">
			<tr>
				<td><s:url id="showReportList"  action="ShowReportList">
					<s:param name="csBean.csCode" value="csCode"></s:param>
				</s:url> <s:a href="%{showReportList}">
					<s:property value="csCode"></s:property>
				</s:a></td>
				<td><s:property value="storehouseCode"></s:property></td>
				<td><s:property value="csDate"></s:property></td>
				<td><s:property value="csApprove"></s:property></td>
				<td><s:property value="csApproveMessage"></s:property></td>
				<td><s:property value="csApproveState"></s:property></td>
				<td><s:property value="csCheckPerson"></s:property></td>
				<td><s:property value="csOptionor"></s:property></td>
				<td><s:property value="csState"></s:property></td>
				<td><s:property value="csStartStock"></s:property></td>
			</tr>
		</s:iterator>
	</table>
</s:if></div>
</body>
</html>