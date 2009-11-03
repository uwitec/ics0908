<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<% String base=request.getContextPath(); %>
<html>
    <head>
        <title>消耗水平</title>
	<link href="<%=base%>/css/left_css.css" type="text/css" rel="stylesheet">
    <link href="<%=base%>/css/body_css.css" type="text/css" rel="stylesheet">
    <link href="<%=base%>/css/center_css.css" type="text/css" rel="stylesheet">
    <link href="<%=base%>/css/form_css.css" type="text/css" rel="stylesheet">
	</head>
<body>
<script type="text/javascript" src="<%=base%>/javascript/innerText.js"></script>
<SCRIPT type="text/javascript">
	
	function searchf(){
		searchForm.submit();
	}
	
</SCRIPT>
<body topmargin="0">
	<div class="body_div">
		<jsp:include flush="true" page="/pagecom/head.jsp"></jsp:include>
		<div class="left_body">
		<jsp:include flush="true" page="/main/left_.jsp"></jsp:include>
		<div class="center_body">
			<div class="center_head_text">物料消耗清单</div>
			<div class="center_tools">
			<div style="margin-top: -3px;">
			<s:form action="ShowOutLevel" namespace="/stockmanage" theme="simple" id="searchForm">
			<s:push value="stockLevel">
				开始时间:<s:textfield cssClass="sub3_border" name="stockLevel.startTime" value="%{stockLevel.startTime}"/>
				截至时间:<s:textfield cssClass="sub3_border" name="stockLevel.endTime" value="%{stockLevel.endTime}"/>
				物料名称:<s:textfield cssClass="sub3_border" name="stockLevel.materielName" value="%{stockLevel.materielName}"/>
				<a href="#" onclick="searchf()"><img src="<%=base%>/images/img09.gif" title="查询" alt="查询" border="0" style="margin-bottom:-4px;"></a>
			</s:push>
			</s:form>
			</div>
			</div>	
		</div>
		<div class="center_boder">
		
		<table class="center_table" cellspacing="1" cellpadding="0">
	    <s:if test="lhp.size>0">
	    	<tr>
			    <td class="table_head">编号</td>
		    	<td class="table_head">名称</td>
		    	<td class="table_head">消耗数目</td>
		    	<td class="table_head">最大库存</td>
		    	<td class="table_head">最小库存</td>
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
	       <s:iterator value="lhp" status="stat">
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
	       	<td><s:property value="smxiao"/></td>
	       	<td><s:property value="materielMaxStore"/></td>
	       	<td><s:property value="materielMinStore"/></td>
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
		<s:form action="ShowOutLevel" namespace="/stockmanage" theme="simple" name="pageform">
      <s:if test="lhp.size>0">
       <s:push value="stockLevel">
       <s:hidden name="stockLevel.startTime" value="%{stockLevel.startTime}"/>
       <s:hidden name="stockLevel.endTime" value="%{stockLevel.endTime}"/>
       <s:hidden name="stockLevel.materielName" value="%{stockLevel.materielName}"/>
       <s:hidden id="countsize" name="stockLevel.countSize" value="%{stockLevel.countSize}"/>
        <input type="image"  class="img_size" src="<%=base%>/images/btn_first.gif"  onclick="pageSet(0)" title="首页" alt="首页"/>
       <s:if test="stockLevel.startSize-1<1">
       		<font color="gray">上一页</font>
       </s:if>
       <s:else>
      	   <input class="img_size" type="image" src="<%=base%>/images/btn1_pre.gif" onclick="pageSet(-1)" title="上一页" alt="上一页"/>
       </s:else>
       <s:property value="stockLevel.startSize"/>/<s:property value="stockLevel.countSize"/>
       <s:if test="stockLevel.startSize+1>stockLevel.countSize">
       		<font color="gray" >下一页</font>
       </s:if>
       <s:else>
      	 	<input type="image" class="img_size" src="<%=base%>/images/btn_next.gif" onclick="pageSet(1)" title="下一页" alt="下一页"/>
       </s:else>
       		<input type="image" class="img_size" align="bottom" src="<%=base%>/images/btn1_end.gif" onclick="pageSet(2)"  title="末页" alt="末页"/>
       <font color="gray">共<s:property value="countValue"/>条记录,合计<s:property value="countSize"/>页</font>
	    <font color="gray">跳转到：<input type="text" onchange="pageChange(this,<s:property value="countSize"/>)" id="size" size="2" name="stockLevel.startSize" value="<s:property value="startSize"/>" class="pages_border"/>页</font>
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