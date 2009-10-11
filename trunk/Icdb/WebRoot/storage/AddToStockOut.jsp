<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<% 
String base=request.getContextPath(); 
int idtitle=1;
%>
    <head>
        <link href="<%=base%>/css/sub.css" type="text/css" rel="stylesheet">
        <link href="<%=base%>/css/center_css.css" type="text/css" rel="stylesheet">
	   <title>出库单信息</title>
	</HEAD>
	<script type="text/javascript" src="<%=base%>/javascript/innerText.js"></script>
	<SCRIPT type="text/javascript">
	
		 function sendTo()
		 {
		    returnValue = getValue();
		 	window.returnValue = returnValue
		 	window.close()
		 }


</SCRIPT>
	<base target="_self"> 
	<body class="sub1_body">
		<div class="sub1_title"><img src="<%=base%>/images/img01.gif">出库单信息</div>
		<div class="sub1_con">
		   <div align="right">
		  	</div>
		<div>
		<table width="600" style="background-color:#B4BCC2;border:0px;margin-left:11px;" cellspacing="1" cellpadding="0" id="mat_tab">
	    <s:if test="stockOutList.items.size>0">
	    	<tr class="table_head">
	    		<th>选择</th>
			    <th>申请单号</th>
				<th>申请时间</th>
				<th>审批状态</th>
				<th>检查状态</th>
				<th>完成状态</th>
				<th>是否出库</th>
	    	</tr>
	    </s:if>
	    <s:else>
	    	<tr>
	    	<td class="table_tr_no" colspan="4">
	    		没有未完成的工作
	    	</td>
	    	</tr>
	    </s:else>
	       <s:iterator value="stockOutList.items" status="stat">
	      	<tr
	       		<s:if test="#stat.even">
	       			class="table_tr_odd"
		       	</s:if>
		       	<s:else>
	       			class="table_tr__even"
	       		</s:else>
	       	>
	       	<td align="center" width="40"><input type="radio" name="p_radio"  value="<%=idtitle%>"/></td>
			<td id="stockOutOrderCode<%=idtitle++%>">
				<s:property value="stockOutOrderCode"/>
			</td>
			<td>
				<s:property value="stockOutDate"/>
			</td>
			<td>
				<s:if test="stockOutCheckState == 0 ">未审核</s:if>
				<s:if test="stockOutCheckState == 1 ">审核通过</s:if>
				<s:if test="stockOutCheckState == -1 ">未通过</s:if>
			</td>
			<td>
				<s:if test="stockOutDealState == 0 ">未检查</s:if>
				<s:if test="stockOutDealState == 1 ">检查通过</s:if>
				<s:if test="stockOutDealState == -1 ">检查未通过</s:if>
			</td>
			<td>
				<s:if test="stockOutStateType == 1 ">完成</s:if>
				<s:elseif test="stockOutStateType == 3 ">已出库</s:elseif>
				<s:else>未完成</s:else>
			</td>
			<td>
				<s:if test="stockOutWithState == 1 ">已经出库</s:if>
				<s:else>未出库</s:else>
			</td>
		</tr>
		</s:iterator>
	     </table>
	     <div align="right" style="margin-top: 5px;	">
       			<a href="#" onclick="toSetId(new Array('stockOutOrderCode'),'p_radio')"><img src="<%=base%>/images/add.jpg"  border="0"></a>
	    </div>
    </body>
</html>