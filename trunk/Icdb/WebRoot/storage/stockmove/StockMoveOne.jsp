<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<% 
String base=request.getContextPath(); 
%>
    <head>
    <link href="<%=base%>/css/form_css.css" type="text/css" rel="stylesheet">
		<link href="<%=base%>/css/body_css.css" type="text/css" rel="stylesheet">
		<link href="<%=base%>/css/center_css.css" type="text/css" rel="stylesheet">
		<link href="<%=base%>/css/stock_css.css" type="text/css" rel="stylesheet">
	   <title>调拨信息</title>
	</HEAD>
<script type="text/javascript" src="<%=base%>/javascript/innerText.js"></script>
<SCRIPT type="text/javascript">
		function DeleteTable(obj){
			
    		  tblObj = document.getElementById("MoveTab");
			  var rownum= obj.parentNode.parentNode.rowIndex;
			  
			      tblObj.deleteRow(rownum);    
    	}
    	
    	function submitSava(){
    		document.getElementById("sub_state").value="2";
    		moveForm.submit();
    	}
    	
    	function submitComplete(){
    		document.getElementById("sub_state").value="1";
    		moveForm.submit();
    	}
    	
    	function numCheck(obj){
    		if(!isNumber(obj.value,10)){
    			obj.value="0";
    		}
    	}
</SCRIPT>
	<body class="stock_body">
		<div class="stock_title"><img src="<%=base%>/images/img01.gif">调拨信息</div>
		<div class="stock_con">
			
		<s:form action="AddOrUpdateStockMove" theme="simple" namespace="/storage" name="moveForm">
		<div>
		<table class="stock_table" cellpadding="0" cellspacing="0" width="100%" border="0">
		    <tr class="stock_tr">
		    	<td>调拨单号：
		    	<s:property value="%{transferOrder.transferOrderCode}"/>
		    	</td>
		    	<td>调拨库房：
		    	<s:property value="%{storhouse.storehouseName}"/>
		    	</td>
		    </tr>
		    <tr class="stock_tr">
		    	<td>调拨时间：
		    	<s:property value="%{transferOrder.transferOrderTime}"/>
		    	</td>
		    	<td>调拨类型：
		   		 <s:iterator value="tranf_type" status="inner">
	       			<s:if test="key==transferOrder.transferOrderType">
	       				<s:property value="value"/>
	       			</s:if>
	       		</s:iterator>
		    	</td>
	
		    </tr>
		    <tr class="stock_tr">
		    	<td>
		    	</td>
		    	<td>调拨人:
		    	 	
		    	   	</td>
		    </tr>
		</table>
		</div>

		<div style="width: 800px;margin-top: 8px;">
		<table class="stock_table" width="650" id="MoveTab">
		<s:if test="transferlist.size>0">
	    	<tr class="table_tr__even">
			    <th>调拨物品</th>
		    	<th>调拨库位</th>
		    	<th>调拨目的库位</th>
		    	<th>调拨数目</th>
		    	<th>物料价格</th>
	    	</tr>
	    </s:if>
	    <s:else>
	    	<tr>
	    	<td class="table_tr_no" colspan="5">
	    		没有相应的货物
	    	</td>
	    	</tr>
	    </s:else>
	    <s:iterator value="transferlist" status="stat">
	      	<tr 
	       		<s:if test="#stat.even">
	       			class="table_tr_odd"
		       	</s:if>
		       	<s:else>
	       			class="table_tr__even"
	       		</s:else>
	       	>
	       	<td>
		       	<s:hidden value="%{materielCode}" name="tranfermater.materielCode"/>
		       	<s:property value="materielName"/>
	       	</td>
	       	<td>
	       		<s:hidden value="%{cargoSpaceCode}" name="tranfermater.cargoSpaceCode"/>
	       		<s:property value="%{storhouse.storehouseName}"/>
	       		<font color="red">——</font>
	       		<s:property value="%{cargoSpaceName}"/>
	       	</td>
	       	<td>
	       			<s:doubleselect disabled="true" id="%{materielCode+cargoSpaceCode}" doubleId="%{cargoSpaceCode+materielCode}" doubleCssClass="sub1_border" cssClass="sub1_border" 
	       		list="houselist" listKey="storehouseCode" listValue="storehouseName" theme="simple"
               doubleName="tranfermater.newcargoSpaceCode" doubleValue="newcargoSpaceCode" doubleList="cardoublelist.get(top.storehouseCode)" doubleListKey="cargoSpaceCode" doubleListValue="cargoSpaceName"/>
	    		
	        </td>
	       	<td>
	       	<s:property value="%{moveAmount}"/>
	       	</td>
	       	<td>
	       	<s:hidden value="%{stockPrice}" name="tranfermater.stockPrice"/>
	       	<s:property value="%{stockPrice}"/>
	       	</td>
	    </tr>
	    </s:iterator>
		</table>
			</div>
		</s:form>
		</div>
    </body>
</html>