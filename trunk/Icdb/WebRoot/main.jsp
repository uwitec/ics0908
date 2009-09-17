<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<% String base=request.getContextPath();%>
<html>
    <head>
        <title>欢迎</title>
    <link href="<%=base%>/css/left_css.css" type="text/css" rel="stylesheet">
    <link href="<%=base%>/css/body_css.css" type="text/css" rel="stylesheet">
    <link href="<%=base%>/css/center_css.css" type="text/css" rel="stylesheet">
    </head>
<body topmargin="0">
	<div class="body_div">
		<jsp:include flush="true" page="/pagecom/head.jsp"></jsp:include>
		<jsp:include flush="true" page="/main/left_.jsp"></jsp:include>
		<div class="center_body">
			<div class="center_head_text">功能信息</div>
			<div class="center_tools"><input type="text" class="search_border"/><input type="image" src="<%=base%>/images/img09.gif" alt="查询"/></div>	
		</div>
		<div class="center_boder">
		<table class="center_table" cellspacing="1" cellpadding="0">
			<tr class="table_head">
				<td>a</td>
				<td>b</td>
				<td>c</td>
				<td>d</td>
			</tr>
		  <tr class="table_tr_odd">
		    <td>0001</td>
		    <td>机构1</td>
		    <td>张三</td>
		    <td><img src="images/img03.gif">  <img src="images/img04.gif"></td>
		  </tr>
		    <tr class="table_tr__even">
		    <td>0001</td>
		    <td>机构1</td>
		    <td>张三</td>
		    <td><img src="images/img03.gif">  <img src="images/img04.gif"></td>
		  </tr>
		  </table>
		<div class="pages">
			分页信息
		</div>
		</div>
		<div class="center_boder_foot"></div>
		<jsp:include flush="true" page="/main/bottom_.jsp"></jsp:include>
	</div>
</body>
</html>
