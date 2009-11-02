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
	   <title>调价信息</title>
	</HEAD>
<script type="text/javascript" src="<%=base%>/javascript/innerText.js"></script>
<SCRIPT type="text/javascript">

		function sub_back(){
	 		if(confirm("是否关闭该页面？")){
				window.opener=null;
	  			window.close();
			}
 		}

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
		<div class="stock_title"><img src="<%=base%>/images/img01.gif">调价信息</div>
		<div class="stock_con">
		<div>
		<table class="stock_table" cellpadding="0" cellspacing="0" width="100%" border="0">
		    <tr class="stock_tr">
		    	<td>调价单号：
		    	<s:property value="%{priceChange.pchangeCode}"/>
		    	</td>
		    	<td>调价时间：
		    	<s:property value="%{priceChange.pchangeDate}"/>
		    	</td>
		    </tr>
		    <tr class="stock_tr">
		    	<td colspan="2">操作员：
		    	<s:property value="%{priceChange.personName}"/>
		    	</td>
		    </tr>
		</table>
		</div>

		<div style="width: 800px;margin-top: 8px;">
		<table class="stock_table" width="650" id="MoveTab">
		<s:if test="lpm.size>0">
	    	<tr class="table_tr__even">
			    <th>物料名称</th>
		    	<th>库位名称</th>
		    	<th>原始价格</th>
		    	<th>调整价格</th>
	    	</tr>
	    </s:if>
	    <s:else>
	    	<tr>
	    	<td class="table_tr_no" colspan="5">
	    		没有相应的货物
	    	</td>
	    	</tr>
	    </s:else>
	    <s:iterator value="lpm" status="stat">
	      	<tr 
	       		<s:if test="#stat.even">
	       			class="table_tr_odd"
		       	</s:if>
		       	<s:else>
	       			class="table_tr__even"
	       		</s:else>
	       	>
	       	<td>
		       	<s:property value="materielName"/>
	       	</td>
	       	<td>
	       		<s:property value="%{cargoSpaceName}"/>
	       	</td>
	       	<td>
	       	<s:property value="%{stockPriceOld}"/>
	       	</td>
	       	<td>
	       	<s:property value="%{stockPriceNew}"/>
	       	</td>
	    </tr>
	    </s:iterator>
		</table>
			</div>
			<div style="margin-top: 8px;margin-left:10px;">
				<a href="#" onclick="sub_back()"><img src="<%=base%>/images/back.gif" border="0" alt="返回" title="返回"></a>
			</div>
		</div>
    </body>
</html>