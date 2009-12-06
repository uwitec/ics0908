<%@ page contentType="text/html; charset=UTF-8" %>
<jsp:directive.page import="com.opensymphony.xwork2.ActionContext"/>
<%@ taglib prefix="s" uri="/struts-tags" %>
<jsp:directive.page import="com.tools.ICTools"/>
<jsp:directive.page import="java.util.Date"/>
<jsp:directive.page import="com.mydomain.bean.baseset.EmployeeBean"/>
<% 
	String base=request.getContextPath();
	EmployeeBean emp;
	if(request.getSession().getAttribute("user")!=null){
		emp=(EmployeeBean)request.getSession().getAttribute("user");
	}else{
		emp=new EmployeeBean();
	}
%>
<div id="passDIV" class="searche_DIV" style="display: none" >
<table width="100%" style="margin-left: 1px;" border="0" cellpadding="0" cellspacing="0">
	<tr>
		<td style="background:url(<%=base%>/images/menu_top_left.gif);" width="88" height="35">&nbsp;</td>
		<td style="background:url(<%=base%>/images/menu_top_con.jpg); background-repeat:repeat-x;color:#E0F2F9;font-size:13px;font-weight:bold;">修改密码</td>
		<td style="background:url(<%=base%>/images/menu_top_con.jpg); background-repeat:repeat-x;color:#E0F2F9;font-size:13px;font-weight:bold;" align="right">
		<a href="#" onclick="closePass()" ><img src="<%=base%>/images/quit.gif" alt="关闭" border="0"></a>
		</td>
		<td style="background:url(<%=base%>/images/menu_top_right.gif);" width="8" height="35" align="left">
		</td>
	</tr>
</table>
<table width="100%" border="0" cellpadding="0" cellspacing="0" style='background-color:#E2F3FB;border-left:#0C6A9D 1 solid;border-right:#0C6A9D 1px solid;'>
	<tr style="margin-top: 5px;"><td align="right" style="font-size:12px;color:#636B6D;margin-top: 8px;"></td>
		<td style="font-size:12px;color:#636B6D;margin-left: 5px;">
			原始密码：<input id="old_password" name="old_password" type="password" class="sub1_border" style="margin-top: 10px;">
			<br/><font color="red" id="perror1"></font>
		</td>
	</tr>
	<tr style="margin-top: 5px;"><td align="right" style="font-size:12px;color:#636B6D;margin-top: 8px;"></td>
		<td style="font-size:12px;color:#636B6D;">
			新 密 码：<input id="new_password" type="password" name="newpassword" class="sub1_border" style="margin-top: 10px;"> 
			<br/><font color="red" id="perror2"></font>
		</td>
	</tr>
	<tr style="margin-top: 5px;"><td align="right" style="font-size:12px;color:#636B6D;margin-top: 8px;"></td>
		<td style="font-size:12px;color:#636B6D;">
			再次输入：<input id="new_passwordagin" type="password" class="sub1_border" style="margin-top: 10px;">
			<br/><font color="red" id="perror3"></font>
		</td>
	</tr>
	<tr><td colspan="2" align="center">
	<a href="#" onclick="checkPassword()"><img src="<%=base%>/images/update.jpg" alt="修改" border="0" style="margin-top: 5px;"></a></td></tr>
</table>
<table width="100%" border="0" cellpadding="0" cellspacing="0">
	<tr>
		<td style="background:url(<%=base%>/images/menu_bottom_left.jpg);background-repeat:no-repeat;" width="13" height="13">&nbsp;</td>
		<td style="background:url(<%=base%>/images/menu_bottom_con.jpg); background-repeat:repeat-x; text-align:center;">&nbsp;</td>
		<td style="background:url(<%=base%>/images/menu_bottom_con.jpg); background-repeat:repeat-x; text-align:center;">&nbsp;</td>
		<td style="background:url(<%=base%>/images/menu_bottom_right.jpg);background-repeat:no-repeat;" width="13" height="13">&nbsp;</td>
	</tr>
</table>
</div>
<div class="rmenu01">
<div class="rmenu_tit">用户中心</div>
<div class="rmenu01_con">
<p><img src="<%=base%>/images/img02.gif"> 
<span class="rmenu01_con_user">
<% 
	out.print(emp.getPersonName());
%>
</span></p>
<p class="rmenu01_con_date"><b>时间：</b>
<% 
	out.print(ICTools.getSearchTime());
%>
<p class="rmenu01_con_indent" style="margin-left: 45px;">
<% 
	out.print(ICTools.getWeekOfDate(new Date()));
%>
</p>



<p class="rmenu01_con_indent"><b>岗位：</b>
<% 
	out.print(emp.getJobName());
%>
</p>
<p class="rmenu01_con_edit"><a href="#" class="edit" onclick="openPass();">修改密码</a>  
<a href="#" onclick="unlogin()" class="edit">注销</a></p>
</div>
</div>

<div class="rmenu02">
<div class="rmenu_tit">工作信息</div>
<div class="rmenu01_con">
<p class="rmenu02_item_tit"></p>
<p class="rmenu02_item_con"></p>
<p class="rmenu02_item_tit"></p>
<p class="rmenu02_item_con"></p>
</div>
<script type="text/javascript">
	function unlogin(){
		if(window.confirm("是否要注销？")){
			window.location.href="<%=base%>/login/Unlogin.action";
		}
	}
	
	function openPass(){
			document.getElementById("passDIV").style.display="block";
	}

	function closePass(){
		document.getElementById("passDIV").style.display="none";
	}
	
	function checkPassword(){
		var newp_var;
		var newap_var;
		var oldp_var;
		var checkold_var;
		
		newp_var=document.getElementById("new_password").value;
		newap_var=document.getElementById("new_passwordagin").value;
		oldp_var=document.getElementById("old_password").value;
		checkold_var="<%=ActionContext.getContext().getSession().get("OLDPassword")%>";
		
		p_clear();
		if(oldp_var!=checkold_var){
			document.getElementById("perror1").innerHTML="旧密码输入错误";
			return;
		}

		if(newp_var!=newap_var){
			document.getElementById("perror3").innerHTML="两次密码输入不一致！";	
			return;
		}
		
		if(window.confirm("是否修改密码？修改成功后将注销用户，重新登录！")){
			window.location.href="<%=base%>/login/ChangPass.action?newpassword="+newp_var;
		}
	}
	
	function p_clear(){
		document.getElementById("perror1").innerHTML="";
		document.getElementById("perror3").innerHTML="";	
	}

	
	
</script>
</div>