<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<% String base=request.getContextPath(); %>
<html>
    <head>
        <title>调价单</title>
	<link href="<%=base%>/css/left_css.css" type="text/css" rel="stylesheet">
    <link href="<%=base%>/css/body_css.css" type="text/css" rel="stylesheet">
    <link href="<%=base%>/css/center_css.css" type="text/css" rel="stylesheet">
    <link href="<%=base%>/css/form_css.css" type="text/css" rel="stylesheet">
	</head>
<body>
<script type="text/javascript" src="<%=base%>/javascript/innerText.js"></script>
<SCRIPT type="text/javascript">
				function showSearch(){
					document.getElementById("seachDIV").style.display="block";
				}
				function closeDIV(){
					document.getElementById("seachDIV").style.display="none";
				}
				function submitchange(){
						GoAddForm.submit();
				}
				function DeleteValue(value_str){
				var url="DeletePriceChange.action?priceChange.pchangeCode="+value_str;
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
	<s:form action="GoAddPriceChange" theme="simple" name="GoAddForm">
	<tr style="margin-top: 5px;"><td align="right" style="font-size:12px;color:#636B6D;">仓库:</td>
		<td style="font-size:12px;color:#636B6D;">
			<s:select list="lsb" listKey="storehouseCode" listValue="storehouseName" name="storeHouse.storehouseCode"/>
		</td>
	</tr>
	<tr><td colspan="2" align="center">
	<a href="#" onclick="submitchange()"><img src="<%=base%>/images/add.jpg" alt="添加" border="0" style="margin-top: 5px;"></a></td></tr>
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
			<div class="center_head_text">调价单</div>
			<div class="center_tools">
			<s:form action="ShowPriceChange" namespace="/storage" theme="simple" >
				<a href="#" onclick="showSearch()" class="a_top"><img src="<%=base%>/images/img06.gif" border="0" class="a_top">添加</a>
				<input type="text" name="priceChange.s_value" value="<s:property value="priceChange.s_value"/>" class="search_border" size="20"/>
				<input type="image" onclick="submit()" src="<%=base%>/images/img09.gif"/>
			</s:form>
			</div>	
		</div>
		<div class="center_boder">
		
		<table class="center_table" cellspacing="1" cellpadding="0">
	    <s:if test="lhp.size>0">
	    	<tr class="table_head">
			    <td>调拨编号</td>
		    	<td>调拨时间</td>
		    	<td>调拨状态</td>
		    	<td>调拨员</td>
		    	<td>操作</td>
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
			<td><s:property value="pchangeCode"/></td>
	       	<td><s:property value="pchangeDate"/></td>
	       	<td><s:iterator value="price_type" status="inner">
	       			<s:if test="key==pchangeState">
	       				<s:property value="value"/>
	       			</s:if>
	       		</s:iterator>
	       	</td>
	       	<td><s:property value="optionar"/></td>
	       	<td>
	       	<s:if test="pchangeState==1">
	       		<a href="#"><img src="<%=base%>/images/img02.gif" border="0"></a>
	       	</s:if>	       	
	       	<s:if test="pchangeState==2">
	       		<a href="GetOnePriceChange.action?priceChange.pchangeCode=<s:property value="pchangeCode"/>"><img src="<%=base%>/images/img03.gif" border="0"></a>
	      	 	|<a href="#" onclick="DeleteValue('<s:property value='pchangeCode'/>')"><img src="<%=base%>/images/img04.gif" border="0"></a>
	       	</s:if>	       		
	       	</td>
	       	</tr>
	       </s:iterator>
	     </table>
	     		<div class="pages">
			<s:form action="ShowPriceChange" namespace="/storage" theme="simple" name="pageform">
       <s:push value="priceChange">
       <s:hidden name="priceChange.s_value" value="%{priceChange.s_value}"></s:hidden>
       <s:hidden id="countsize" name="priceChange.countSize" value="%{priceChange.countSize}"></s:hidden>
        <input type="image"  class="img_size" src="<%=base%>/images/btn_first.gif"  onclick="pageSet(0)"/>
       <s:if test="priceChange.startSize-1<1">
       		<font color="gray">上一页</font>
       </s:if>
       <s:else>
      	   <input class="img_size" type="image" src="<%=base%>/images/btn1_pre.gif" onclick="pageSet(-1)"/>
       </s:else>
       <s:property value="priceChange.startSize"/>/<s:property value="priceChange.countSize"/>
       <s:if test="priceChange.startSize+1>priceChange.countSize">
       		<font color="gray" >下一页</font>
       </s:if>
       <s:else>
      	 	<input type="image" class="img_size" src="<%=base%>/images/btn_next.gif" onclick="pageSet(1)"/>
       </s:else>
       		<input type="image" class="img_size" align="bottom" src="<%=base%>/images/btn1_end.gif" onclick="pageSet(2)"/>
        <font color="gray">跳转到：<s:textfield  id="size" size="2" name="priceChange.startSize" cssClass="pages_border"/>页</font>
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