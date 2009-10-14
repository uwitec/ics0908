<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<% String base=request.getContextPath(); %>
<html>
    <head>
        <title>供应商信息</title>
		<link href="<%=base%>/css/left_css.css" type="text/css" rel="stylesheet">
		<link href="<%=base%>/css/body_css.css" type="text/css" rel="stylesheet">
		<link href="<%=base%>/css/center_css.css" type="text/css" rel="stylesheet">
		<link href="<%=base%>/css/form_css.css" type="text/css" rel="stylesheet">
	</head>
<body>
<script type="text/javascript" src="<%=base%>/javascript/innerText.js"></script>
<SCRIPT type="text/javascript">

	 function AddSup(){
    	var href_="GoAddSupplier.action";
    	window.showModalDialog(href_,"","center:1;resizable:0;dialogHeight:450px;dialogWidth:500px");
		location.reload();
	}
	function UpdateSup(value_str){
		var url="GetOneSupplier.action?supplier.supplierCode="+value_str;
		window.showModalDialog(url,"","dialogHeight:450px;dialogWidth:500px");
		location.reload();
	}
    </SCRIPT>
<body topmargin="0">
	<div class="body_div">
		<jsp:include flush="true" page="/pagecom/head.jsp"></jsp:include>
		<div class="left_body">
		<jsp:include flush="true" page="/main/left_.jsp"></jsp:include>
		<div class="center_body">
			<div class="center_head_text">供应商信息</div>
			<div class="center_tools">
			<s:form action="ShowSupplier" namespace="/baseset" theme="simple" >
				<a href="#" onclick="AddSup()" class="a_top"><img src="<%=base%>/images/img06.gif" border="0" class="a_top">添加</a>
				<input type="text" name="supplier.s_value" value="<s:property value="supplier.s_value"/>" class="search_border" size="20"/>
				<input type="image" onclick="submit()" src="<%=base%>/images/img09.gif"/>
			</s:form>
			</div>	
		</div>
		<div class="center_boder">
		
		   <table class="center_table" cellspacing="1" cellpadding="0">
	    <s:if test="lhp.size>0">
	    	<tr>
				<td class="table_head">供应商名称</td>
		    	<td class="table_head">供应商地址</td>
		    	<td class="table_head">联系人名称</td>
		    	<td class="table_head">供应商电话</td>
		    	<td class="table_head">邮编</td>
		    	<td class="table_head">操作</td>
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
	 		<td><s:property value="supplierName"></s:property></td>
	        <td><s:property value="supplierAddress"></s:property></td>
	        <td><s:property value="jsonField"></s:property></td>
	        <td><s:property value="supplierPhone"></s:property></td>
	        <td><s:property value="supplierZipCode"></s:property></td>
	       	<td><a href="#" onclick="UpdateSup('<s:property value="supplierCode"/>')"><img src="<%=base%>/images/img03.gif" border="0"></a></td>
	       	</tr>
	       </s:iterator>
	     </table>
		<div class="pages">
				<s:form action="ShowSupplier" namespace="/baseset" theme="simple" name="pageform">
       <s:push value="supplier">
       <s:hidden name="supplier.s_value" value="%{supplier.s_value}"></s:hidden>
       <s:hidden id="countsize" name="supplier.countSize" value="%{supplier.countSize}"></s:hidden>
       <input type="image"  class="img_size" src="<%=base%>/images/btn_first.gif"  onclick="pageSet(0)"/>
       <s:if test="supplier.startSize-1<1">
       		<font color="gray">上一页</font>
       </s:if>
       <s:else>
      	  <input class="img_size" type="image" src="<%=base%>/images/btn1_pre.gif" onclick="pageSet(-1)"/>
       </s:else>
       <s:property value="supplier.startSize"/>/<s:property value="supplier.countSize"/>
       <s:if test="supplier.startSize+1>supplier.countSize">
       		<font color="gray">下一页</font>
       </s:if>
       <s:else>
      	 	<input type="image" class="img_size" src="<%=base%>/images/btn_next.gif" onclick="pageSet(1)"/>
       </s:else>
       		<input type="image" class="img_size" align="bottom" src="<%=base%>/images/btn1_end.gif" onclick="pageSet(2)"/>
        <font color="gray">跳转到：<s:textfield  id="size" size="2" name="supplier.startSize" cssClass="pages_border"/>页</font>
       </s:push> 
       </s:form>
		</div>
		</div>
		<div class="center_boder_foot"></div>
		<jsp:include flush="true" page="/main/bottom_.jsp"></jsp:include>
		</div>
	</div>
</body>
</html>