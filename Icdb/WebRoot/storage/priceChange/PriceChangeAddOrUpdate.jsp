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
	   <title>新增调价信息</title>
	</HEAD>
<script type="text/javascript" src="<%=base%>/javascript/innerText.js"></script>
<SCRIPT type="text/javascript">

		function sub_back(){
	 		if(confirm("是否终止当前工作，返回上一页？")){
				window.location.href="ShowPriceChange.action";
			}
 		}

		function DeleteTable(obj){
			if(confirm("是否删除当前信息？")){
    		  tblObj = document.getElementById("MoveTab");
			  var rownum= obj.parentNode.parentNode.rowIndex;
			  
			      tblObj.deleteRow(rownum);    
			}
    	}
    	
    	function submitSava(){
	    	if(confirm("是否保存当前内容，保存后可继续修改该内容。")){
	    		document.getElementById("sub_state").value="2";
	    		moveForm.submit();
    		}
    	}
    	
    	function submitComplete(){
	    	if(confirm("是否完成当前内容，完成后内容不可修改！")){
	    		document.getElementById("sub_state").value="1";
	    		moveForm.submit();
    		}
    	}
    	
    	function numCheck(obj){
    		var countMax=document.getElementById("")
    		if(!isNumber(obj.value,10)){
    			obj.value="0";
    		}
    	}
</SCRIPT>
	<body class="stock_body">
		<div class="stock_title"><img src="<%=base%>/images/img01.gif">新增调价信息</div>
		<div class="stock_con">
			
		<s:form action="AddOrUpdate" theme="simple" namespace="/storage" name="moveForm">
		<div>
		<table class="stock_table" cellpadding="0" cellspacing="0" width="100%" border="0">
		    <tr class="stock_tr">
		    	<td>调价单号：
		    	<s:hidden name="priceChange.pchangeCode" value="%{priceChange.pchangeCode}"/>
		    	<s:property value="%{priceChange.pchangeCode}"/>
		    	</td>
		    	<td>调价时间：
		    	<s:hidden name="priceChange.pchangeDate" value="%{priceChange.pchangeDate}"/>
		    	<s:hidden name="priceChange.rePath" value="%{priceChange.rePath}"/>
		    	<s:property value="%{priceChange.pchangeDate}"/>
		    	</td>
		    </tr>
		    <tr class="stock_tr">
		    	<td colspan="2">操作员：
		    	<s:hidden name="priceChange.optionar" value="%{priceChange.optionar}"/>
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
		       	<s:hidden value="%{materielCode}" name="pricechangeMater.materielCode"/>
		       	<s:property value="materielName"/>
	       	</td>
	       	<td>
	       		<s:hidden value="%{cargoSpaceCode}" name="pricechangeMater.cargoSpaceCode"/>
	       		<s:property value="%{cargoSpaceName}"/>
	       	</td>
	       	<td>
	       	<s:hidden value="%{stockPriceOld}" name="pricechangeMater.str_stockPriceOld"/>
	       	<s:property value="%{stockPriceOld}"/>
	       	</td>
	       	<td>
	     	  	<s:textfield cssClass="sub_small_border" onchange="numCheck(this)" value="%{stockPriceNew}" name="pricechangeMater.str_stockPriceNew"/>
	       	</td>
	 
	       	<td>
	       	<a href="#" onclick="DeleteTable(this)"><img src="<%=base%>/images/quit.gif" alt="删除" title="删除" border="0"></a>
	       	</td>
	    </tr>
	    </s:iterator>
		</table>
			</div>
			<div style="margin-top: 8px;margin-left:10px;">
				<input id="sub_state" type="hidden" value="1" name="priceChange.pchangeState">
				
	    		<a href="#" onclick="submitSava()"><img src="<%=base%>/images/sub1_btn_save.jpg" border="0" title="保存" alt="保存"></a>
				<a href="#" onclick="submitComplete()"><img src="<%=base%>/images/finish.jpg" border="0" title="完成" alt="完成"></a>
				<a href="#" onclick="sub_back()"><img src="<%=base%>/images/back.gif" border="0" alt="返回" title="返回"></a>
			</div>
		</s:form>
		</div>
    </body>
</html>