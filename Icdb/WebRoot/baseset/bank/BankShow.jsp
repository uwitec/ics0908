<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<% String base=request.getContextPath(); %>
<html>
    <head>
        <title>银行信息</title>
		<link href="<%=base%>/css/sub.css" type="text/css" rel="stylesheet">
		<link href="<%=base%>/css/pageCenter.css" type="text/css" rel="stylesheet">
	</head>
<body topmargin="0">
<script type="text/javascript" src="<%=base%>/javascript/innerText.js"></script>
<SCRIPT type="text/javascript">

    function Addbank(){
    	var href_="GoAddBank.action";
    	window.showModalDialog(href_,"","center:1;resizable:0;dialogHeight:250px;dialogWidth:450px");
		location.reload();
	}
	function Updatebank(value_str){
		var url="GetOneBank.action?bank.bankCode="+value_str;
		window.showModalDialog(url,"","dialogHeight:250px;dialogWidth:450px");
		location.reload();
	}
	
	function Deletebank(value_str){
		var url="DeleteBank.action?bank.bankCode="+value_str;
		if(confirm("是否确定删除？")){
    				window.location.href=url;
    		}
	}
    </SCRIPT>
<table border="1">
<tr>
	<td colspan="3" width="1002"><jsp:include flush="true" page="/pagecom/head.jsp"></jsp:include></td>
</tr>
<tr>
	<td></td>
	<td height="85%">
   <div class="cen_page_head">
		<div class="cen_page_text">银行信息</div>
	</div>
	

	<div class="orgstructure_table_tit">
	<div class="orgstructure_con">
<div class="orgstructure_table_tit">
</div>

	</td>
	<td></td>
</tr>
<tr><td colspan="3">&nbsp;<jsp:include flush="true" page="/main/bottom.jsp"></jsp:include></td></tr>
</table>
</body>
</html>