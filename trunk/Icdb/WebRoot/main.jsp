<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
    <head>
        <title>欢迎</title>
    <link href="css/sub.css" type="text/css" rel="stylesheet">
    </head>
<% 
	String base=request.getContextPath();
%>
</head>

<frameset rows="80,78,400,49" cols="*" frameborder="no" framespacing="0">
  <frame src="<%=base%>/main/head.jsp"   noresize="noresize" scrolling="no" frameborder="NO" border="0" framespacing="0">
  <frame src="<%=base%>/main/menu.jsp"   noresize="noresize" scrolling="no" frameborder="NO" border="0" framespacing="0">
  <frameset cols="194,629,*" frameborder="no" framespacing="0"  >
	  <frame src="<%=base%>/main/left.jsp"   noresize="noresize" scrolling="no" frameborder="NO" border="0"  framespacing="0">
	  <frame src="<%=base%>/main/body.jsp"   noresize="noresize" scrolling="no" frameborder="NO" border="0" framespacing="0" marginheight="600">
	  <frame src="<%=base%>/main/message.jsp" noresize="noresize" scrolling="no" frameborder="NO" border="0" framespacing="0">
  </frameset>
  <frame src="<%=base%>/main/bottom.jsp" noresize="noresize" scrolling="no" frameborder="NO" border="0" framespacing="0">
</frameset>
<noframes>
<body>
你的浏览器不支持框架
</body>
</noframes>


</html>
