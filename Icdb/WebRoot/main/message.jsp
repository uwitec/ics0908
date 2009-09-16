<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
 <HEAD>
  <TITLE> New Document </TITLE>
  <META NAME="Generator" CONTENT="EditPlus">
  <META NAME="Author" CONTENT="">
  <META NAME="Keywords" CONTENT="">
  <META NAME="Description" CONTENT="">
<link href="../css/sub.css" type="text/css" rel="stylesheet">
 </HEAD>
<% 
	String base=request.getContextPath();
%>
 <BODY>
  <div class="sub_con_message">
  <div class="rmenu01">
<div class="rmenu_tit">用户中心</div>
<div class="rmenu01_con">
<p><img src="<%=base%>/images/img02.gif"> <span class="rmenu01_con_user">张三</span></p>
<p class="rmenu01_con_date">2009年9月4日</p>
<p class="rmenu01_con_indent">星期五</p>
<p class="rmenu01_con_indent">部门经理</p>
<p class="rmenu01_con_edit"><a href="#" class="edit">修改密码</a>  <a href="#" class="edit">注销</a></span></p>
</div>
</div>

<div class="rmenu02">
<div class="rmenu_tit">工作信息</div>
<div class="rmenu01_con">
<p class="rmenu02_item_tit">>> 入库审批单</p>
<p class="rmenu02_item_con">未审批单据共 5 张</p>
<p class="rmenu02_item_tit">>> 自动信息提示</p>
<p class="rmenu02_item_con">需要进行仓库盘点需要生成报表</p>
</div>
</div>
</div>
</BODY>
</HTML>
