<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<% String base=request.getContextPath(); %>
<html>
    <head>
        <title>添加新员工</title>
		<link href="<%=base%>/css/sub.css" type="text/css" rel="stylesheet">
	</head>
<body>
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
<table>
<tr>
	<td colspan="3" width="1002"><jsp:include flush="true" page="/main/head.jsp"></jsp:include></td>
</tr>
<tr>
	<td colspan="3"><jsp:include flush="true" page="/main/menu.jsp"></jsp:include></td>
</tr>
<tr>
	<td><jsp:include flush="true" page="/main/left.jsp"></jsp:include></td>
	<td>
   <div class="orgstructure_con_tit">
		<div class="orgstructure_con_tit_text">银行信息</div>
	</div>
	
	<div class="orgstructure_table_operate">
	</div> 
	<div class="orgstructure_table_tit">
	<div class="orgstructure_con">
<div class="orgstructure_table_tit">
</div>
	    <table class="orgstructure_table" cellspacing="1" cellpadding="0">
	     </table>
  	  	</div>
  	<div class="orgstructure_con_foot"></div>
	</td>
	<td><jsp:include flush="true" page="/main/message.jsp"></jsp:include></td>
</tr>
<tr><td colspan="3">&nbsp;<jsp:include flush="true" page="/main/bottom.jsp"></jsp:include></td></tr>
</table>
</body>
</html>