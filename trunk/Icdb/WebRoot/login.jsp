<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%
    String base = request.getContextPath();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7" />
<link href="<%=base%>/css/main.css" type="text/css" rel="stylesheet">
<title>IMS库存管理系统</title>
</HEAD>
<BODY>
<div class="login_top"></div>
<div class="login_left"><s:form name="logForm" action="Login"
	namespace="/login" method="post" theme="simple">
	<div><s:textfield id="userNameid" name="userName"  cssClass="border_user"></s:textfield></div>
	<div><s:password  name="passWord"  cssClass="border_pwd"></s:password></div>
	<div><s:submit value="" cssClass="btn_login"></s:submit></div>
	<div><s:reset value="" onclick="resetMe()" cssClass="btn_reset"></s:reset></div>
</s:form></div>
<div class="login_line"></div>
<div class="login_right">
<p><span class="title">系统说明：</span></p>
<p>帮助企业建立信息化库存管理的平台，将传统的库存的出、入进行管理的自动化，对企业库存中存在的问题实现报警机制。</p>
<p>将分散的库存管理进行统一集中的管理、提高库存物品利用率、建立企业的库存搜索引擎。</p>
<p>评估库存货物状况与市场价值，为企业减少消耗损失。</p>
</div>
<div class="login_foot">CopyRight © 2009-2012 IMS</div>
<script type="text/javascript">
			
			function loginmess(){
			var message=document.getElementById("userNameid").value;
				
				if(message!=null && message!=''){
					alert("用户名或密码错误！请重新输入");
				}
			}	
			
			loginmess();
			
			function resetMe(){
				document.getElementById("userNameid").text="";
			}
</script>

</BODY>
</HTML>