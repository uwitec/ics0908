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
<script type="text/javascript" src="<%=base%>/jstree/tree.js"></script>
<title>Insert title here</title>
<script type="text/javascript">
function initFunTree(){
	Tree.createTree('funTree', 'tree', false);
}
</script>

</head>
<body onload="initFunTree()" style="margin-top: 0px; padding-top: 0px">

<table border="1" cellspacing="0" width="1002" align="center">
	<tr>
		<td colspan="2" style="vertical-align: text-top;"><s:include
			value="/pagecom/head.jsp"></s:include></td>
	</tr>
	<tr height="500px" class="mid_bg" >
		<td width="200px;" style="vertical-align: text-top;">
		<div>
		<div class="lmenu">
		<div class="lmenu_tit">组织机构</div>
		<div class="lmenu_item">机构管理</div>
		<div class="lmenu_item">部门管理</div>
		<div class="lmenu_item">岗位管理</div>
		</div>
		</div>
		<ul id="funTree">

			<li><s:url action="ShowEmployeeList" id="ShowEmployeeList"></s:url><s:a
				href="%{ShowEmployeeList}">用户</s:a></li>
			<li>用户组</li>

		</ul>
		</td >
		<td>&nbsp; <s:iterator value="employeeList" status="stat">
		name: <s:property value="personName" />
		</s:iterator></td>
	</tr>
</table>
<s:debug></s:debug>
</body>
</html>