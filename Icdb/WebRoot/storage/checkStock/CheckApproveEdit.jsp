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

	function sub_approve(){
		if(confirm("是否完成，并完成库存盘点？")){
			document.getElementById("app_state").value=1;
			document.getElementById("start_stock").value=1;
        	ApproveCheck.submit();
    		}
    	else {
	       return false;
	    }
	}
	
	function sub_noapprove(){
		if(confirm("是否确定该审核不通过？")){
			document.getElementById("app_state").value=2;
			document.getElementById("cs_state").value=2;
        	ApproveCheck.submit();
    		}
    	else {
	       return false;
	    }
	}
	
	function get_init(){
		var a=document.getElementById("checkListMater");
		for(var i=3;i<a.rows.length;i++){
			getPrice(i);
		}
	}

	function getPrice(tab){
		var t_id=document.getElementById("checkListMater");
	//	var row_id=tab.parentNode.parentNode.rowIndex;
		var row_id=tab;
		var amount_st = trim(t_id.rows.item(row_id).cells.item(2).innerText);
		var price_st = trim(t_id.rows.item(row_id).cells.item(3).innerText);
		var amount_end = t_id.rows.item(row_id).cells.item(5).innerText;
		var price_end = t_id.rows.item(row_id).cells.item(6).innerText;
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
    <s:form action="UpdateCheckApprove" theme="simple" name="ApproveCheck">
    <table width="120%" border="1">
	    <tr>
		    <td>
			    <table>
				    <tr>
				    	<td>盘点单号:
				    	<s:property value="%{checkStock.csCode}"/>
				    	<s:hidden name="checkStock.csCode" value="%{checkStock.csCode}"></s:hidden>
				    	</td>
				    	<td>盘点库房
				    	<s:property value="%{checkStock.storehouseName}"/>
				    	<s:hidden name="checkStock.storehouseCode" value="%{checkStock.storehouseCode}"></s:hidden>
				    	</td>
				    </tr>
				    <tr>
				    	<td>盘点时间：
				    	<s:property value="%{checkStock.csDate}"/>
				    	<s:hidden name="checkStock.csDate" value="%{checkStock.csDate}"></s:hidden>
				    	</td>
				    	<td>审批人：
				    	<s:property value="%{checkStock.csCheckPerson}"/>
				    	<s:hidden name="checkStock.csCheckPerson" value="%{checkStock.csCheckPerson}"></s:hidden>
				    	</td>
				    </tr>
				    <tr>
				    	<td>操作员：
				    	<s:property value="%{checkStock.personName}"/>
				    	<s:hidden name="checkStock.csOptionor" value="%{checkStock.csOptionor}"></s:hidden>
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
	    			<s:iterator value="list_CheckstockList">
	    				<tr align="right">
	    					<td><s:property value="%{materielName}"/></td>
	    					<td><s:property value="%{cargoSpaceName}"/></td>
	    					<td><s:property value="%{csStartNumber}"/></td>
	    					<td><s:property value="%{csStartPrice}"/></td>
	    					<td><s:property value="%{csStartNumber*csStartPrice}"/></td>
	    					<td><s:property value="%{csCheckNumber}"/></td>
	    					<td><s:property value="%{csCheckPrice}"/></td>
	    					<td>0</td>
	    					<td>0</td>
	    					<td>0</td>
	    					<td>0</td>
	    					<td>0</td>
	    					<td>0</td>
	    					<td>0</td>
	    					<td>0</td>
	    					<td>0</td>
	    					<td>
	    					<s:if test="csDiffMessage!=''">
	    					<s:property value="%{csDiffMessage}"/>
	    					</s:if>
	    					<s:else>
	    					无
	    					</s:else>
	    					</td>
	    					<td>
	    					<s:if test="csRemark!=''">
	    					<s:property value="%{csRemark}"/>
	    					</s:if>
	    					<s:else>
	    					无
	    					</s:else></td>
	    					<td>
	    					<s:if test="csGM!=''">
	    					<s:property value="%{csGM}"/>
	    					</s:if>
	    					<s:else>
	    					无
	    					</s:else></td>
	    				</tr>
	    			</s:iterator>
	    		</table>
	    	</td>
	    </tr>
    </table>
    <table>
    	<tr>
    		<td>
    			<textarea rows="8" cols="40" name="checkStock.csApproveMessage"></textarea>
    			<s:hidden id="app_state" name="checkStock.csApproveState" value="0"></s:hidden>
    			<s:hidden id="start_stock" name="checkStock.csStartStock" value="%{checkStock.csStartStock}"></s:hidden>
    			<s:hidden id="cs_state" name="checkStock.csState" value="%{checkStock.csState}"></s:hidden>
    		</td>
    	</tr> 		
    	<tr>
    		<td>
    			<input type="button" value="审核通过" onclick="sub_approve()">
    			<input type="button" value="审核不通过" onclick="sub_noapprove()">
    		</td>
    	</tr>
    </table>
    </s:form>
    <SCRIPT type="text/javascript">
    	get_init();
    </SCRIPT>
    </body>
</html>