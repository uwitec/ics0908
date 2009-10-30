<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<% String base=request.getContextPath(); %>
<html>
    <head>
        <title>仓库信息</title>
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
			window.location.href="ShowStorehouse.action";
		}
	}
 	
	function showEmployee(){
		window.showModalDialog("FindEmployee.action","","dialogHeight:400px;dialogWidth:600px");
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
		var em_code=document.getElementById("employeeCode");
		var e_code=document.getElementById("scode");
		var e_name=document.getElementById("sname");
		
		clear();
		if(trim(em_code.value)==''){
			document.getElementById("employeeCode_r").innerHTML="请填写以上信息";
			return false;
		}
		if(trim(e_code.value)==''){
			document.getElementById("scode_r").innerHTML="请填写以上信息";
			return false;
		}
		if(trim(e_name.value)==''){
			document.getElementById("sname_r").innerHTML="请填写以上信息";
			return false;
		}
		
		return true;
	}
	
	function clear(){
		document.getElementById("employeeCode_r").innerHTML="";
		document.getElementById("scode_r").innerHTML="";
		document.getElementById("sname_r").innerHTML="";
	}
    </SCRIPT>
<body topmargin="0">
	<div class="body_div">
		<jsp:include flush="true" page="/pagecom/head.jsp"></jsp:include>
		<div class="left_body">
		<jsp:include flush="true" page="/main/left_.jsp"></jsp:include>
		<div class="center_body">
			<div class="center_head_text">添加仓库信息</div>
			<div class="center_tools">
			</div>	
		</div>
		<div class="center_boder">
		 <div class="sub1_con">
		 <s:form action="AddStorehouse" namespace="/baseset" method="post" theme="simple" name="addEm">
		 <table cellspacing="1" cellpadding="0" border="0" align="right" width="300">
	    	<tr><td class="table_tr_right">编码:
		    	<s:textfield id="scode" name="storehouse.storehouseCode" value="%{storehouse.storehouseCode}" cssClass="sub1_border" readonly="true"/>&nbsp;&nbsp;&nbsp;&nbsp;
		    	</td>
	    	</tr>
	    	<tr class="table_tr_odd"><td><font id="scode_r" color="red"/></td></tr>
	    	<tr class="table_tr_right"><td>仓库名:
	    		<s:textfield id="sname" name="storehouse.storehouseName" cssClass="sub1_border"/>&nbsp;&nbsp;&nbsp;&nbsp;
	    	</td></tr>
	    	<tr class="table_tr_odd"><td><font id="sname_r" color="red"/></td></tr>
	    	<tr class="table_tr_right"><td>所在地:
	    		<s:textfield name="storehouse.storehouseAddress" cssClass="sub1_border"/>&nbsp;&nbsp;&nbsp;&nbsp;</td>
	    	</tr>
	    	<tr class="table_tr_left"><td>&nbsp;</td></tr>
	    	<tr class="table_tr_right"><td>负责人:
	    		<s:textfield id="personName" name="storehouse.personName" onclick="showEmployee()" cssClass="sub1_border" cssStyle="margin-top:0px;"/>
	    		<a href="#" onclick="showEmployee()" class="a_top"><img src="<%=base%>/images/img10.gif" border="0" align="top" alt="查找数据" title="查找数据"></a>
				<s:hidden id="employeeCode" name="storehouse.employeeCode"></s:hidden>
	    	</tr>
	    	<tr class="table_tr_odd"><td><font id="employeeCode_r" color="red"></font></td></tr>
	    	<tr class="table_tr_right"><td>
				<s:hidden id="evalue" name="storehouse.s_value" value=""></s:hidden>
			</td></tr>
	    	<tr class="table_tr_right">
	    		<td>
	    		<a href="#" onclick="save()"><img src="<%=base%>/images/sub1_btn_save.jpg" border="0" alt="保存" title="保存"></a>
	    		<a href="#" onclick="save_next()"><img src="<%=base%>/images/sub1_btn_save_add.jpg" border="0" alt="保存并添加" title="保存并添加"></a>
	    		<a href="#" onclick="sub_back()"><img src="<%=base%>/images/back.gif" alt="返回" title="返回" border="0"></a>
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