<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<% String base=request.getContextPath(); %>
<html>
    <head>
        <title>添加帐号信息</title>
		<link href="<%=base%>/css/left_css.css" type="text/css" rel="stylesheet">
		<link href="<%=base%>/css/body_css.css" type="text/css" rel="stylesheet">
		<link href="<%=base%>/css/center_css.css" type="text/css" rel="stylesheet">
		<link href="<%=base%>/css/form_css.css" type="text/css" rel="stylesheet">
	</head>
<body>
<script type="text/javascript" src="<%=base%>/javascript/innerText.js"></script>
    <SCRIPT type="text/javascript">
 
 
    function showSupplier(){
	window.showModalDialog("FindSupplier.action","","dialogHeight:400px;dialogWidth:700px");
	}
	function showBank(){
		window.showModalDialog("FindBank.action","","dialogHeight:500px;dialogWidth:500px");
	}
	function save(){
		if(checkMessage()){
			addEm.submit();
		}else{
			return false;
		}
		
	}
	function save_next(){
		if(checkMessage()){
			document.getElementById("evalue").value=1;
			addEm.submit();
		}else{
			return false;
		}
	}
	
	function checkMessage(){
		var ccode=document.getElementById("ccode");
		var cnumber=document.getElementById("cnumber");
		var supplier=document.getElementById("supplierCode");
		var bank=document.getElementById("bankCode");
		clear();
		if(trim(ccode.value)==''){
			document.getElementById("ccode_td").innerHTML="<font color='red'>以上信息不能为空！</font>";
			return false;
		}
		if(trim(cnumber.value)==''){
			document.getElementById("cnumber_td").innerHTML="<font color='red'>以上信息不能为空！</font>";
			return false;
		}
			if(trim(supplier.value)==''){
			document.getElementById("supplierCode_td").innerHTML="<font color='red'>以上信息不能为空！</font>";
			return false;
		}
			if(trim(bank.value)==''){
			document.getElementById("bankCode_tr").innerHTML="<font color='red'>以上信息不能为空！</font>";
			return false;
		}
		return true;
	}
	
	function clear(){
		document.getElementById("ccode_td").innerHTML="";
		document.getElementById("cnumber_td").innerHTML="";
		document.getElementById("supplierCode_td").innerHTML="";
		document.getElementById("bankCode_tr").innerHTML="";
	}
    </SCRIPT>
<body topmargin="0">
	<div class="body_div">
		<jsp:include flush="true" page="/pagecom/head.jsp"></jsp:include>
		<jsp:include flush="true" page="/main/left_.jsp"></jsp:include>
		<div class="center_body">
			<div class="center_head_text">帐号信息</div>
			<div class="center_tools">
			</div>	
		</div>
		<div class="center_boder">
		 <div class="sub1_con">
		 <s:form action="AddAccount" namespace="/baseset" method="post" theme="simple" name="addEm">
		 <table cellspacing="1" cellpadding="0" border="0" width="350">
	    	<tr><td class="table_tr_right">账户编号:
		    	<s:textfield id="ccode" name="account.accountCode" value="%{account.accountCode}" cssClass="sub1_border" readonly="true"/>&nbsp;&nbsp;&nbsp;&nbsp;
		    	</td>
		    </tr>
	    	<tr class="table_tr_right"><td id="ccode_td">&nbsp;</td></tr>
	    	<tr class="table_tr_right"><td>帐号:
	    		<s:textfield id="cnumber" name="account.accountNumber" cssClass="sub1_border"/>&nbsp;&nbsp;&nbsp;&nbsp;
	    	</td></tr>
	    	<tr class="table_tr_right"><td id="cnumber_td">&nbsp;</td></tr>
	    	<tr class="table_tr_right"><td>帐号类型:
	    		<s:textfield name="account.accountType" cssClass="sub1_border"/>&nbsp;&nbsp;&nbsp;&nbsp;</td>
	    	</tr>
	    	<tr class="table_tr_right"><td>&nbsp;</td></tr>
	    	<tr class="table_tr_right"><td>户主:
	    		<s:textfield id="supplierName" name="account.supplierName" onclick="showSupplier()" readonly="true" cssClass="sub1_border"/>
	    		<a href="#" onclick="showSupplier()" class="a_top"><img src="<%=base%>/images/img10.gif"/ border="0" align="top"></a>
	    		<s:hidden id="supplierCode" name="account.supplierCode"></s:hidden>
	    	</td></tr>
	    	<tr class=table_tr_right><td id="supplierCode_td">&nbsp;</td></tr>
	    	<tr class="table_tr_right">
	    		<td>所属银行:
	    		<s:textfield id="bankName" name="account.bankName" onclick="showBank()" readonly="true"  cssClass="sub1_border"/>
	    		<a href="#" onclick="showBank()" class="a_top"><img src="<%=base%>/images/img10.gif"/ border="0" align="top"></a>
	    		</td>
	    		<s:hidden id="bankCode" name="account.bankCode"></s:hidden>
	    	</tr>
	    	<tr class="table_tr_right"><td id="bankCode_tr">
				
			</td></tr>
	    	<tr class="table_tr_right" align="right">
	    		<td><s:hidden id="evalue" name="account.s_value" value=""></s:hidden>
	    		<a href="#" onclick="save()"><img src="<%=base%>/images/sub1_btn_save.jpg" border="0"></a>
	    		<a href="#" onclick="save_next()"><img src="<%=base%>/images/sub1_btn_save_add.jpg" border="0"></a>
	    		</td>
	    	</tr>
	     </table> 
	     </s:form>
	     </div>
		</div>
		<div class="center_boder_foot"></div>
		<jsp:include flush="true" page="/main/bottom_.jsp"></jsp:include>
	</div>
</body>
</html>