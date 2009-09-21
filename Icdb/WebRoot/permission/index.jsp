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
<div>

<div class="sub_con">
<div class="lmenu">
<div class="lmenu_tit">组织机构</div>
<ul id="funTree">
	<li><s:url action="ShowEmployeeList" id="ShowEmployeeList"></s:url><s:a
		href="%{ShowEmployeeList}">用户</s:a></li>
	<li>用户组</li>
</ul>
</div>
</div>
</div>
<div class="center_body">
<div class="center_head_text">功能信息</div>
<div class="center_tools"><input type="text" class="search_border" /><input
	type="image" src="<%=base%>/images/img09.gif" alt="查询" /></div>
</div>
<div class="center_boder">
<table class="center_table" cellspacing="1" cellpadding="0">
	<tr class="table_head">
		<td>姓名</td>
		<td>岗位</td>
		<td>部门</td>
	</tr>
	<s:iterator value="employeeList" status="stat">
		<s:if test="stat.index\2==0">
			<tr class="table_tr_odd"></tr>
		</s:if>
		<s:else>
			<tr class="table_tr__even">
		</s:else>
		<td><s:property value="personName" /></td>
		<td><s:property value="jobName" /></td>
		<td><s:property value="departmentName" /></td>
		</tr>
	</s:iterator>
</table>
<div class="pages">分页信息</div>
</div>
<div class="center_boder_foot"></div>
<jsp:include flush="true" page="/main/bottom_.jsp"></jsp:include></div>


</body>
</html>