<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<% String base=request.getContextPath(); %>
<html>
    <head>
        <title>调拨单</title>
	<link href="<%=base%>/css/left_css.css" type="text/css" rel="stylesheet">
    <link href="<%=base%>/css/body_css.css" type="text/css" rel="stylesheet">
    <link href="<%=base%>/css/center_css.css" type="text/css" rel="stylesheet">
    <link href="<%=base%>/css/form_css.css" type="text/css" rel="stylesheet">
	</head>
<body>
<script type="text/javascript" src="<%=base%>/javascript/innerText.js"></script>
<SCRIPT type="text/javascript">

		function findOne(value_str){
					var url="GetOneLook.action?transferOrder.transferOrderCode="+value_str;
					window.showModalDialog(url,"","dialogHeight:550px;dialogWidth:750px");
					location.reload();
				}	
	
	function showSearch(){
		document.getElementById("seachDIV").style.display="block";
	}
	function closeDIV(){
		document.getElementById("seachDIV").style.display="none";
	}
	function deleteValue(){
		var url="delteStockMove.action?transferOrder.transferOrderCode="+value_str;
		if(confirm("是否确定删除？")){
    				window.location.href=url;
    		}
	}
</SCRIPT>
<body topmargin="0">
	<div class="body_div">
	<div id="seachDIV" class="searche_DIV" style="display: none">
<table width="100%" border="0" cellpadding="0" cellspacing="0">
	<tr>
		<td style="background:url(<%=base%>/images/menu_top_left.gif);" width="88" height="35">&nbsp;</td>
		<td style="background:url(<%=base%>/images/menu_top_con.jpg); background-repeat:repeat-x;color:#E0F2F9;font-size:13px;font-weight:bold;">新增调拨单</td>
		<td style="background:url(<%=base%>/images/menu_top_con.jpg); background-repeat:repeat-x;color:#E0F2F9;font-size:13px;font-weight:bold;" align="right">
		<a href="#" onclick="closeDIV()" ><img src="<%=base%>/images/quit.gif" alt="关闭" border="0"></a>
		</td>
		<td style="background:url(<%=base%>/images/menu_top_right.gif);" width="8" height="35" align="left">
		</td>
	</tr>
</table>
<table width="100%" border="0" cellpadding="0" cellspacing="0" style='background-color:#E2F3FB;border-left:#0C6A9D 1 solid;border-right:#0C6A9D 1px solid;'>
	<s:form action="GoAddStockMove" theme="simple">
	<tr><td align="right" style="font-size:12px;color:#636B6D;">转出仓库:</td>
		<td>
		<s:select cssClass="sub1_border" list="houselist" listKey="StorehouseCode" listValue="StorehouseName" name="storhouse.storehouseCode"/>
		</td>
	</tr>
	<tr><td align="right" style="font-size:12px;color:#636B6D;">调拨类型:</td>
		<td>
		<s:select cssClass="sub1_border" list="tranf_type" listKey="key" listValue="value" name="transferOrder.transferOrderType"/>
		</td>
	</tr>
	<tr><td colspan="2" align="center"><input type="image" src="<%=base%>/images/add.jpg" style="margin-top: 5px;"></td></tr>
	</s:form>
</table>
<table width="100%" border="0" cellpadding="0" cellspacing="0">
	<tr>
		<td style="background:url(<%=base%>/images/menu_bottom_left.jpg);background-repeat:no-repeat;" width="13" height="13">&nbsp;</td>
		<td style="background:url(<%=base%>/images/menu_bottom_con.jpg); background-repeat:repeat-x; text-align:center;">&nbsp;</td>
		<td style="background:url(<%=base%>/images/menu_bottom_con.jpg); background-repeat:repeat-x; text-align:center;">&nbsp;</td>
		<td style="background:url(<%=base%>/images/menu_bottom_right.jpg);background-repeat:no-repeat;" width="13" height="13">&nbsp;</td>
	</tr>
