<%@ page language="java" contentType="text/html; charset=GBK"
	pageEncoding="GBK"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<title>Insert title here</title>
</head>
<body>
<table border="1" cellpadding="2" cellspacing="2">
	<tr>
		<th>ABC报表</th>
		<th>超储报表</th>
		<th>周转率报表</th>
		<th>物料价值资产表</th>
		<th>损耗物料资产表</th>
	</tr>
</table>
csCode: <s:property value="%{csBean.csCode}"/>
</body>
</html>