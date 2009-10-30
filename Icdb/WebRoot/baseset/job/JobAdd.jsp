<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<% String base=request.getContextPath(); %>
    <head>
       <link href="<%=base%>/css/sub.css" type="text/css" rel="stylesheet">
	   <title>岗位信息</title>
	</HEAD>
	<script type="text/javascript" src="<%=base%>/javascript/innerText.js"></script>
	<SCRIPT type="text/javascript">
	
		function sub_back(){
			if(confirm("是否关闭该页面？")){
				window.opener=null;
	  			window.close();
			}
		}
		
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
			if(confirm("是否添加该信息？")){
				if(isEmpty()){
					insertForm.submit();
				}
			}
		}
		
		function save_close(){
			if(confirm("是否添加该信息？")){
				if(isEmpty()){
					insertForm.submit();
					window.opener=null;
		  			window.close();
	  			}  
	  		}
		}
		
	</SCRIPT>
	<base target="_self"> 
	<body class="sub1_body">
		<div class="sub1_title"><img src="<%=base%>/images/img01.gif">添加岗位信息</div>
		<div class="sub1_con">
		<s:if test="ldb.size==0">
			请先添加部门信息！
		</s:if>
		<s:else>
			<s:form action="AddJob" namespace="/baseset" theme="simple" name="insertForm">
				<div>岗位编号：
					<s:textfield id="decode" name="job.jobCode" value="%{job.jobCode}" cssClass="sub1_border" readonly="true"/>
					<font id="decode_f" color="red"></font>
				</div>
				<div>岗位名称：
					<s:textfield id="dename" name="job.jobName" cssClass="sub1_border"/>
					<font id="dename_f" color="red"></font>
				</div>
				<div>所属部门：
					<s:select  list="ldb" listKey="departmentCode" cssClass="sub2_border" listValue="departmentName" name="job.departmentCode"/>		
				</div>
				<div style="margin-top: 8px;">
				<a href="#" onclick="save_close()"><img src="<%=base%>/images/sub1_btn_save_closed.jpg" alt="保存并关闭" title="保存并关闭" border="0"></a>
				<a href="#" onclick="save_next()"><img src="<%=base%>/images/sub1_btn_save_add.jpg" alt="保存并添加" title="保存并添加" border="0"></a>
				<a href="#" onclick="sub_back()"><img src="<%=base%>/images/back.gif" alt="返回" title="返回" border="0"></a>
			</div>
			</s:form>
		</s:else>
		</div>
    </body>
</html>