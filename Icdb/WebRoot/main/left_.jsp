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
  <div class="rmenu01">
<div class="rmenu_tit">用户中心</div>
<div class="rmenu01_con">
<p><img src="<%=base%>/images/img02.gif"> 
<span class="rmenu01_con_user">
<% 
	out.print(emp.getUserName());
%>
</span></p>
<p class="rmenu01_con_date">
<% 
	out.print(ICTools.getSearchTime());
%>
</p>
<p class="rmenu01_con_indent">
<% 
	out.print(ICTools.getWeekOfDate(new Date()));
%>
</p>
<p class="rmenu01_con_indent">
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