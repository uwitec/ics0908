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
	   <title>报损单信息</title>
	</HEAD>
	<script type="text/javascript" src="<%=base%>/javascript/innerText.js"></script>
	<script type="text/javascript">
		 function getPrice(row_){
	 		var a = document.getElementById("was_tab");
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
		  	var a = document.getElementById("was_tab");
		  	var sumPrice=0;
		  	for(var row = 6; row < a.rows.length; row++){
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
	<base target="_self"> 
	<body class="sub1_body">
		<div class="sub1_title"><img src="<%=base%>/images/img01.gif">报损单信息</div>
		<div class="sub1_con">
		<div>
		<table width="600" style="background-color:#B4BCC2;border:0px;margin-left:11px;" cellspacing="1" cellpadding="0" id="was_tab">
	     <s:push value="wasTage">
	    	<tr class="table_tr_left"><td colspan="6">报损单号：<font color="red"><s:property value="wasCode"/></font></td></tr>
	    	<tr class="table_tr_left"><td colspan="6">报损时间：<s:property value="wasTime"/></td></tr>
	    	<tr class="table_tr_left">
	    	<td colspan="6">报损类型：
	    		<s:iterator value="wasTypeList" status="inner">
	       			<s:if test="key==wasType">
	       				<s:property value="value"/>
	       			</s:if>
	       		</s:iterator>
	       	</td></tr>
	    	<tr class="table_tr_left"><td colspan="6">报损相关单据：<s:property value="wasDoc"/></td></tr>
	     </s:push>
	     <tr class="table_tr_right"><td colspan="6" width="100%"  align="right" id="sumTD">总金额:0</td></tr>
	     <tr class="table_head"><td>物料编号</td><td>物料</td><td>单价</td><td>数量</td><td>报损总额</td><td>报损原因</td></tr>
	       <s:iterator value="lwb" status="stat">
	      	<tr 
	       		<s:if test="#stat.even">
	       			class="table_tr_odd"
		       	</s:if>
		       	<s:else>
	       			class="table_tr__even"
	       		</s:else>
	       	>
    		<td><s:property value="materielCode"/></td>
    		<td><s:property value="materielName"/></td>
    		<td><s:property value="wasMoney"/></td>
    		<td><s:property value="wasNumber"/></td>
    		<td>&nbsp;</td>
    		<td><s:property value="wasCause"/>&nbsp;</td></tr>
       		</s:iterator>
		    </table>
	     </div>
		</div>
		<SCRIPT type="text/javascript">
			getSumPrice();
		</SCRIPT>
    </body>
</html>