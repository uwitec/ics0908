<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html>
    <head>
        <title>报损单</title>
    </head>
<% 
String base=request.getContextPath();
%>
<script type="text/javascript" src="<%=base%>/javascript/innerText.js"></script>
 <script type="text/javascript">
		 function getPrice(row_){
	 		var a = document.getElementById("materlist");
	 		var stockInAmount = a.rows.item(row_).cells.item(2).innerHTML;
	 		var stockPrice = a.rows.item(row_).cells.item(3).innerHTML;
 			if(stockPrice ==''){
 				stockPrice=0;
 			}
	 		if(stockInAmount == ''){
	 			stockInAmount=0;
	 		}	
	 		a.rows.item(row_).cells.item(4).innerHTML=stockPrice*stockInAmount;
 		}
 		
 		function getSumPrice(){
		  	var a = document.getElementById("materlist");
		  	var sumPrice=0;
		  	for(var row = 1; row < a.rows.length; row++){
		  			getPrice(row);
		  		var price = a.rows.item(row).cells.item(4).innerText;
		  		if(price != ''){
		  			sumPrice = parseFloat(sumPrice)+parseFloat(price);
		  		}
		  	}
		  	var sum = document.getElementById("sumTD");
		  	sum.innerHTML="总金额:"+sumPrice;
	  }
	
	</script>
	<body onload="getSumPrice()">
	
	<s:form theme="simple">
	<table id="addWas"  border="1" width="85%">
		<s:push value="wasTage">
    	<tr><td>报损单号：<s:property value="wasCode"/></td></tr>
    	<tr><td>报损时间：<s:property value="wasTime"/></td></tr>
    	<tr><td>报损类型：<s:property value="wasType"/></td></tr>
    	<tr><td>报损相关单据：<s:property value="wasDoc"/></td></tr>
    	</s:push>
    	<tr><td>
    	<Table border="1" width="100%" id="materlist">
    	<tr><td>物料编号</td>
    	<td>物料</td>
    	<td>单价</td>
    	<td>数量</td>
    	<td>报损总额</td>
    	<td>报损原因</td></tr>
    	<s:iterator value="lwb">
    		<tr><td><s:property value="materielCode"/></td>
    		<td><s:property value="materielName"/></td>
    		<td><s:property value="wasMoney"/></td>
    		<td><s:property value="wasNumber"/></td>
    		<td>&nbsp;</td>
    		<td><s:property value="wasCause"/>&nbsp;</td></tr>
    	</s:iterator>
    	</table>
    	</td></tr>
    	<tr><td colspan="6" width="100%"  align="right" id="sumTD">总金额:0
    	</td></tr>
    </table>
    </s:form>
   
	</body>
</html>