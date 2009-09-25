<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.opensymphony.xwork2.ActionContext"%>
<%@page import="com.mydomain.bean.permission.Menu"%>
<%@page import="com.mydomain.bean.baseset.EmployeeBean"%>
<%@page import="com.mydomain.bean.baseset.JobBean"%>
<%@page import="com.manage.permission.MenuReader"%>
<%@page import="com.manage.baseset.JobManage"%>
<%
	String base = request.getContextPath();
	Menu userMenu = null;
	Object empObj = session.getAttribute("user");
	EmployeeBean emp = null;
	{
		emp = new EmployeeBean();
		emp.setPermissionCode("1011110000000");
		emp.setJobCode("J2009090809265880");
		//empObj = emp;
	}
	if (null != empObj) {
		if (empObj instanceof EmployeeBean) {
			emp = (EmployeeBean) empObj;
			JobBean aJob = new JobManage().getJobOne(emp.getJobCode());
			if (null != aJob) {
				String filter = aJob.getPermissionCode();
				userMenu = MenuReader.readMenu("userMenu", emp
						.getPermissionCode(), filter);
			}
		}
	}

	String itemCodes = "";
%>



<%@page import="java.util.List"%>
<%@page import="com.mydomain.bean.permission.Item"%><html>
<head>
<title></title>
<link href="<%=base%>/css/pagecom.css" rel="stylesheet" type="text/css" />

<script type="text/javascript">
function menuChange(id){
	if (!id) {
	    id = items[0];
	}
	var subHtml = document.getElementById('s_'+id);
	if (subHtml) {
	    var subMenu = document.getElementById('subMenu');
	    var str = '<div style="float: left; width: 30px;">&nbsp;</div>' + subHtml.innerHTML + '<div style="clear: both"></div>';
	    subMenu.innerHTML =str;
	    document.getElementById('m_'+id).className='selected';
	    if (items) {
		    for (var i = items.length-1; i >=0; i--) {
			    
			    var old = 'm_' + items[i];
			    if (old != ('m_' + id)) {
			        document.getElementById(old).className='item';
			    }
		    }
	    }
	}
}
</script>
</head>
<body onload="menuChange()">

<div class="page_top">
<div id="logger">IMC</div>
<div id="softname">库存管理软件</div>
<div id="exit_help"><img src="<%=base%>/images/help.gif"> <a
	href="#" class="a_top">帮助</a> <img src="<%=base%>/images/quit.gif">
<a href="#" class="a_top">退出</a></div>
</div>

<div class="menu">
<%
	if (null != emp && null != userMenu) {
		List<Item> list = userMenu.getItemList();
		itemCodes = "[";
		for (int i = 0; i < list.size(); i++) {
			Item item = list.get(i);
			String className = "item";
			if (i == 0) {
				className = "selected";
			} else {
				itemCodes += ",";
			}
			itemCodes += ("'" + item.getCode() + "'");
%>
<div id="m_<%=item.getCode()%>" class="<%=className%>"
	onclick="menuChange('<%=item.getCode()%>')"><%=item.getViewName()%></div>
<%
	List<Item> subList = item.getSubItemList();
			if (null != subList) {
%>
<div style="display: none;" id="s_<%=item.getCode()%>">
<%
	for (int subIndex = 0; subIndex < subList.size(); subIndex++) {
					Item subItem = subList.get(subIndex);
%>
<div class="item">&gt;  <%=subItem.getViewName()%></div>
<%
	}
%>
</div>
<%
	}
		}
		itemCodes += "]";
	}
%>

<div style="clear: both"></div>
</div>
<div class="sub_menu" id="subMenu"></div>
<SCRIPT type="text/javascript">
var items = <%=itemCodes%>;
</SCRIPT>
</body>
</html>