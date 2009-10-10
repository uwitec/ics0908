<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<% String base=request.getContextPath(); %>
<html>
    <head>
        <title>客户信息</title>
		<link href="<%=base%>/css/left_css.css" type="text/css" rel="stylesheet">
		<link href="<%=base%>/css/body_css.css" type="text/css" rel="stylesheet">
		<link href="<%=base%>/css/center_css.css" type="text/css" rel="stylesheet">
		<link href="<%=base%>/css/form_css.css" type="text/css" rel="stylesheet">
	</head>
<body>
<script type="text/javascript" src="<%=base%>/javascript/innerText.js"></script>
<SCRIPT type="text/javascript">

	 function AddCus(){
    	var href_="GoAddCustomer.action";
    	window.showModalDialog(href_,"","center:1;resizable:0;dialogHeight:450px;dialogWidth:500px");
		location.reload();
	}
	function UpdateCus(value_str){
		var url="GetOneCustomer.action?customer.customerCode="+value_str;
		window.showModalDialog(url,"","dialogHeight:450px;dialogWidth:500px");
		location.reload();
	}
	
	function deleteCus(value_str){
		var url="DeleteCustomer.action?customer.customerCode="+value_str;
		if(confirm("是否确定删除？")){
    				window.location.href=url;
    		}
	}
    </SCRIPT>
<body topmargin="0">
	<div class="body_div">
		<jsp:include flush="true" page="/pagecom/head.jsp"></jsp:include>
		<jsp:include flush="true" page="/main/left_.jsp"></jsp:include>
		<div class="center_body">
			<div class="center_head_text">客户信息</div>
			<div class="center_tools">
			<s:form action="ShowCustomer" namespace="/baseset" theme="simple" >
				<a href="#" onclick="AddCus()" class="a_top"><img src="<%=base%>/images/img06.gif" border="0" class="a_top">添加</a>
				<input type="text" name="customer.s_value" value="<s:property value="customer.s_value"/>" class="search_border" size="20"/>
				<input type="image" onclick="submit()" src="<%=base%>/images/img09.gif"/>
			</s:form>
			</div>	
		</div>
		<div class="center_boder">
		
		   <table class="center_table" cellspacing="1" cellpadding="0">
	    <s:if test="lhp.size>0">
	    	<tr class="table_head">
				<td>客户名称</td>
		    	<td>客户地址</td>
		    	<td>客户联系人</td>
		    	<td>客户电话</td>
		    	<td>邮编</td>
		    	<td>操作</td>
	    	</tr>
	    </s:if>
	    <s:else>
	    	<tr>
	    	<td class="table_tr_no" colspan="5">
	    		未找到符合的信息!
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
	 		<td><s:property value="customerName"></s:property></td>
	        <td><s:property value="customerAddress"></s:property></td>
	        <td><s:property value="jsonField"></s:property></td>
	        <td><s:property value="customerPhone"></s:property></td>
	        <td><s:property value="customerZipCode"></s:property></td>
	       	<td>
	       	<a href="#" onclick="UpdateCus('<s:property value="customerCode"/>')"><img src="<%=base%>/images/img03.gif" border="0"></a>
	     	<a href="#" onclick="deleteCus('<s:property value="customerCode"/>')"><img src="<%=base%>/images/jinyong.gif" border="0"></a>
	       	</td>
	       	</tr>
	       </s:iterator>
	     </table>
		<div class="pages">
				<s:form action="ShowCustomer" namespace="/baseset" theme="simple" name="pageform">
       <s:push value="customer">
       <s:hidden name="customer.s_value" value="%{customer.s_value}"></s:hidden>
       <s:hidden id="countsize" name="customer.countSize" value="%{customer.countSize}"></s:hidden>
       <input type="image"  class="img_size" src="<%=base%>/images/btn_first.gif"  onclick="pageSet(0)"/>
       <s:if test="customer.startSize-1<1">
       		<font color="gray">上一页</font>
       </s:if>
       <s:else>
      	  <input class="img_size" type="image" src="<%=base%>/images/btn1_pre.gif" onclick="pageSet(-1)"/>
       </s:else>
       <s:property value="customer.startSize"/>/<s:property value="customer.countSize"/>
       <s:if test="customer.startSize+1>customer.countSize">
       		<font color="gray">下一页</font>
       </s:if>
       <s:else>
      	 	<input type="image" class="img_size" src="<%=base%>/images/btn_next.gif" onclick="pageSet(1)"/>
       </s:else>
       		<input type="image" class="img_size" align="bottom" src="<%=base%>/images/btn1_end.gif" onclick="pageSet(2)"/>
        <font color="gray">跳转到：<s:textfield  id="size" size="2" name="customer.startSize" cssClass="pages_border"/>页</font>
       </s:push> 
       </s:form>
		</div>
		</div>
		<div class="center_boder_foot"></div>
		<jsp:include flush="true" page="/main/bottom_.jsp"></jsp:include>
	</div>
</body>
</html>