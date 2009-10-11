<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
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
        /**
        emp = new EmployeeBean();
        emp.setPermissionCode("1011110000000");
        emp.setJobCode("J20090925223026114");
        empObj = emp;
         */
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
<SCRIPT type="text/javascript">

    var objarr = [];
    var leftarr = [];

    function viewSub(mid, isLeft) {
        hiddenSub(isLeft);

        var m = document.getElementById(mid);
        var s = document.getElementById(mid + '_sub');
        s.style.top = (isLeft ? m.offsetTop : m.offsetTop + m.offsetHeight) + 'px';
        s.style.left = (isLeft ? m.offsetLeft + m.offsetWidth : m.offsetLeft) + 'px';
        s.style.display = 'block';
        if (isLeft)
            leftarr.push(s);
        else
            objarr.push(s);
    }

    function hiddenSub(isLeft){
        var arr = isLeft ? leftarr : objarr;
        for ( var i = arr.length - 1; i >= 0; i--) {
            arr[i].style.display = 'none';
        }
        arr.length=0;
    }
    
    function menuClick() {
        hiddenSub(true);
        hiddenSub(false);
    }
</SCRIPT>

<STYLE type="text/css">
.mymenu div {
    float: left;
    border: 1px solid black;
    width: 120px;
}
</STYLE>
</head>
<body onload="" topmargin="0">

<div class="page_top">
<div id="logger">IMC</div>
<div id="softname">库存管理软件</div>
<div id="exit_help"><img src="<%=base%>/images/help.gif"> <a href="#" class="a_top">帮助</a> <img
    src="<%=base%>/images/quit.gif"> <a href="#" class="a_top">退出</a></div>
</div>
<div class="menu" >
<div id="mymenu" class="mymenu" style="position:relative; z-index: 9999;">
<%
    if (null != userMenu) {
        List<Item> list = userMenu.getItemList();
        StringBuilder sbd = new StringBuilder();
        for (int i = 0; i < list.size(); i++) {
            Item item = list.get(i);

            // 一级菜单
            // <div id="div_m1" onmouseover='viewSub("div_m1", false)'>名称1</div>
            sbd.append("<div id=\"div_m");
            sbd.append(item.getCode());
            sbd.append("\" onmouseover='viewSub(\"div_m");
            sbd.append(item.getCode());
            sbd.append("\", false)'><a href=\"");
            sbd.append(base).append("/");
            sbd.append(item.getAction());
            sbd.append("\">");
            sbd.append(item.getViewName());
            sbd.append("</a></div>");

            // 二级菜单外框
            // <div id="div_m1_sub" onclick='menuClick()' style="display: none; position: absolute;"> ... </div>
            sbd.append("<div id=\"div_m");
            sbd.append(item.getCode());
            sbd.append("_sub\" onclick='menuClick()'");
            sbd
                    .append("  style=\"display: none; position: absolute;\">");
            List<Item> subList = item.getSubItemList();
            if (null != subList) {
                for (int subIndex = 0; subIndex < subList.size(); subIndex++) {
                    Item subItem = subList.get(subIndex);

                    // 二级菜单
                    // <div id="div_m1_1" onmouseover='viewSub("div_m1_1", true)' >名称2</div>
                    sbd.append("<div id=\"div_m");
                    sbd.append(subItem.getCode());
                    sbd.append("\" onmouseover='viewSub(\"div_m");
                    sbd.append(subItem.getCode());
                    sbd.append("\", true)'><a href=\"");
                    sbd.append(base).append("/");
                    sbd.append(subItem.getAction());
                    sbd.append("\">");
                    sbd.append(subItem.getViewName());
                    sbd.append("</a></div>");

                    // 三级菜单外框
                    // <div id="div_m1_sub" onclick='menuClick()' style="display: none; position: absolute;"> ... </div>
                    sbd.append("<div id=\"div_m");
                    sbd.append(subItem.getCode());
                    sbd.append("_sub\" onclick='menuClick()'");
                    sbd
                            .append(" style=\"display: none; position: absolute;\">");

                    List<Item> threeList = subItem.getSubItemList();
                    if (null != threeList) {
                        for (int threeIndex = 0; threeIndex < threeList
                                .size(); threeIndex++) {
                            Item threeItem = threeList.get(threeIndex);
                            sbd.append("<a href=\"");
                            sbd.append(base).append("/");
                            sbd.append(threeItem.getAction());
                            sbd.append("\">");
                            sbd.append(threeItem.getViewName());
                            sbd.append("</a><br />");
                        }
                    }

                    sbd.append("</div>");
                }
            }
            sbd.append("</div>");
        }
        out.print(sbd.toString());
    }
%>

<%--
<div id="div_m1" onmouseover='viewSub("div_m1", false)' style="border: 1px solid red; width: 50px; height: 30px;">名称1</div>
<div id="div_m1_sub" onclick='menuClick()'
    style="border: 1px solid red; width: 50px; height: 30px; display: none; position: absolute;">

<div id="div_m1_1" onmouseover='viewSub("div_m1_1", true)' style="border: 1px solid red; width: 50px; height: 30px;"></div>
<div id="div_m1_1_sub" onclick='menuClick()' style="border: 1px solid red; display: none; position: absolute;">
<ul>
    <li>abc</li>
    <li>abc</li>
    <li>abc</li>
</ul>
</div>

<div id="div_m1_2" onmouseover='viewSub("div_m1_2", true)' style="border: 1px solid red; width: 50px; height: 30px;"></div>
<div id="div_m1_2_sub" onclick='menuClick()' style="border: 1px solid red; display: none; position: absolute;">
<ul>
    <li>abc</li>
    <li>abc</li>
    <li>abc</li>
</ul>
</div>

</div>

<div id="div_m2" onmouseover='viewSub("div_m2", false)' style="border: 1px solid blue; width: 50px; height: 30px;"></div>
<div id="div_m2_sub" onclick='menuClick()'
    style="border: 1px solid red; width: 50px; height: 30px; display: none; position: absolute;"></div>

<div id="div_m3" onmouseover='viewSub("div_m3", false)' style="border: 1px solid blue; width: 50px; height: 30px;"></div>
<div id="div_m3_sub" onclick='menuClick()'
    style="border: 1px solid red; width: 50px; height: 30px; display: none; position: absolute;"></div>

 --%>

</div>
</div>
<div class="sub_menu" id="subMenu"></div>
</body>
</html>