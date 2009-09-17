<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<% String base=request.getContextPath(); %>
    <head>
       <link href="<%=base%>/css/sub.css" type="text/css" rel="stylesheet">
	   <title>添加银行信息</title>
	</HEAD>
	<script type="text/javascript" src="<%=base%>/javascript/innerText.js"></script>
	<SCRIPT type="text/javascript">
	
		function isEmpty(){
			var v_name=document.getElementById("bank_name");
			if(trim(v_name.value)==''){
				alert("银行名称不能为空");
				return false;
			}else{
				return true;
			}
		}
		
		function save_next(){
			if(isEmpty()){
				insertForm.submit();
			}
		}
		
		function save_close(){
			if(isEmpty()){
				insertForm.submit();
				window.opener=null;
	  			window.close();
  			}   
		}
		
	</SCRIPT>
	<body class="sub1_body">
		<div class="sub1_title"><img src="<%=base%>/images/img01.gif"> 添加银行</div>
		<div class="sub1_con">
		<s:form action="AddBank" namespace="/baseset" theme="simple" name="insertForm">
			<div>银行编号：
			<s:textfield name="bank.bankCode" cssClass="sub1_border" readonly="true"/>
			</div>
			<div>银行名称：
			<s:textfield name="bank.bankName" cssClass="sub1_border" id="bank_name" value=""/>
			<div><input type="button" class="sub1_btn_save_closed" onclick="save_close()"/></div>
			<div><input type="button" class="sub1_btn_save_add" onclick="save_next()"/></div>
			</div>
		</s:form>
		</div>
    </body>
</html>