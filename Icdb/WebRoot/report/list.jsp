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
<s:iterator value="csList" status="stat">
	<li><s:property value="csCode"></s:property> <s:property
		value="storehouseCode"></s:property>
</s:iterator>
</body>
</html>