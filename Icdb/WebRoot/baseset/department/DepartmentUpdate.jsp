<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<% String base=request.getContextPath(); %>
    <head>
       <link href="<%=base%>/css/sub.css" type="text/css" rel="stylesheet">
	   <title>部门信息</title>
	</HEAD>
	<script type="text/javascript" src="<%=base%>/javascript/innerText.js"></script>
	<SCRIPT type="text/javascript">
	
		function isEmpty(){
			var v_code=document.getElementById("decode");
			var v_name=document.getElementById("dename");
			if(trim(v_code.value)==''){
				document.getElementById("decode_f").innerHTML="该信息不能为空";
				return false;
			}
			if(trim(v_name.value)==''){
				document.getElementById("dename_f").innerHTML="该信息不能为空";
				return false;
			}
			return true;
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
	<base target="_self"> 
	<body class="sub1_body">
		<div class="sub1_title"><img src="<%=base%>/images/img01.gif">修改部门信息</div>
		<div class="sub1_con">
		<s:if test="lsb.size==0">
			请先添加机构信息！
		</s:if>
		<s:else>
			<s:form action="UpdateDepartment" namespace="/baseset" theme="simple" name="insertForm">
				<div>部门编号：
					<s:textfield id="decode" name="department.departmentCode" value="%{department.departmentCode}" cssClass="sub1_border" readonly="true"/>
					<font id="decode_f" color="red"></font>
				</div>
				<div>部门名称：
					<s:textfield id="dename" name="department.departmentName" value="%{department.departmentName}" cssClass="sub1_border"/>
					<font id="dename_f" color="red"></font>
				</div>
				<div>所属机构：
					<s:select list="lsb" listKey="structCode" cssClass="sub2_border" listValue="structName" name="department.structCode"/>		
				</div>
				<div><input type="button" class="sub1_btn_save_closed" onclick="save_close()"/></div>
			</s:form>
		</s:else>
		</div>
    </body>
</html>