</table>
</div>
		<jsp:include flush="true" page="/pagecom/head.jsp"></jsp:include>
		<div class="left_body">
		<jsp:include flush="true" page="/main/left_.jsp"></jsp:include>
		<div class="center_body">
			<div class="center_head_text">调拨单查询</div>
			<div class="center_tools">
			<s:form action="ShowStockHistroyMove" namespace="/storage" theme="simple" >
				<input type="text" name="transferOrder.s_value" value="<s:property value="transferOrder.s_value"/>" class="search_border" size="20"/>
				<input type="image" onclick="submit()" src="<%=base%>/images/img09.gif" alt="查询" title="查询"/>
			</s:form>
			</div>	
		</div>
		<div class="center_boder">
		
		<table class="center_table" cellspacing="1" cellpadding="0">
	    <s:if test="lhp.size>0">
	    	<tr>
			    <td class="table_head">调拨编号</td>
		    	<td class="table_head">调拨时间</td>
		    	<td class="table_head">调拨状态</td>
		    	<td class="table_head">调拨类型</td>
		    	<td class="table_head">调拨员</td>
		    	<td class="table_head">操作</td>
	    	</tr>
	    </s:if>
	    <s:else>
	    	<tr>
	    	<td class="table_tr_no" colspan="4">
	    		没有未完成的工作
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
			<td><s:property value="transferOrderCode"/></td>
	       	<td><s:property value="transferOrderTime"/></td>
	       	<td><s:iterator value="tranf_state" status="inner">
	       			<s:if test="key==transferState">
	       				<s:property value="value"/>
	       			</s:if>
	       		</s:iterator>
	       	</td>
	       	<td><s:iterator value="tranf_type" status="inner_">
	       			<s:if test="key==transferOrderType">
	       				<s:property value="value"/>
	       			</s:if>
	       		</s:iterator>
	       	</td>
	       	<td><s:property value="personName"/></td>
	       	<td>
	       	<a href="#" onclick="findOne('<s:property value="transferOrderCode"/>')"><img src="<%=base%>/images/chaxunyu_e.gif" border="0"></a>
	             		
	       	</td>
	       	</tr>
	       </s:iterator>
	     </table>
	     		<div class="pages">
			<s:form action="ShowStockHistroyMove" namespace="/storage" theme="simple" name="pageform">
       <s:if test="lhp.size>0">
       <s:push value="transferOrder">
       <s:hidden name="transferOrder.s_value" value="%{transferOrder.s_value}"></s:hidden>
       <s:hidden id="countsize" name="transferOrder.countSize" value="%{transferOrder.countSize}"></s:hidden>
        <input type="image"  class="img_size" src="<%=base%>/images/btn_first.gif"  onclick="pageSet(0)" title="首页" alt="首页"/>
       <s:if test="transferOrder.startSize-1<1">
       		<font color="gray">上一页</font>
       </s:if>
       <s:else>
      	   <input class="img_size" type="image" src="<%=base%>/images/btn1_pre.gif" onclick="pageSet(-1)" title="上一页" alt="上一页"/>
       </s:else>
       <s:property value="transferOrder.startSize"/>/<s:property value="transferOrder.countSize"/>
       <s:if test="transferOrder.startSize+1>transferOrder.countSize">
       		<font color="gray" >下一页</font>
       </s:if>
       <s:else>
      	 	<input type="image" class="img_size" src="<%=base%>/images/btn_next.gif" onclick="pageSet(1)" title="下一页" alt="下一页"/>
       </s:else>
       		<input type="image" class="img_size" align="bottom" src="<%=base%>/images/btn1_end.gif" onclick="pageSet(2)" title="末页" alt="末页"/>
        <font color="gray">共<s:property value="countValue"/>条记录,合计<s:property value="countSize"/>页</font>
	       <font color="gray">跳转到：<input type="text" onchange="pageChange(this,<s:property value="countSize"/>)" id="size" size="2" name="transferOrder.startSize" value="<s:property value="startSize"/>" class="pages_border"/>页</font>
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