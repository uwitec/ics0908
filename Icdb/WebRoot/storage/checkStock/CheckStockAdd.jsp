<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<% 
String base=request.getContextPath(); 
%>
    <head>
       <link href="<%=base%>/css/sub.css" type="text/css" rel="stylesheet">
		<link href="<%=base%>/css/body_css.css" type="text/css" rel="stylesheet">
		<link href="<%=base%>/css/center_css.css" type="text/css" rel="stylesheet">
		<link href="<%=base%>/css/stock_css.css" type="text/css" rel="stylesheet">
	   <title>盘点信息</title>
	</HEAD>
<script type="text/javascript" src="<%=base%>/javascript/innerText.js"></script>
<SCRIPT type="text/javascript">

	function sub_back(){
		if(confirm("是否终止当前工作，返回上一页？")){
			window.location.href="ShowCheck.action";
		}
	}
	function submitComplete(){
		if(confirm("是否完成，并提交审查？")){
        	checkUpdate.submit();
    		}
    	else {
	       return false;
	    }
	}
	
	function submitSava(){
		if(confirm("确定无误后，请确定！")){
			document.getElementById("sub_state").value=2;
			checkUpdate.submit();
		}else{
			return false;
		}
	
	}
	
	function get_init(){
		var a=document.getElementById("addMatail");
		for(var i=3;i<a.rows.length;i++){
			getPriceSum(i);
		}
	}
	
	function getPriceSum(tab){
		var t_id=document.getElementById("addMatail");
	//	var row_id=tab.parentNode.parentNode.rowIndex;
		var row_id=tab;
		var amount_st = trim(t_id.rows.item(row_id).cells.item(2).innerText);
		var price_st = trim(t_id.rows.item(row_id).cells.item(3).innerText);
		var amount_end = t_id.rows.item(row_id).cells.item(5).firstChild.value;
		var price_end = t_id.rows.item(row_id).cells.item(6).firstChild.value;
	    t_id.rows.item(row_id).cells.item(7).innerHTML=parseFloat(amount_end)*parseFloat(price_end);
	    getAmount(row_id,amount_st,amount_end,price_end);
	    getMoney(row_id,price_st,price_end,amount_end);
	}

	function getPrice(tab){
		var t_id=document.getElementById("addMatail");
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
		var t_id=document.getElementById("addMatail");
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
		var t_id=document.getElementById("addMatail");
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
	<body class="stock_body">
		<div class="stock_title"><img src="<%=base%>/images/img01.gif">编辑盘点信息</div>
		<div class="stock_con">
			
		<s:form action="UpdateCheckStock" theme="simple" namespace="/storage" name="checkUpdate">
		<div>
		<table class="stock_table" cellpadding="0" cellspacing="0" width="100%" border="0">
		    <tr class="stock_tr">
		    	<td>盘点单号:
		    	<s:hidden name="checkStock.csCode" value="%{checkStock.csCode}"/>
		    	<s:property value="%{checkStock.csCode}"/>
		    	</td>
		    	<td>盘点库房:
		    	<s:hidden name="checkStock.storehouseCode" value="%{checkStock.storehouseCode}"/>
		    	<s:property value="%{checkStock.storehouseName}"/>
		    	</td>
		    </tr>
		    <tr class="stock_tr">
		    	<td>盘点时间:
		    	<s:hidden name="checkStock.csDate" value="%{checkStock.csDate}"/>
		    	<s:property value="%{checkStock.csDate}"/>
		    	</td>
		    	<td>操作员:
		    	<s:hidden name="checkStock.csOptionor" value="%{checkStock.csOptionor}"/>
		    	<s:property value="%{checkStock.personName}"/>
		    	</td>
		    </tr>
		</table>
		</div>

		<div style="width: 800px;margin-top: 8px;">
		<table id="addMatail"  class="stock_table" width="900">
			<tr class="table_tr__even">
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
	    			<tr  class="table_tr__even">
	    				<td colspan="2">盘盈</td>
	    				<td colspan="2">盘亏</td>
	    				<td colspan="2">增价</td>
	    				<td colspan="2">减价</td>
	    			</tr>
	    			<tr  class="table_tr__even">
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
	    			<tr 
			       		<s:if test="#list_CheckstockList.even">
			       			class="table_tr_odd"
				       	</s:if>
				       	<s:else>
			       			class="table_tr__even"
			       		</s:else>
			       	>
	    					<td>
	    					<s:property value="%{materielName}"/>
	    					<s:hidden name="checkStockList.materielCode" value="%{materielCode}"/></td>
	    					<td>
	    					<s:property value="%{cargoSpaceName}"/>
	    					<s:hidden name="checkStockList.cargoSpaceCode" value="%{cargoSpaceCode}"></s:hidden>
	    					</td>
	    					<td>
	    					<s:property value="%{csStartNumber}"/>
	    					<s:hidden name="checkStockList.t_StartNumber" value="%{csStartNumber}"/>
	    					</td>
	    					<td>
	    					<s:property value="%{csStartPrice}"/>
	    					<s:hidden name="checkStockList.t_StartPrice" value="%{csStartPrice}"/>
	    					</td>
	    					<td><s:property value="%{csStartNumber*csStartPrice}"/></td>
	    					<td><s:textfield cssClass="stock_border" cssStyle="width:50px;" name="checkStockList.t_CheckNumber" value="%{csCheckNumber}" onchange="getPrice(this)"/></td>
	    					<td><s:textfield cssClass="stock_border" cssStyle="width:50px;" name="checkStockList.t_CheckPrice" value="%{csCheckPrice}" onchange="getPrice(this)"/></td>
	    					<td>0</td>
	    					<td>0</td>
	    					<td>0</td>
	    					<td>0</td>
	    					<td>0</td>
	    					<td>0</td>
	    					<td>0</td>
	    					<td>0</td>
	    					<td>0</td>
	    					<td><input Class="stock_small_border" Style="width:50px;" type="text" name="checkStockList.csDiffMessage" value=" "></td>
	    					<td><input Class="stock_small_border" Style="width:50px;" type="text" name="checkStockList.csRemark" value=" "></td>
	    					<td><input Class="stock_small_border" Style="width:50px;" type="text" name="checkStockList.csGM" value=" "></td>
	    				</tr>
	    			</s:iterator>
			</table>
			</div>
			<div style="margin-top: 8px;margin-left:10px;">
				<input id="sub_state" type="hidden" value="1" name="checkStock.csState">
	    		<a href="#" onclick="submitSava()"><img src="<%=base%>/images/sub1_btn_save.jpg" border="0" alt="保存"></a>
				<a href="#" onclick="submitComplete()"><img src="<%=base%>/images/finish.jpg" border="0" alt="完成"></a>
				<a href="#" onclick="sub_back()"><img src="<%=base%>/images/back.gif" alt="返回" title="返回" border="0"></a>
			</div>
		</s:form>
		</div>
		 <SCRIPT type="text/javascript">
	    	get_init();
	    </SCRIPT>
    </body>
</html>