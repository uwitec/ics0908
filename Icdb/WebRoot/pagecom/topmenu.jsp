<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
    String base = request.getContextPath();
%>

<html>
<head>
<title></title>
<link href="<%=base%>/css/pagecom.css" rel="stylesheet" type="text/css" />
</head>
<body>

<div class="page_top">
<div id="logger">IMC</div>
<div id="softname">库存管理软件</div>
<div id="exit_help"><img src="<%=base%>/images/help.gif"> <a
    href="#" class="a_top">帮助</a> <img src="<%=base%>/images/quit.gif">
<a href="#" class="a_top">退出</a></div>
</div>

<div class="menu">
<div class="selected">基本资料</div>
<div class="item">库存管理</div>
<div class="item">库存业务</div>
<div class="item">财务报表</div>
<div class="item">领导审批</div>
<div style="clear: both"></div>
</div>
<div class="sub_menu">
<div style="float: left; width: 30px;">&nbsp;</div>
<div class="item">&gt; 组织机构</div>
<div class="item">&gt; 仓储及货架</div>
<div class="item">&gt; 物品管理</div>
<div class="item">&gt; 银行帐号</div>
<div class="item">&gt; 人力资源</div>
<div style="clear: both"></div>
</div>
</body>
</html>