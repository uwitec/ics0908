<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<% String base=request.getContextPath(); %>
    <head>
        <link href="<%=base%>/css/sub.css" type="text/css" rel="stylesheet">
        <link href="<%=base%>/css/center_css.css" type="text/css" rel="stylesheet">
	   <title>货位信息</title>
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
			var v_code=document.getElementById("ccode");
			var v_name=document.getElementById("cname");
			if(trim(v_code.value)==''){
				document.getElementById("ccode_f").innerHTML="该信息不能为空";
				return false;
			}
			if(trim(v_name.value)==''){
				document.getElementById("cname_f").innerHTML="该信息不能为空";
				return false;
			}
			return true;
		}
		
		function update_close(){
			var url="<%=base%>/baseset/UpdateCargoSpace.action";
			if(confirm("是否修改该信息？")){
				if(isEmpty()){
					document.getElementById("next").value="1";
					document.getElementById("caForm").action=url;
					caForm.submit();
				}
			}
		}
		
		function save_next(){
			if(confirm("是否添加该信息？")){
				if(isEmpty()){
					document.getElementById("next").value="1";
					caForm.submit();
				}
			}
		}
		
		function save_close(){
			if(confirm("是否添加该信息？")){
				if(isEmpty()){
					caForm.submit();
					window.opener=null;
		  			window.close();
	  			}   
  			}
		}
		
		function showForm(){
			document.getElementById("formdiv").style.display="block";
		}
		
		function addCa(){
			formclose();
			document.getElementById("addCa").style.display="block";
			showForm();
			formclear();
			document.getElementById("ccode").value=document.getElementById("hcode").value;
			
		}
		
		function updateCa(obj){
			formclose();
			document.getElementById("updateCa").style.display="block";
			showForm();
			formclear();
			var a=document.getElementById("up_tab");
			var rownum = obj.parentNode.parentNode.rowIndex;
 			var Cacode = a.rows.item(rownum).cells.item(0).innerText;
			var Caname = a.rows.item(rownum).cells.item(1).innerText;
			var Caaddres = a.rows.item(rownum).cells.item(2).innerText;
			
			document.getElementById("ccode").value=Cacode;
			document.getElementById("cname").value=Caname;
			document.getElementById("caddress").value=Caaddres;
			
		}
		
		function formclose(){
			document.getElementById("formdiv").style.display="none";
			document.getElementById("addCa").style.display="none";
			document.getElementById("updateCa").style.display="none";
		}
		
		function formclear(){
			document.getElementById("ccode").value="";
			document.getElementById("cname").value="";
			document.getElementById("caddress").value="";
		}
		
	</SCRIPT>
	<base target="_self"> 
	<body class="sub1_body">
		<div class="sub1_title"><img src="<%=base%>/images/img01.gif">货位信息</div>
		<div class="sub1_con">
		<div><a href="#" onclick="addCa()" class="a_top"><img src="<%=base%>/images/img06.gif" border="0" class="a_top" alt="添加" title="添加">添加</a>
		<div id="formdiv"  style="display:<s:property value="storehouse.s_value"/>">
			<s:form action="AddCargoSpace" theme="simple" id="caForm" > 
				<div>货位编号:
					<s:textfield id="ccode" name="cargoSpace.cargoSpaceCode" value="%{cargoSpace.cargoSpaceCode}" readonly="true" cssClass="sub1_border"/>
					<s:hidden id="hcode" value="%{cargoSpace.cargoSpaceCode}"></s:hidden>
					<font color="red" id="ccode_f"></font>
				</div>
				<div>货位名:&nbsp;&nbsp;&nbsp;&nbsp;
					<s:textfield id="cname" name="cargoSpace.cargoSpaceName" value="" cssClass="sub1_border"/>
					<font color="red" id="cname_f"></font>
				</div>
				<div>所在地:&nbsp;&nbsp;&nbsp;&nbsp;
					<s:textfield id="caddress" name="cargoSpace.cargoSpaceAddress" cssClass="sub1_border"/>
				</div>
				<div>所属仓库:
					<s:textfield name="cargoSpace.storehouseName" value="%{storehouse.storehouseName}" cssClass="sub1_border" readonly="true"/>
					<s:hidden name="cargoSpace.storehouseCode" value="%{storehouse.storehouseCode}"/>
					
					<s:hidden name="storehouse.storehouseName" value="%{storehouse.storehouseName}"/>
					<s:hidden name="storehouse.storehouseCode" value="storehouse.storehouseCode"/>
					<s:hidden id="next" name="cargoSpace.s_value" value=""/>
				</div>
				<div id="addCa" style="display:<s:property value="storehouse.s_value"/>">
					<a href="#" onclick="save_close()"><img src="<%=base%>/images/sub1_btn_save_closed.jpg" style="margin-top:5px;margin-left:5px;" border="0" alt="保存并关闭" title="保存并关闭"></a>
					<a href="#" onclick="save_next()"><img src="<%=base%>/images/sub1_btn_save_add.jpg" style="margin-top:5px;margin-left:5px;"  border="0" alt="保存并添加" title="保存并添加"></a>
				</div>
				<div id="updateCa" style="display:none">
					<a href="#" onclick="update_close()"><img src="<%=base%>/images/sub1_btn_save.jpg" style="margin-top:5px;margin-left:5px;" align="middle" border="0" title="保存" alt="保存"></a>
				</div>
			</s:form>
		</div>
		<div>
		<table class="center_table" cellspacing="1" cellpadding="0" id="up_tab" style="width: 600px;">
	    <s:if test="lhp.size>0">
	    	<tr>
			    <td class="table_head">货位编号</td>
	    		<td class="table_head">货位名</td>
			    <td class="table_head">所在地</td>
			    <td class="table_head">操作</td>
	    	</tr>
	    </s:if>
	    <s:else>
	    	<tr>
	    	<td class="orgstructure_table_td_odd_r" colspan="5">
	    		未找到符合的信息!
	    	</td>
	    	</tr>
	    </s:else>
	       <s:iterator value="lhp" status="stat">
	      	<tr 
	       		<s:if test="#stat.even">
	       			class="table_tr_odd"
		       	</s:if>
		       	<s:else>
	       			class="table_tr__even"
	       		</s:else>
	       	>
       		<td><s:property value="cargoSpaceCode"/></td>
	        <td><s:property value="cargoSpaceName"/></td>
	        <td><s:property value="cargoSpaceAddress"/></td>
	       	<td><a href="#" onclick="updateCa(this)"><img src="<%=base%>/images/img03.gif" border="0" alt="编辑" title="编辑"></a></td>
	       	</tr>
	       </s:iterator>
	     </table>
	     <div style="margin-top: 8px;margin-left: 10px;">
	     <a href="#" onclick="sub_back()"><img src="<%=base%>/images/back.gif" alt="返回" title="返回" border="0"></a>
	     </div>
	     </div>
		</div>
    </body>
</html>