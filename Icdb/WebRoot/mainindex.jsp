<%@ page language="java" contentType="text/html; charset=GB18030"
    pageEncoding="GB18030"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<% 
	String base=request.getContextPath();
%>
<link href="<%=base%>/css/sub.css" type="text/css" rel="stylesheet">
<title>Insert title here</title>
</head>

<body>
<table>
<tr>
	<td colspan="3" width="1002"><jsp:include flush="true" page="/main/head.jsp"></jsp:include></td>
</tr>
<tr>
	<td colspan="3"><jsp:include flush="true" page="/main/menu.jsp"></jsp:include></td>
</tr>
<tr>
	<td><jsp:include flush="true" page="/main/left.jsp"></jsp:include></td>
	<td><jsp:include flush="true" page="/main/body.jsp"></jsp:include></td>
	<td><jsp:include flush="true" page="/main/message.jsp"></jsp:include></tD>
</tr>
<tr><td colspan="3">
<jsp:include flush="true" page="/main/bottom.jsp"></jsp:include></td></tr>
</table>
</body>
</html>