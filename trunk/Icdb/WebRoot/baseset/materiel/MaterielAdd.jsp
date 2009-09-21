<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<% String base=request.getContextPath(); %>
    <head>
       <link href="<%=base%>/css/sub.css" type="text/css" rel="stylesheet">
	   <title>物料信息</title>
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
		
		function checkprice(obj){
			var price=obj.value;
			if(!isNumber(price)){
				document.getElementById("deprice_f").innerHTML="单价填写有错误";
				obj.value=0;
			}
		}
		
		function isNumcheck(){
			var max=document.getElementById("max");
			var min=document.getElementById("min");
			
			if(!isNumber(min.value,10)){
				document.getElementById("min").value="0";
				document.getElementById("demin_f").innserHTML="请输入正确的数字!"
			}
			if(!isNumber(max.value,10)){
				document.getElementById("max").value="0";
				document.getElementById("demax_f").innserHTML="请输入正确的数字!"
			}
			if(parseFloat(min.value)>parseFloat(max.value)){
				alert("最大库存需要大于最小库存！");
				document.getElementById("max").value=document.getElementById("min").value;
			}
			
		}
		
		function clear(){
			document.getElementById("deprice_f").innerHTML="";
			document.getElementById("demin_f").innserHTML="";
			document.getElementById("demax_f").innserHTML="";
			document.getElementById("decode_f").innerHTML="";
			document.getElementById("dename_f").innerHTML="";
		}
		
	</SCRIPT>
	<base target="_self"> 
	<body class="sub1_body">
		<div class="sub1_title"><img src="<%=base%>/images/img01.gif">添加物料信息</div>
		<div class="sub1_con">
			<s:form action="AddMateriel" namespace="/baseset" theme="simple" name="insertForm">
				<div>编码：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<s:textfield id="decode" name="materiel.materielCode" value="%{materiel.materielCode}" cssClass="sub2_border" readonly="true"/>
					<font id="decode_f" color="red"></font>
				</div>
				<div>名称：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<s:textfield id="dename" name="materiel.materielName" cssClass="sub2_border"/>
					<font id="dename_f" color="red"></font>
				</div>
				<div>产地：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<s:textfield name="materiel.materielMadeIn" cssClass="sub2_border"/>
				</div>
				<div>单价：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<s:textfield name="materiel.materielPrice" onchange="checkprice(this)" value="0" cssClass="sub2_border"/>
					<font id="deprice_f" color="red"></font>
				</div>
				<div>最大库存量：
					<s:textfield id="max" name="materiel.materielMaxStore" onchange="isNumcheck(this)" value="0" cssClass="sub2_border"/>
					<font id="demax_f" color="red"></font>
				</div>
				<div>最小库存量：
					<s:textfield id="min" name="materiel.materielMinStore" onchange="isNumcheck(this)" value="0" cssClass="sub2_border"/>
					<font id="demin_f" color="red"></font>
				</div>
				<div>规格：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<s:textfield name="materiel.materielSize" cssClass="sub2_border"/>
				</div>
				<div>类型：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<s:select list="lsb"  listValue="value"	cssClass="sub3_border" listKey="key" name="materiel.materielABC"></s:select>
				</div>
				<div><input type="button" class="sub1_btn_save_closed" onclick="save_close()"/></div>
				<div><input type="button" class="sub1_btn_save_add" onclick="save_next()"/></div>
			</s:form>
		</div>
    </body>
</html>