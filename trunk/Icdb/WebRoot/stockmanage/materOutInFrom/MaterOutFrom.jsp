<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<% String base=request.getContextPath(); %>
<html>
    <head>
        <title>物料流向</title>
	<link href="<%=base%>/css/left_css.css" type="text/css" rel="stylesheet">
    <link href="<%=base%>/css/body_css.css" type="text/css" rel="stylesheet">
    <link href="<%=base%>/css/center_css.css" type="text/css" rel="stylesheet">
     <link href="<%=base%>/css/form_css.css" type="text/css" rel="stylesheet">
	</head>
<body>
<script type="text/javascript" src="<%=base%>/javascript/innerText.js"></script>
<SCRIPT type="text/javascript">
	
	function search1(){
		aform.submit();
	} 
	function search2(){
		bform.submit();
	}
	
	function showSearch(){
		document.getElementById("seachDIV").style.display="block";
	}
	function closeDIV(){
		if(confirm("关闭该查询框吗？")){
			document.getElementById("seachDIV").style.display="none";
		}
	}
	
</SCRIPT>
<body topmargin="0">

	<div class="body_div">
		<div id="seachDIV" class="searche_DIV" style="display: none;height:200px;">
			<s:form action="ShowMaterOutFrom" namespace="/stockmanage" theme="simple" id="bform">
			<table width="100%" border="0" cellpadding="0" cellspacing="0">
				<tr>
					<td style="background:url(<%=base%>/images/menu_top_left.gif);" width="88" height="35">&nbsp;</td>
					<td style="background:url(<%=base%>/images/menu_top_con.jpg); background-repeat:repeat-x;color:#E0F2F9;font-size:13px;font-weight:bold;">新增调拨单</td>
					<td style="background:url(<%=base%>/images/menu_top_con.jpg); background-repeat:repeat-x;color:#E0F2F9;font-size:13px;font-weight:bold;" align="right">
					<a href="#" onclick="closeDIV()" ><img src="<%=base%>/images/quit.gif" alt="关闭" title="关闭" border="0"></a>
					</td>
					<td style="background:url(<%=base%>/images/menu_top_right.gif);" width="8" height="35" align="left">
					</td>
				</tr>
			</table>
				<table width="100%" border="0" cellpadding="0" cellspacing="0" style='background-color:#E2F3FB;border-left:#0C6A9D 1 solid;border-right:#0C6A9D 1px solid;'>
				<s:push value="materoutf">
				<tr style="margin-top: 5px;"><td style="font-size:12px;color:#636B6D;" align="center">
					开始时间:<s:textfield cssClass="sub3_border" name="materoutf.startTime" value="%{materoutf.startTime}" cssStyle="margin-top:5px;" /></td></tr>
				<tr style="margin-top: 5px;"><td style="font-size:12px;color:#636B6D;" align="center">
						截至时间:<s:textfield cssClass="sub3_border" name="materoutf.endTime" value="%{materoutf.endTime}"/></td></tr>
				<tr style="margin-top: 5px;"><td style="font-size:12px;color:#636B6D;" align="center">
						物料名称:<s:textfield cssClass="sub3_border" name="materoutf.materielName" value="%{materoutf.materielName}" cssStyle="margin-top:5px;"/></td></tr>
				<tr style="margin-top: 5px;"><td style="font-size:12px;color:#636B6D;" align="center">
						仓库名称:<s:textfield cssClass="sub3_border" name="materoutf.storehouseName" value="%{materoutf.storehouseName}" cssStyle="margin-top:5px;"/></td></tr>
				<tr style="margin-top: 5px;"><td style="font-size:12px;color:#636B6D;" align="center">
						供应商名:<s:textfield cssClass="sub3_border" name="materoutf.supplierName" value="%{materoutf.supplierName}" cssStyle="margin-top:5px;"/></td></tr>
				<tr style="margin-top: 5px;"><td style="font-size:12px;color:#636B6D;" align="center">
						物料类别:<s:select cssClass="sub3_border" list="lsb" listKey="key" listValue="value" name="materoutf.materielABC"/></td></tr>
				<tr><td style="font-size:12px;color:#636B6D;" align="center" height="30px;">
						<a href="#" onclick="search2()" style="margin-top: 5px;"><img src="<%=base%>/images/find.jpg" align="bottom" border="0" title="查询" alt="查询" style="margin-bottom:-4px;"></a></td>
				</tr>
				</s:push>
			</table>
				<table width="100%" border="0" cellpadding="0" cellspacing="0">
				<tr>
					<td style="background:url(<%=base%>/images/menu_bottom_left.jpg);background-repeat:no-repeat;" width="13" height="13">&nbsp;</td>
					<td style="background:url(<%=base%>/images/menu_bottom_con.jpg); background-repeat:repeat-x; text-align:center;">&nbsp;</td>
					<td style="background:url(<%=base%>/images/menu_bottom_con.jpg); background-repeat:repeat-x; text-align:center;">&nbsp;</td>
					<td style="background:url(<%=base%>/images/menu_bottom_right.jpg);background-repeat:no-repeat;" width="13" height="13">&nbsp;</td>
				</tr>
			</table>	
				</s:form>
		</div>
		<jsp:include flush="true" page="/pagecom/head.jsp"></jsp:include>
		<div class="left_body">
		<jsp:include flush="true" page="/main/left_.jsp"></jsp:include>
		<div class="center_body">
			<div class="center_head_text">物料流出清单</div>
			<div class="center_tools">
				
			<div style="margin-top: -3px;">
			<s:form action="ShowMaterOutFrom" namespace="/stockmanage" theme="simple" id="aform">
			<s:push value="materoutf">
			<s:hidden cssClass="sub3_border" name="materoutf.startTime" value="%{materoutf.startTime}"/>
			<s:hidden cssClass="sub3_border" name="materoutf.endTime" value="%{materoutf.endTime}"/>
			<s:hidden cssClass="sub3_border" name="materoutf.storehouseName" value="%{materoutf.storehouseName}"/>
			<s:hidden cssClass="sub3_border" name="materoutf.customerCode" value="%{materoutf.customerCode}"/>
				物料名称:<s:textfield cssClass="sub3_border" name="materoutf.materielName" value="%{materoutf.materielName}"/>
				物料类别:<s:select cssClass="sub3_border" list="lsb" listKey="key" listValue="value" name="materoutf.materielABC"/>
				<a href="#" onclick="search1()"><img src="<%=base%>/images/img09.gif" border="0" title="查询" alt="查询" style="margin-bottom:-4px;"></a>
				<a href="#" onclick="showSearch()">高级查询</a>
			</s:push>
			</s:form>
			</div>
			</div>	
		</div>
		<div class="center_boder">
		
		<table class="center_table" cellspacing="1" cellpadding="0">
	    <s:if test="lhp2.size>0">
	    	<tr>
			    <td class="table_head">编号</td>
		    	<td class="table_head">名称</td>
		    	<td class="table_head">出库数目</td>
		    	<td class="table_head">客户</td>
		    	<td class="table_head">仓库</td>
		    	<td class="table_head">ABC类型</td>
	    	</tr>
	    </s:if>
	    <s:else>
	    	<tr>
	    	<td class="table_tr_no" colspan="4">
	    		没有警告信息
	    	</td>
	    	</tr>
	    </s:else>
	       <s:iterator value="lhp2" status="stat">
	      	<tr 
	       		<s:if test="#stat.even">
	       			class="table_tr_odd"
		       	</s:if>
		       	<s:else>
	       			class="table_tr__even"
	       		</s:else>
	       	>
			<td><s:property value="materielCode"/></td>
	       	<td><s:property value="materielName"/></td>
	       	<td><s:property value="stockOutAmount"/></td>
	       	<td><s:property value="customerCode"/></td>
	       	<td><s:property value="storehouseName"/></td>
	       	<td><s:iterator value="lsb" status="inner">
	       			<s:if test="key==materielABC">
	       				<s:property value="value"/>
	       			</s:if>
	       		</s:iterator>
	       	</td>
	       	</tr>
	       </s:iterator>
	     </table>
	     		<div class="pages">
		<s:form action="ShowMaterOutFrom" namespace="/stockmanage" theme="simple" name="pageform">
       <s:if test="lhp2.size>0">
       <s:push value="materoutf">
		<s:hidden name="materoutf.materielABC" value="%{materoutf.materielABC}"/>
       <s:hidden name="materoutf.startTime" value="%{materoutf.startTime}"/>
       <s:hidden name="materoutf.endTime" value="%{materoutf.endTime}"/>
       <s:hidden name="materoutf.materielName" value="%{materoutf.materielName}"/>
       <s:hidden cssClass="sub3_border" name="materoutf.storehouseName" value="%{materoutf.storehouseName}"/>
	   <s:hidden cssClass="sub3_border" name="materoutf.customerCode" value="%{materoutf.customerCode}"/>
       <s:hidden id="countsize" name="materoutf.countSize" value="%{materoutf.countSize}"/>
           <input type="image"  class="img_size" src="<%=base%>/images/btn_first.gif"  onclick="pageSet(0)" title="首页" alt="首页"/>
       <s:if test="materoutf.startSize-1<1">
       		<font color="gray">上一页</font>
       </s:if>
       <s:else>
      	   <input class="img_size" type="image" src="<%=base%>/images/btn1_pre.gif" onclick="pageSet(-1)" title="上一页" alt="上一页"/>
       </s:else>
       <s:property value="materoutf.startSize"/>/<s:property value="materoutf.countSize"/>
       <s:if test="materoutf.startSize+1>materoutf.countSize">
       		<font color="gray" >下一页</font>
       </s:if>
       <s:else>
      	 	<input type="image" class="img_size" src="<%=base%>/images/btn_next.gif" onclick="pageSet(1)" title="下一页" alt="下一页"/>
       </s:else>
       		<input type="image" class="img_size" align="bottom" src="<%=base%>/images/btn1_end.gif" onclick="pageSet(2)"  title="末页" alt="末页"/>
        <font color="gray">共<s:property value="countValue"/>条记录,合计<s:property value="countSize"/>页</font>
	    <font color="gray">跳转到：<input type="text" onchange="pageChange(this,<s:property value="countSize"/>)" id="size" size="2" name="materoutf.startSize" value="<s:property value="startSize"/>" class="pages_border"/>页</font>
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