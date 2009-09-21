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
 
 
    function showJob(){
		window.showModalDialog("<%=base%>/baseset/FindJob.jsp","","dialogHeight:400px;dialogWidth:500px");
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
		<jsp:include flush="true" page="/main/left_.jsp"></jsp:include>
		<div class="center_body">
			<div class="center_head_text">员工信息</div>
			<div class="center_tools">
			</div>	
		</div>
		<div class="center_boder">
		 <div class="sub1_con">
		 <s:form action="AddEmployee" namespace="/baseset" method="post" theme="simple" name="addEm">
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
	    		<s:textfield id="jobName" name="employee.jobName" onclick="showJob()" cssClass="sub1_border" readonly="true"/>
	    		<a href="#" onclick="showJob()" class="a_top"><img src="<%=base%>/images/img10.gif"/ border="0" align="top"></a>
	    		<s:hidden id="jobCode" name="employee.jobCode"/>
	    	</td></tr>
	    	<tr class="table_tr_left"><td>&nbsp;</td></tr>
	    	<tr class="table_tr_left"><td colspan="2">姓名:
	    		<s:textfield id="ename" name="person.personName" cssClass="sub1_border"/></td>
	    	</tr>
	    	<tr class="table_tr_left"><td colspan="2">&nbsp;</td></tr>
	    	<tr class="table_tr_left">
	    		<td colspan="2">性别:<s:radio  list="{'男','女'}" name="person.personSex"  value="'男'"/></td>
	    	</tr>
	    	<tr class="table_tr_left"><td>&nbsp;</td></tr>
	    	<tr class="table_tr_left"><td colspan="2">电话:
	    		<s:textfield name="person.personPhone" cssClass="sub1_border"/>
	    	</td></tr>
	    	<tr class="table_tr_left"><td colspan="2">&nbsp;</td></tr>
	    	<tr class="table_tr_left">
	    		<td colspan="2" colspan="2">电邮:
	    		<s:textfield name="person.personEmail" cssClass="sub1_border"/></td>
	    	</tr>
	    	<tr class="table_tr_left"><td colspan="2">
				<s:hidden id="evalue" name="employee.s_value" value=""></s:hidden>
			</td></tr>
	    	<tr class="table_tr_odd">
	    		<td colspan="2">
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