<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<% 
String base=request.getContextPath(); 
%>
<html>
    <head>
        <title>添加信息</title>
    </head>
    <body>
    <s:if test="message!=''">
    	<s:property value="message"/><br/>
    </s:if>
	
     <a href="<%=base+request.getAttribute("nextPath")%>">添加下一个</a>
     <a href="<%=base+request.getAttribute("rePath")%>">返回列表</a>
    </body>
</html>