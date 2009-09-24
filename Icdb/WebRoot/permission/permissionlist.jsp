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

<div style="width: 400px; padding: 20px;"><s:form action="" name="pform"
	theme="simple">
	<s:iterator value="userMenu.itemList">
		<br />
		<b> <s:if test="permissionIndex.equals(userPermissionCode)">
			<s:checkbox name="checkbox" fieldValue="%{permissionIndex}" value="1"></s:checkbox>
			<s:property value="viewName" />
		</s:if> <s:else>
			<s:checkbox name="checkbox" fieldValue="%{permissionIndex}" value="0"></s:checkbox>
			<s:property value="viewName" />
		</s:else></b>
		<hr style="color: #eeeeee; width: 25%;" align="left" />
		<s:if test="level==1">
			<s:iterator value="subItemList">
				<s:if test="permissionIndex.equals(userPermissionCode)">
					<s:checkbox name="checkbox" fieldValue="%{permissionIndex}"
						value="1"></s:checkbox>
					<s:property value="viewName" />
				</s:if>
				<s:else>
					<s:checkbox name="checkbox" fieldValue="%{permissionIndex}"
						value="0"></s:checkbox>
					<s:property value="viewName" />
				</s:else>
			</s:iterator>
		</s:if>
		<br />
	</s:iterator>
	<br />
	<br />
	<div style="vertical-align: top; text-align: right;"><input type="button"
		onclick="javascript:window.document.pform.submit();window.close();"
		style=" background-image:url(../images/sub1_btn_save.jpg);background-repeat:no-repeat;border:0px;width:59px;height:22px;"
		value="" /> <input type="button" onclick="javascript:window.close();" value=""
		style="background-image: url(../images/sub1_btn_reset.jpg); background-repeat: no-repeat; border: 0px; width: 59px; height: 22px;" />
	</div>
</s:form></div>

</div>

<s:debug cssStyle="top:500px;"></s:debug>
</body>
</html>