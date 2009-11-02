<%@ page contentType="text/html; charset=UTF-8" %>
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
<div id="seachDIV" class="searche_DIV" style="display: none" >
<table width="100%" style="margin-left: 1px;" border="0" cellpadding="0" cellspacing="0">
	<tr>
		<td style="background:url(<%=base%>/images/menu_top_left.gif);" width="88" height="35">&nbsp;</td>
		<td style="background:url(<%=base%>/images/menu_top_con.jpg); background-repeat:repeat-x;color:#E0F2F9;font-size:13px;font-weight:bold;">修改密码</td>
		<td style="background:url(<%=base%>/images/menu_top_con.jpg); background-repeat:repeat-x;color:#E0F2F9;font-size:13px;font-weight:bold;" align="right">
		<a href="#" onclick="closeDIV()" ><img src="<%=base%>/images/quit.gif" alt="关闭" border="0"></a>
		</td>
		<td style="background:url(<%=base%>/images/menu_top_right.gif);" width="8" height="35" align="left">
		</td>
	</tr>
</table>
<table width="100%" border="0" cellpadding="0" cellspacing="0" style='background-color:#E2F3FB;border-left:#0C6A9D 1 solid;border-right:#0C6A9D 1px solid;'>
	<s:form  theme="simple" name="PassWordForm">
	<tr style="margin-top: 5px;"><td align="right" style="font-size:12px;color:#636B6D;margin-top: 8px;"></td>
		<td style="font-size:12px;color:#636B6D;margin-left: 5px;">
			原始密码：<input id="old_password" type="password" class="sub1_border" style="margin-top: 10px;">
			<font color="red" id="error1"></font>
		</td>
	</tr>
	<tr style="margin-top: 5px;"><td align="right" style="font-size:12px;color:#636B6D;margin-top: 8px;"></td>
		<td style="font-size:12px;color:#636B6D;">
			新 密 码：<input id="new_password" type="password" name="newpassword" class="sub1_border" style="margin-top: 10px;"> 
			<font color="red" id="error2"></font>
		</td>
	</tr>
	<tr style="margin-top: 5px;"><td align="right" style="font-size:12px;color:#636B6D;margin-top: 8px;"></td>
		<td style="font-size:12px;color:#636B6D;">
			再次输入：<input id="new_passwordagin" type="password" class="sub1_border" style="margin-top: 10px;">
			<font color="red" id="error2"></font>
		</td>
	</tr>
	<tr><td colspan="2" align="center">
	<a href="#" onclick="submitchange()"><img src="<%=base%>/images/update.jpg" alt="修改" border="0" style="margin-top: 5px;"></a></td></tr>
	</s:form>
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
<p class="rmenu01_con_edit"><a href="#" class="edit">修改密码</a>  <a href="#" class="edit">注销</a></p>
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
</div>