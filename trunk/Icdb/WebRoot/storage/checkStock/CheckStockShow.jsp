<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<% String base=request.getContextPath(); %>
<html>
    <head>
        <title>物料信息</title>
		 <link href="<%=base%>/css/left_css.css" type="text/css" rel="stylesheet">
	    <link href="<%=base%>/css/body_css.css" type="text/css" rel="stylesheet">
	    <link href="<%=base%>/css/center_css.css" type="text/css" rel="stylesheet">
	</head>
<body>
<script type="text/javascript" src="<%=base%>/javascript/innerText.js"></script>
<SCRIPT type="text/javascript">	
	function formSub(){
		var ok_=document.getElementById("toCheck");
		if(ok_.value=='disabled'){
			alert("未到盘点时间");
		}else{
			goaddCheck.submit();
		}
	}
    </SCRIPT>
<body topmargin="0">
	<div class="body_div">
		<jsp:include flush="true" page="/pagecom/head.jsp"></jsp:include>
		<jsp:include flush="true" page="/main/left_.jsp"></jsp:include>
		<div class="center_body">
			<div class="center_head_text">物料信息</div>
			<div class="center_tools">
			</div>	
		</div>
		<div class="center_boder">
		<div>
			 <s:form action="GoAddCheckStock"  namespace="/storage" theme="simple" name="goaddCheck">
			    <table class="center_table">
			    	<s:if test="checkStock.message!=null">
			    	    	<tr  class="table_tr_left"><td colspan="2"><s:property value="checkStock.message"/></td></tr>
			    	</s:if>
			    	<tr class="table_tr_left">
			    		<td>仓库：
			    		<s:hidden id="toCheck" name="checkTime" value="%{checkTime}"/>
			    		<s:select cssClass="sub1_border" list="lsb" listKey="StorehouseCode" listValue="StorehouseName" name="checkStock.StorehouseCode"/>
			    		<a href="#" onclick="formSub()"><img src="<%=base%>/images/img05.gif" border="0" align="top"></a>
			    		</td>
			    	</tr>
			    </table>
	    	</s:form>
		</div>
		<table class="center_table" cellspacing="1" cellpadding="0">
	    <s:if test="lhp.size>0">
	    	<tr class="table_head">
			    <td>盘点仓库</td>
	    		<td>盘点时间</td>
	    		<td>审核人</td>
	    		<td>操作员</td>
	    		<td>是否审核通过</td>
	    		<td>编辑</td>
	    	</tr>
	    </s:if>
	    <s:else>
	    	<tr>
	    	<td class="table_tr_no" colspan="5">
	    		还有以下工作需要进行完成!
	    	</td>
	    	</tr>
	    </s:else>
	       <s:iterator value="lhp" status="stat">
	      	<tr 
	       		<s:if test="#stat.even">
	       			class="table_tr_odd"
		       	</s:if>
		       	<s:else>
	       			class="table_tr__even"
	       		</s:else>
	       	>
       		<td><s:property value="storehouseName"/></td>
    		<td><s:property value="csDate"/></td>
    		<td><s:property value="csCheckPerson"/></td>
    		<td><s:property value="personName"/></td>
    			<td>
    		<s:iterator value="list_state" status="inner">
    			<s:if test="key==csApproveState">
    				<s:property value="value"/>
    			</s:if>
    		</s:iterator>
    		</td>
    		<td>
	    		<s:url id="editUrl" action="EditCheckStock">
	    			<s:param name="checkStock.csCode" value="csCode"></s:param>
	    		</s:url>
    			<s:a href="%{editUrl}">编辑</s:a>
    		</td>
    		</tr>
	       </s:iterator>
	     </table>
		  
		<div class="pages">
		</div>
		</div>
		<div class="center_boder_foot"></div>
		<jsp:include flush="true" page="/main/bottom_.jsp"></jsp:include>
	</div>
</body>
</html>