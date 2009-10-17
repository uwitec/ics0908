<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<% 
String base=request.getContextPath(); 
%>
    <head>
        <link href="<%=base%>/css/sub.css" type="text/css" rel="stylesheet">
        <link href="<%=base%>/css/center_css.css" type="text/css" rel="stylesheet">
	   <title>物料信息</title>
	</HEAD>
	<script type="text/javascript" src="<%=base%>/javascript/innerText.js"></script>
	<SCRIPT type="text/javascript">
	
		 function sendTo()
		 {
		    returnValue = getValue();
		 	window.returnValue = returnValue
		 	window.close()
		 }

		 function getValue(){
		 	var table = document.getElementById("mat_tab");
		 	var isChecked = document.getElementsByName("p_check");

			var materiels = new Array();

		 	for(var i=0; i<isChecked.length;i++){
		 		if(isChecked[i].checked){

		 			var materiel = new Materiel(table.rows.item(i+1).cells.item(1).innerHTML,
		 										table.rows.item(i+1).cells.item(2).innerHTML,
		 										table.rows.item(i+1).cells.item(3).innerHTML,
		 										table.rows.item(i+1).cells.item(4).innerHTML,
		 										table.rows.item(i+1).cells.item(5).firstChild.value,
		 										table.rows.item(i+1).cells.item(5).innerHTML);

					materiels.push(materiel);
		 		}

			}
			window.opener.document.getElementById("DocNum").value=document.getElementById("storeId").value;
			return materiels;
		 }

		 function Materiel(materielCode,materielName,stockPrice,stockAmount,cargoSpaceCode,cargoSpaceName){
		 	this.materielCode = materielCode;
		 	this.materielName = materielName;
		 	this.stockPrice = stockPrice;
		 	this.stockAmount = stockAmount;
		 	this.cargoSpaceCode = cargoSpaceCode;
		 	this.cargoSpaceName = cargoSpaceName;
		 }
		 
		 function formsubmit(){
		 	materStore.submit();
		 }

</SCRIPT>
	<base target="_self"> 
	<body class="sub1_body">
		<div class="sub1_title"><img src="<%=base%>/images/img01.gif">物料信息</div>
		<div class="sub1_con">
		   <div align="right">
		    <s:form action="ShowMaterStore" theme="simple" name="materStore">
		    <s:select id="storeId" list="lsb"  listKey="storehouseCode" listValue="storehouseName" name="stock.storehouseCode"/>
		    <input type="image" onclick="formsubmit()" src="<%=base%>/images/img09.gif" align="top"/>
		    </s:form>
		  	</div>
		<div>
		<table width="400" style="background-color:#B4BCC2;border:0px;margin-left:11px;" cellspacing="1" cellpadding="0" id="mat_tab">
	    <s:if test="lhp.size>0">
	    	<tr class="table_head">
	    		<td>选择</td>
		    	<td>编号</td>
		    	<td>名称</td>
				<td>价格</td>
				<td>数量</td>
				<td>库位</td>
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
	       		<td align="center"><input type="checkbox" name="p_check"/></td>
		 		<td><s:property value="materielCode"/></td>
				<td><s:property value="materielName"/></td>
				<td><s:property value="stockPrice"/></td>
				<td><s:property value="stockAmount"/></td>
				<td><s:property value="cargoSpaceName"/><s:hidden name="cargoSpaceCode" value="%{cargoSpaceCode}"/></td>
			</tr>
       		</s:iterator>
		    </table>
       		 <div style="margin-top: 8px;" align="right">  
		       </div>
				<div align="right">
       			<a href="#" onclick="sendTo()"><img src="<%=base%>/images/add.jpg" border="0"></a>
	      		</div>
	     </div>
		</div>
    </body>
</html>