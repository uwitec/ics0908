<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%
	String base = request.getContextPath();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href="<%=base%>/css/sub.css" type="text/css" rel="stylesheet">
<title>权限设置</title>
</HEAD>
<script type="text/javascript" src="<%=base%>/javascript/innerText.js"></script>
<base target="_self">
<body class="sub1_body">
<div class="sub1_title"><img src="<%=base%>/images/img01.gif">权限设置</div>
<div class="sub1_con">

<div style="border: 1px solid red;"><s:iterator
	value="userMenu.itemList">
	<s:if test="permissionIndex == null)">
		<s:checkbox name="checkbox" label="%{viewName}"
			fieldValue="%{permissionIndex}" value="1"></s:checkbox>
	</s:if>
	<s:else>
		<s:checkbox name="checkbox" label="%{viewName}"
			fieldValue="%{permissionIndex}" value="0"></s:checkbox>
	</s:else>
</s:iterator></div>

</div>

<s:debug cssStyle="top:500px;"></s:debug>
</body>
</html>