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
<div class="sub_con">
<div class="orgstructure_con_tit"><div class="orgstructure_con_tit_text">机构管理</div></div>

<div class="orgstructure_table_operate">
<img src="<%=base%>/images/img05.gif"> 全选　
<img src="<%=base%>/images/img06.gif"> 新建　
<img src="<%=base%>/images/img07.gif"> 编辑　
<img src="<%=base%>/images/img08.gif"> 删除　
<input type="text" class="search_border" value="输入机构名称">
<img src="<%=base%>/images/img09.gif"  align="absmiddle">
</div>

<div class="orgstructure_con">
<div class="orgstructure_table_tit">
<div class="orgstructure_table_th1">全选</div>
<div class="orgstructure_table_th2">部门标识</div>
<div class="orgstructure_table_th3">机构名称</div>
<div class="orgstructure_table_th4">负责人</div>
<div class="orgstructure_table_th5">操作</div>
</div>

<div class="orgstructure_table_odd">
<table class="orgstructure_table" cellspacing="1" cellpadding="0">
    <tr>
    <td class="orgstructure_table_td_odd"><INPUT type="checkbox" value="checkbox" checked ></td>
    <td class="orgstructure_table_td_odd">0001</td>
    <td class="orgstructure_table_td_odd">机构1</td>
    <td class="orgstructure_table_td_odd">张三</td>
    <td class="orgstructure_table_td_odd"><img src="<%=base%>/images/img03.gif">  <img src="<%=base%>/images/img04.gif"></td>
  </tr>
  <tr>
    <td class="orgstructure_table_td_even"><INPUT type="checkbox" value="checkbox" checked ></td>
    <td class="orgstructure_table_td_even">0001</td>
    <td class="orgstructure_table_td_even">机构1</td>
    <td class="orgstructure_table_td_even">张三</td>
    <td class="orgstructure_table_td_even"><img src="<%=base%>/images/img03.gif">  <img src="<%=base%>/images/img04.gif"></td>
  </tr>
    <tr>
    <td class="orgstructure_table_td_odd"><INPUT type="checkbox" value="checkbox" checked ></td>
    <td class="orgstructure_table_td_odd">0001</td>
    <td class="orgstructure_table_td_odd">机构1</td>
    <td class="orgstructure_table_td_odd">张三</td>
    <td class="orgstructure_table_td_odd"><img src="<%=base%>/images/img03.gif">  <img src="<%=base%>/images/img04.gif"></td>
  </tr>
</table>
<div class="pages">共 70 条  首页  上一页  1/4  下一页  末页 跳转到：<input type="text" class="pages_border"> 页 
<img src="<%=base%>/images/img10.gif" align="absmiddle"></div>
</div>
<div class="orgstructure_con_foot"></div>
</div>
 </BODY>
</HTML>
