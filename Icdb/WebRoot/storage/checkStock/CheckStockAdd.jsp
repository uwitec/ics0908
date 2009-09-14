<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
    <head>
        <title>新增盘点信息</title>
    </head>
    <base/>
<% 
String base=request.getContextPath();
%>
<script type="text/javascript" src="<%=base%>/javascript/innerText.js"></script>
<SCRIPT type="text/javascript">

	function getPrice(tab){
		var t_id=document.getElementById("checkListMater");
		var row_id=tab.parentNode.parentNode.rowIndex;
		var amount_st = trim(t_id.rows.item(row_id).cells.item(2).innerText);
		var price_st = trim(t_id.rows.item(row_id).cells.item(3).innerText);
		var amount_end = t_id.rows.item(row_id).cells.item(5).firstChild.value;
		var price_end = t_id.rows.item(row_id).cells.item(6).firstChild.value;
		
	    t_id.rows.item(row_id).cells.item(7).innerHTML=parseFloat(amount_end)*parseFloat(price_end);
	    getAmount(row_id,amount_st,amount_end,price_end);
	    getMoney(row_id,price_st,price_end,amount_end);
	}

	function getAmount(row_id,num_s,num_e,price){
		var t_id=document.getElementById("checkListMater");
		var temp;
		if(parseFloat(num_s)>parseFloat(num_e)){
			temp=parseFloat(num_s)-parseFloat(num_e);
			t_id.rows.item(row_id).cells.item(8).innerHTML=0;
			t_id.rows.item(row_id).cells.item(9).innerHTML=0;
			t_id.rows.item(row_id).cells.item(10).innerHTML="-"+temp;
			t_id.rows.item(row_id).cells.item(11).innerHTML="-"+temp*price;
		}else{
			temp=parseFloat(num_e)-parseFloat(num_s);
			t_id.rows.item(row_id).cells.item(8).innerHTML=temp;
			t_id.rows.item(row_id).cells.item(9).innerHTML=temp*price;
			t_id.rows.item(row_id).cells.item(10).innerHTML=0;
			t_id.rows.item(row_id).cells.item(11).innerHTML=0;
		}
	}
	
	function getMoney(row_id,prce_s,prce_e,amount){
		var t_id=document.getElementById("checkListMater");
		var temp;
		if(parseFloat(prce_s)>parseFloat(prce_e)){
			temp=parseFloat(prce_s)-parseFloat(prce_e);
			t_id.rows.item(row_id).cells.item(12).innerHTML=0;
			t_id.rows.item(row_id).cells.item(13).innerHTML=0;
			t_id.rows.item(row_id).cells.item(14).innerHTML="-"+temp;
			t_id.rows.item(row_id).cells.item(15).innerHTML="-"+temp*amount;
		}else{
			temp=parseFloat(prce_e)-parseFloat(prce_s);
			t_id.rows.item(row_id).cells.item(12).innerHTML=temp;
			t_id.rows.item(row_id).cells.item(13).innerHTML=temp*amount;
			t_id.rows.item(row_id).cells.item(14).innerHTML=0;
			t_id.rows.item(row_id).cells.item(15).innerHTML=0;
		}
	
	}
	
</SCRIPT>
    <body>
    <s:form action="AddCheckStock" theme="simple">
    <table width="120%" border="1">
	    <tr>
		    <td>
			    <table>
				    <tr>
				    	<td>盘点单号:
				    	<s:hidden name="checkStock.csCode" value="%{checkStock.csCode}"></s:hidden>
				    	<s:property value="%{checkStock.csCode}"/>
				    	</td>
				    	<td>盘点库房
				    	<s:hidden name="checkStock.storehouseCode" value="%{checkStock.storehouseCode}"></s:hidden>
				    	<s:property value="%{checkStock.storehouseName}"/>
				    	</td>
				    </tr>
				    <tr>
				    	<td>盘点时间：
				    	<s:hidden name="checkStock.csDate" value="%{checkStock.csDate}"></s:hidden>
				    	<s:property value="%{checkStock.csDate}"/>
				    	</td>
				    	<td>审批人：
				    	</td>
				    </tr>
			    </table>
		    </td>
	    </tr>
	    <tr>
	    	<td>
	    		<table border="1" width="100%" id="checkListMater">
	    			<tr align="center">
	    				<td rowspan="3">产品名</td>
	    				<td rowspan="3">库位</td>
	    				<td rowspan="2" colspan="3">账面资料</td>
	    				<td rowspan="2" colspan="3">盘点实存</td>
	    				<td colspan="4">数量盈亏</td>
	    				<td colspan="4">价格增减</td>
	    				<td rowspan="3">差异原因</td>
	    				<td rowspan="3">责任人</td>
	    				<td rowspan="3">备注</td>
	    			</tr>
	    			<tr align="center">
	    				<td colspan="2">盘盈</td>
	    				<td colspan="2">盘亏</td>
	    				<td colspan="2">增价</td>
	    				<td colspan="2">减价</td>
	    			</tr>
	    			<tr align="center">
	    				<td>数量</td>
	    				<td>单价</td>
	    				<td>金额</td>
	    				<td>数量</td>
	    				<td>单价</td>
	    				<td>金额</td>
						<td>数量</td>
	    				<td>金额</td>
	    				<td>数量</td>
	    				<td>金额</td>
	    				<td>单价</td>
	    				<td>金额</td>
	    				<td>单价</td>
	    				<td>金额</td>
	    			</tr>
	    			<s:iterator value="list_stock">
	    				<tr align="right">
	    					<td>
	    					<s:property value="%{materielName}"/>
	    					<s:hidden name="checkStockList.materielCode" value="%{materielCode}"/></td>
	    					<td>
	    					<s:property value="%{cargoSpaceName}"/>
	    					<s:hidden name="checkStockList.cargoSpaceCode" value="%{cargoSpaceCode}"></s:hidden>
	    					</td>
	    					<td>
	    					<s:property value="%{stockAmount}"/>
	    					<s:hidden name="checkStockList.t_StartNumber" value="%{stockAmount}"/>
	    					</td>
	    					<td>
	    					<s:property value="%{stockPrice}"/>
	    					<s:hidden name="checkStockList.t_StartPrice" value="%{stockPrice}"/>
	    					</td>
	    					<td><s:property value="%{stockAmount*stockPrice}"/></td>
	    					<td><s:textfield size="5" name="checkStockList.t_CheckNumber" value="%{stockAmount}" onchange="getPrice(this)"/></td>
	    					<td><s:textfield size="5" name="checkStockList.t_CheckPrice" value="%{stockPrice}" onchange="getPrice(this)"/></td>
	    					<td>0</td>
	    					<td>0</td>
	    					<td>0</td>
	    					<td>0</td>
	    					<td>0</td>
	    					<td>0</td>
	    					<td>0</td>
	    					<td>0</td>
	    					<td>0</td>
	    					<td><input size="10" type="text" name="checkStockList.csDiffMessage" value=" "></td>
	    					<td><input size="10" type="text" name="checkStockList.csRemark" value=" "></td>
	    					<td><input size="10" type="text" name="checkStockList.csGM" value=" "></td>
	    				</tr>
	    			</s:iterator>
	    			<tr><td colspan="18">
	    			<input type="submit" value="完成"/>
	    			</td></tr>
	    		</table>
	    	</td>
	    </tr>
    </table>
    </s:form>
    </body>
</html>