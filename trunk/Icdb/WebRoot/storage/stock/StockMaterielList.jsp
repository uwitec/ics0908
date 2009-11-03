<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<% String base=request.getContextPath(); %>
<html>
    <head>
        <title>初期库存</title>
			<link href="<%=base%>/css/left_css.css" type="text/css" rel="stylesheet">
		<link href="<%=base%>/css/body_css.css" type="text/css" rel="stylesheet">
		<link href="<%=base%>/css/center_css.css" type="text/css" rel="stylesheet">
		<link href="<%=base%>/css/form_css.css" type="text/css" rel="stylesheet">
	</head>
<body>
<script type="text/javascript" src="<%=base%>/javascript/innerText.js"></script>
  <SCRIPT type="text/javascript">
    	function addStock(){
    		var tab_dis=document.getElementById("inputValue");
    		tab_dis.style.display="block";
    	}
    	function showMateriel(){
		window.showModalDialog("<%=base%>/baseset/FindMateriel.action","","dialogHeight:400px;dialogWidth:650px");
		}
		
		function checkAdd(){
			var materielCode=document.getElementById("materielCode");
			var stockPrice=document.getElementById("stockPrice");
			var amount=document.getElementById("amount");
			var cacode=document.getElementById("cacode");
			formclear();
			if(trim(materielCode.value)==''){
				document.getElementById("erro1").innerHTML="该信息不能为空";
				return false;
			}
			if(trim(stockPrice.value)==''){
				document.getElementById("erro2").innerHTML="该信息不能为空";
				return false;
			}
			if(trim(amount.value)==''){
				document.getElementById("erro3").innerHTML="该信息不能为空";
				return false;
			}
			if(trim(cacode.value)==''){
				document.getElementById("erro4").innerHTML="该信息不能为空";
				return false;
			}
			return true;
		}
		function formclear(){
		document.getElementById("erro1").innerHTML="";
		document.getElementById("erro2").innerHTML="";
		document.getElementById("erro3").innerHTML="";
		document.getElementById("erro4").innerHTML="";
		}
		
		function formsubmit(){
		
			if(checkAdd()){
				addForm.submit();
			}
		}
    </SCRIPT>
	<body topmargin="0">
	<div class="body_div">
		<jsp:include flush="true" page="/pagecom/head.jsp"></jsp:include>
		<div class="left_body">
		<jsp:include flush="true" page="/main/left_.jsp"></jsp:include>
		<div class="center_body">
			<div class="center_head_text">初期库存</div>
			<div class="center_tools">
			<s:push value="storehouse">
			所属仓库：<s:property value="storehouse.storehouseName"/>
			仓库负责人:<s:property value="storehouse.personName"/>
			</s:push>
			</div>	
		</div>
		<div class="center_boder">
		<div  id="inputValue">
		<s:form action="AddStock" theme="simple" name="addForm">
		<table class="center_table" style="border: 0px;">
			<tr class="table_tr_left">
			<td>
			<s:hidden id="materielCode" name="stock.materielCode"></s:hidden>
			物料:<s:textfield id="materielName" cssClass="sub1_border" name="stock.materielName" onclick="showMateriel()"/>
		    <a href="#" onclick="showMateriel()" class="a_top"><img src="<%=base%>/images/img06.gif" title="选择物料" alt="选择物料" border="0" class="a_top">选择物料</a>
		    <font id="erro1" color="red"></font>
		    </td></tr>
		    <tr class="table_tr_left"><td colspan="2">
			库位:<s:select id="cacode" cssClass="sub1_border" list="lcsb" listKey="cargoSpaceCode" listValue="cargoSpaceName" name="stock.cargoSpaceCode"/>
			<font id="erro4" color="red"></font>
			</td></tr>
			<tr class="table_tr_left"><td>
			单价:<s:textfield cssClass="sub1_border" id="stockPrice" name="stock.stockPrice"/>
			    <font id="erro2" color="red"></font>
			</td></tr>
			<tr class="table_tr_left"><td>
			数量:<s:textfield cssClass="sub1_border" id="amount" name="stock.stockAmount"/>
			    <font id="erro3" color="red"></font>
			</td></tr>
		</table>
		<div style="margin-left: 10px;margin-top: 8px;">
		<a href="#" onclick="formsubmit()"><img src="<%=base%>/images/add.jpg" border="0" title="添加" alt="添加"/></a>
		</div>
		</s:form>
		</div>
		<table class="center_table" cellspacing="1" cellpadding="0">
	    <s:if test="lhp.size>0">
	    	<tr class="table_head">
			   <th class="table_head">物料名称</th>
		    	<th class="table_head">库位名称</th>
		    	<th class="table_head">单价</th>
		    	<th class="table_head">数量</th>
	    	</tr>
	    </s:if>
	    <s:else>
	    	<tr>
	    	<td class="table_tr_no" colspan="5">
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
       		<td><s:property value="materielName"/></td>
	       	<td><s:property value="cargoSpaceName"/></td>
	       	<td><s:property value="stockPrice"/></td>
	       	<td><s:property value="stockAmount"/></td>
	       </s:iterator>
	     </table>
		<div class="pages">
		</div>
		</div>
		<div class="center_boder_foot"></div>
		<jsp:include flush="true" page="/main/bottom_.jsp"></jsp:include>
		</div>
	</div>
</body>
</html>