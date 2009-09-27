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
	   <title>盘点</title>
	</HEAD>
<script type="text/javascript" src="<%=base%>/javascript/innerText.js"></script>
<SCRIPT type="text/javascript">

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
	<body class="stock_body">
		<div class="stock_title"><img src="<%=base%>/images/img01.gif">盘点信息</div>
		<div class="stock_con">
			
		<div>
		<table class="stock_table" cellpadding="0" cellspacing="0" width="100%" border="0">
		    <tr class="stock_tr">
		    	<td>盘点单号:
		    	<s:property value="%{checkStock.csCode}"/>
		    	</td>
		    	<td>盘点库房
		    	<s:property value="%{checkStock.storehouseName}"/>
		    	</td>
		    </tr>
		    <tr class="stock_tr">
		    	<td>盘点时间：
		    	<s:property value="%{checkStock.csDate}"/>
		    	</td>
		    	<td>审批人：
		    	<s:property value="%{checkStock.csCheckPerson}"/><s:hidden name="checkStock.csCheckPerson" value="%{checkStock.csCheckPerson}"></s:hidden>
		    	</td>
		    </tr>
		    <tr class="stock_tr">
		    	<td colspan="2">操作员：
		    	<s:property value="%{checkStock.personName}"/>
		    	<s:hidden name="checkStock.csOptionor" value="%{checkStock.csOptionor}"></s:hidden>
		    	</td>
		    </tr>
		</table>
		</div>
		<div style="width: 800px;margin-top: 8px;">
		<table id="addMatail"  class="stock_table" width="850">
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
	    			<tr class="stock_tr">
			    		<td colspan="19">
			    			审核意见:<br/>
			    			<textarea Class="stock_textarea" rows="8" cols="90%" name="%{checkStock.csApproveMessage}"></textarea>
			    		</td>
    				</tr> 	
			</table>
			</div>
		</div>
		 <SCRIPT type="text/javascript">
	    	get_init();
	    </SCRIPT>
    </body>
</html>