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
 	
 	function sub_back(){
 		if(confirm("是否终止当前工作，返回上一页？")){
			window.location.href="ShowAccount.action";
		}
 	}
 
    function showSupplier(){
	window.showModalDialog("FindSupplier.action","","dialogHeight:400px;dialogWidth:700px");
	}
	function showBank(){
		window.showModalDialog("FindBank.action","","dialogHeight:500px;dialogWidth:500px");
	}
	function save(){
		if(confirm("是否添加该信息？")){
			if(checkMessage()){
				addEm.submit();
			}else{
				return false;
			}
		}
	}
	function save_next(){
		if(confirm("是否添加该信息？")){
			if(checkMessage()){
				document.getElementById("evalue").value=1;
				addEm.submit();
			}else{
				return false;
			}
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
		<div class="left_body">
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
	    		<s:textfield id="supplierName" name="account.supplierName" onclick="showSupplier()" cssStyle="margin-top:0px;" readonly="true" cssClass="sub1_border"/>
	    		<a href="#" onclick="showSupplier()"><img src="<%=base%>/images/img10.gif" border="0" align="top" alt="查找数据" title="查找数据"></a>
	    		<s:hidden id="supplierCode" name="account.supplierCode"></s:hidden>
	    	</td></tr>
	    	<tr class=table_tr_right><td id="supplierCode_td">&nbsp;</td></tr>
	    	<tr class="table_tr_right">
	    		<td>所属银行:
	    		<s:textfield id="bankName" name="account.bankName" onclick="showBank()" readonly="true" cssStyle="margin-top:0px;"  cssClass="sub1_border"/>
	    		<a href="#" onclick="showBank()" class="a_top" ><img src="<%=base%>/images/img10.gif" border="0" align="top" alt="查找数据" title="查找数据"></a>
	    		</td>
	    		<s:hidden id="bankCode" name="account.bankCode"></s:hidden>
	    	</tr>
	    	<tr class="table_tr_right"><td id="bankCode_tr">
				
			</td></tr>
	    	<tr align="center">
	    		<td><s:hidden id="evalue" name="account.s_value" value=""></s:hidden>
	    		<a href="#" onclick="save()"><img src="<%=base%>/images/sub1_btn_save.jpg" border="0" alt="保存" title="保存"></a>
	    		<a href="#" onclick="save_next()"><img src="<%=base%>/images/sub1_btn_save_add.jpg" border="0" alt="保存并添加" title="保存并添加"></a>
	    		<a href="#" onclick="sub_back()"><img src="<%=base%>/images/back.gif" border="0" alt="返回" title="返回"></a>
	    		</td>
	    	</tr>
	     </table> 
	     </s:form>
	     </div>
		</div>
		<div class="center_boder_foot"></div>
		<jsp:include flush="true" page="/main/bottom_.jsp"></jsp:include>
		</div>
	</div>
</body>
</html>