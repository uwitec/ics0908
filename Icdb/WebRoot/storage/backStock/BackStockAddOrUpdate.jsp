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
	   <title>新增退货信息</title>
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
    		var countMax=document.getElementById("")
    		if(!isNumber(obj.value,10)){
    			obj.value="0";
    		}
    	}
</SCRIPT>
	<body class="stock_body">
		<div class="stock_title"><img src="<%=base%>/images/img01.gif">新增退货信息</div>
		<div class="stock_con">
			
		<s:form action="AddOrUpdateBackOrder" theme="simple" namespace="/storage" name="moveForm">
		<div>
		<table class="stock_table" cellpadding="0" cellspacing="0" width="100%" border="0">
		    <tr class="stock_tr">
		    	<td>退货单号：
		    	<s:hidden name="backstock.backOrderCode" value="%{backstock.backOrderCode}"/>
		    	<s:property value="%{backstock.backOrderCode}"/>
		    	</td>
		    	<td>出库单号：
		    	<s:property value="%{backstock.stockOutOrderCode}"/>
		    	<s:hidden name="backstock.stockOutOrderCode" value="%{backstock.stockOutOrderCode}"/>
		    	</td>
		    </tr>
		    <tr class="stock_tr">
		    	<td>退货时间：
		    	<s:hidden name="backstock.stockOutDate" value="%{backstock.stockOutDate}"/>
		    	<s:hidden name="backstock.rePath" value="%{backstock.rePath}"/>
		    	<s:property value="%{backstock.stockOutDate}"/>
		    	</td>
		    	<td>经手人:
		    	 	<s:textfield cssClass="sub1_border" name="backstock.stockPersion" value="%{backstock.stockPersion}"/>
		    	</td>
		    </tr>
		</table>
		</div>

		<div style="width: 800px;margin-top: 8px;">
		<table class="stock_table" width="650" id="MoveTab">
		<s:if test="lbh.size>0">
	    	<tr class="table_tr__even">
			    <th>物料名称</th>
		    	<th>库位名称</th>
		    	<th>物料价格</th>
		    	<th>物料数目</th>
		    	<th>删除</th>
	    	</tr>
	    </s:if>
	    <s:else>
	    	<tr>
	    	<td class="table_tr_no" colspan="5">
	    		没有相应的货物
	    	</td>
	    	</tr>
	    </s:else>
	    <s:iterator value="lbh" status="stat">
	      	<tr 
	       		<s:if test="#stat.even">
	       			class="table_tr_odd"
		       	</s:if>
		       	<s:else>
	       			class="table_tr__even"
	       		</s:else>
	       	>
	       	<td>
		       	<s:hidden value="%{materielCode}" name="backStockMater.materielCode"/>
		       	<s:property value="materielName"/>
	       	</td>
	       	<td>
	       		<s:hidden value="%{cargoSpaceCode}" name="backStockMater.cargoSpaceCode"/>
	       		<s:property value="%{cargoSpaceName}"/>
	       	</td>
	       	<td>
	       	<s:hidden value="%{materelPrice}" name="backStockMater.str_materelPrice"/>
	       	<s:property value="%{materelPrice}"/>
	       	</td>
	       	<td>
	     	  	<s:textfield cssClass="sub_small_border" onchange="numCheck(this)" value="%{materelCount}" name="backStockMater.str_materelCount"/>
	       	</td>
	 
	       	<td>
	       	<a href="#" onclick="DeleteTable(this)"><img src="<%=base%>/images/quit.gif" alt="删除" border="0"></a>
	       	</td>
	    </tr>
	    </s:iterator>
		</table>
			</div>
			<div style="margin-top: 8px;margin-left:10px;">
				<input id="sub_state" type="hidden" value="1" name="backstock.stockOutState">
				
	    		<a href="#" onclick="submitSava()"><img src="<%=base%>/images/sub1_btn_save.jpg" border="0" alt="保存"></a>
				<a href="#" onclick="submitComplete()"><img src="<%=base%>/images/finish.jpg" border="0" alt="完成"></a>
			</div>
		</s:form>
		</div>
    </body>
</html>