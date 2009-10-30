<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<% String base=request.getContextPath(); %>
<html>
    <head>
        <title>添加员工信息</title>
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
			window.location.href="ShowEmployee.action";
		}
	}
    function showJob(){
		window.showModalDialog("FindJob.action","","dialogHeight:400px;dialogWidth:600px");
	}
	function save(){
		if(confirm("是否修改该信息？")){
			if(checkMessage()){
				addEm.submit();
			}else{
				return false;
			}
		}
		
	}	
	function checkMessage(){
		var p_code=document.getElementById("pcode");
		var e_code=document.getElementById("ecode");
		var e_name=document.getElementById("ename");
		var job=document.getElementById("jobCode");
		

		if(trim(p_code.value)==''){
			return false;
		}
		if(trim(e_code.value)==''){
			return false;
		}
		if(trim(e_name.value)==''){
			alert("请添加姓名");
			return false;
		}
		if(trim(job.value)==''){
			alert("请添加岗位");
			return false;
		}
		return true;
	}
    </SCRIPT>
<body topmargin="0">
	<div class="body_div">
		<jsp:include flush="true" page="/pagecom/head.jsp"></jsp:include>
		<div class="left_body">
		<jsp:include flush="true" page="/main/left_.jsp"></jsp:include>
		<div class="center_body">
			<div class="center_head_text">员工信息</div>
			<div class="center_tools">
			</div>	
		</div>
		<div class="center_boder">
		 <div class="sub1_con">
		 <s:form action="UpdateEmployee" namespace="/baseset" method="post" theme="simple" name="addEm">
		 <table cellspacing="1" cellpadding="0" border="0">
	    	<tr><td class="table_tr_left">编码:
		    	<s:textfield id="ecode" name="employee.employeeCode" value="%{employee.employeeCode}" cssClass="sub1_border" readonly="true"/>
		    	<s:hidden id="pcode"  name="person.personCode" value="%{employee.personCode}"/>
		    	</td>
	    	<td rowspan="6" class="table_tr_right" width="300">
	    	照片:
	    	<s:file name="photoImg"cssClass="sub1_border" size="10"></s:file> 
	    	</td></tr>
	    	<tr class="table_tr_left"><td>&nbsp;</td></tr>
	    	<tr class="table_tr_left"><td>岗位:
	    		<s:textfield id="jobName" name="employee.jobName" onclick="showJob()" cssClass="sub1_border" cssStyle="margin-top:0px;" readonly="true"/>
	    		<a href="#" onclick="showJob()" class="a_top"><img src="<%=base%>/images/img10.gif"/ border="0" align="top"></a>
	    		<s:hidden id="jobCode" name="employee.jobCode"/>
	    	</td></tr>
	    	<tr class="table_tr_left"><td>&nbsp;</td></tr>
	    	<tr class="table_tr_left"><td colspan="2">姓名:
	    		<s:textfield id="ename" name="person.personName" value="%{person.personName}" cssClass="sub1_border"/></td>
	    	</tr>
	    	<tr class="table_tr_left"><td colspan="2">&nbsp;</td></tr>
	    	<tr class="table_tr_left">
	    		<td colspan="2">性别:<s:radio  list="{'男','女'}" name="person.personSex"  value="%{person.personSex}"/></td>
	    	</tr>
	    	<tr class="table_tr_left"><td>&nbsp;</td></tr>
	    	<tr class="table_tr_left"><td colspan="2">电话:
	    		<s:textfield name="person.personPhone" value="%{person.personPhone}" cssClass="sub1_border"/>
	    	</td></tr>
	    	<tr class="table_tr_left"><td colspan="2">&nbsp;</td></tr>
	    	<tr class="table_tr_left">
	    		<td colspan="2" colspan="2">电邮:
	    		<s:textfield name="person.personEmail" value="%{person.personEmail}" cssClass="sub1_border"/></td>
	    	</tr>
	    	<tr class="table_tr_left"><td colspan="2">
			</td></tr>
	    	<tr class="table_tr_odd">
	    		<td colspan="2">
	    		<a href="#" onclick="save()"><img src="<%=base%>/images/sub1_btn_save.jpg" alt="保存" title="保存" border="0"></a>
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