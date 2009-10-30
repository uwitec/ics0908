<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<% String base=request.getContextPath(); %>
<html>
    <head>
        <title>盘点信息</title>
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
			<div class="center_head_text">盘点历史信息</div>
			<div class="center_tools">
			<s:form action="ShowHistroy" namespace="/storage" theme="simple" >
				<input type="text" name="checkStock.s_value" value="<s:property value="checkStock.s_value"/>" class="search_border" size="20"/>
				<input type="image" onclick="submit()" src="<%=base%>/images/img09.gif" title="查询" alt="查询"/>
			</s:form>
			</div>	
		</div>
		<div class="center_boder">
		
		   <table class="center_table" cellspacing="1" cellpadding="0">
	    <s:if test="lhp.size>0">
	    	<tr>
				<td class="table_head">盘点仓库</td>
	    		<td class="table_head">盘点时间</td>
	    		<td class="table_head">审核人</td>
	    		<td class="table_head">操作员</td>
	    		<td class="table_head">是否通过审核</td>
	    		<td class="table_head">详细信息</td>
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
	    	<a href="FindCheck.action?checkStock.message='histroy'&checkStock.csCode=<s:property value='csCode'/>"><img src="<%=base%>/images/chaxunyu_e.gif" border="0"></a>
    		</td>
    		</tr>
	       </s:iterator>
	     </table>
		<div class="pages">
		<s:form action="ShowHistroy" namespace="/storage" theme="simple" name="pageform">
		<s:if test="lhp.size>0">
	       <s:push value="checkStock">
	       <s:hidden name="checkStock.s_value" value="%{checkStock.s_value}"></s:hidden>
	       <s:hidden id="countsize" name="checkStock.countSize" value="%{checkStock.countSize}"></s:hidden>
	       <input type="image"  class="img_size" src="<%=base%>/images/btn_first.gif"  onclick="pageSet(0)" title="首页" alt="首页"/>
	       <s:if test="checkStock.startSize-1<1">
	       		<font color="gray">上一页</font>
	       </s:if>
	       <s:else>
	      	  <input class="img_size" type="image" src="<%=base%>/images/btn1_pre.gif" onclick="pageSet(-1)" title="上一页" alt="上一页"/>
	       </s:else>
	       <s:property value="checkStock.startSize"/>/<s:property value="checkStock.countSize"/>
	       <s:if test="checkStock.startSize+1>checkStock.countSize">
	       		<font color="gray">下一页</font>
	       </s:if>
	       <s:else>
	      	 	<input type="image" class="img_size" src="<%=base%>/images/btn_next.gif" onclick="pageSet(1)" title="下一页" alt="下一页"/>
	       </s:else>
	       		<input type="image" class="img_size" align="bottom" src="<%=base%>/images/btn1_end.gif" onclick="pageSet(2)"  title="末页" alt="末页"/>
	      	<font color="gray">共<s:property value="checkStock.countValue"/>条记录,合计<s:property value="checkStock.countSize"/>页</font>
	        <font color="gray">跳转到：<input type="text" onchange="pageChange(this,<s:property value="checkStock.countSize"/>)" id="size" size="2" name="checkStock.startSize" value="<s:property value="checkStock.startSize"/>" class="pages_border"/>页</font>
	       </s:push> 
       </s:if>
       </s:form>
		</div>
		</div>
		<div class="center_boder_foot"></div>
		<jsp:include flush="true" page="/main/bottom_.jsp"></jsp:include>
		</div>
	</div>
</body>
</html>