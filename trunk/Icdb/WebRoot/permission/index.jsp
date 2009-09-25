<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%
	String base = request.getContextPath();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<link href="<%=base%>/jstree/tree.css" rel="stylesheet" type="text/css" />
<link href="<%=base%>/css/left_css.css" type="text/css" rel="stylesheet">
<link href="<%=base%>/css/body_css.css" type="text/css" rel="stylesheet">
<link href="<%=base%>/css/center_css.css" type="text/css"
	rel="stylesheet">
<link href="<%=base%>/css/pagecom.css" type="text/css" rel="stylesheet">
<script type="text/javascript" src="<%=base%>/jstree/tree.js"></script>
<title>Insert title here</title>
<script type="text/javascript">
function initFunTree(){
	Tree.createTree('funTree', 'lmenutree', false);
}
</script>

</head>
<body onload="initFunTree()" style="margin-top: 0px; padding-top: 0px">

<div class="body_div"><jsp:include flush="true"
	page="/pagecom/head.jsp"></jsp:include>

<div class="left_body">
<div class="left_menu">
<div class="left_menu_head">权限</div>
<table class="left_menu_table" border="0">
	<tr height="40">
		<td class="left_menu_table_td"><s:url action="ShowEmployeeList"
			id="ShowEmployeeList"></s:url><s:a href="%{ShowEmployeeList}">用户</s:a></td>
	</tr>
	<tr height="40">
		<td class="left_menu_table_td"><s:url action="ShowJobList"
			id="ShowJobList"></s:url><s:a href="%{ShowJobList}">用户组</s:a></td>
	</tr>
</table>
</div>
</div>

<div class="center_body">
<div class="center_head_text"><s:if test="null != employee">用户</s:if><s:elseif
	test="null != job">用户组</s:elseif><s:else>权限管理</s:else></div>
<div class="center_tools"><input type="text" class="search_border" /><input
	type="image" src="<%=base%>/images/img09.gif" alt="查询" /></div>
</div>
<div class="center_boder">
<table class="center_table" cellspacing="1" cellpadding="0">
	<s:if test="null != employee">
		<tr class="table_head">
			<td>姓名</td>
			<td>岗位</td>
			<td>部门</td>
			<td>设置</td>
		</tr>
		<s:iterator value="employeeList" status="stat">
			<s:if test="stat.index\2==0">
				<tr class="table_tr_odd">
			</s:if>
			<s:else>
				<tr class="table_tr__even">
			</s:else>
			<td><s:property value="personName" /></td>
			<td><s:property value="jobName" /></td>
			<td><s:property value="departmentName" /></td>
			<td><img src="<%=base%>/images/img03.gif" style="cursor: pointer;"
				onclick="window.showModalDialog('ShowPermissioinList.action?role=employee&employee.employeeCode=<s:property value="employeeCode" />', '', 'width=430px,height=300px');" /></td>
			</tr>
		</s:iterator>
	</s:if>
	<s:elseif test="null != job">
		<tr class="table_head">
			<td>岗位</td>
			<td>部门</td>
			<td>设置</td>
		</tr>
		<s:iterator value="jobList" status="stat">
			<s:if test="stat.index\2==0">
				<tr class="table_tr_odd">
			</s:if>
			<s:else>
				<tr class="table_tr__even">
			</s:else>
			<td><s:property value="jobName" /></td>
			<td><s:property value="departmentName" /></td>
			<td><img src="<%=base%>/images/img03.gif" style="cursor: pointer;"
				onclick="window.showModalDialog('ShowPermissioinList.action?role=job&job.jobCode=<s:property value="jobCode" />', '', 'width=430px,height=300px');" />
			</td>
			</tr>
		</s:iterator>
	</s:elseif>
</table>
<div class="pages">分页信息</div>
</div>
<div class="center_boder_foot"></div>
<jsp:include flush="true" page="/main/bottom_.jsp"></jsp:include></div>
<s:property value="#parameters.view" />
<s:debug></s:debug>

</body>
</html>