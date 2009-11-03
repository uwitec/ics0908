<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<% String base=request.getContextPath(); %>
<html>
    <head>
        <title>物料不足</title>
		<link href="<%=base%>/css/left_css.css" type="text/css" rel="stylesheet">
    <link href="<%=base%>/css/body_css.css" type="text/css" rel="stylesheet">
    <link href="<%=base%>/css/center_css.css" type="text/css" rel="stylesheet">
     <link href="<%=base%>/css/form_css.css" type="text/css" rel="stylesheet">
	</head>
<body>
<script type="text/javascript" src="<%=base%>/javascript/innerText.js"></script>
<script type="text/javascript">
	
	function form_submit(){
		showMinForm.submit();
	}
</script>
<body topmargin="0">
	<div class="body_div">
		<jsp:include flush="true" page="/pagecom/head.jsp"></jsp:include>
		<div class="left_body">
		<jsp:include flush="true" page="/main/left_.jsp"></jsp:include>
		<div class="center_body">
			<div class="center_head_text">物料不足清单</div>
			<div class="center_tools">
			<s:form action="ShowMin" namespace="/stockmanage" theme="simple" name="showMinForm">
				<s:select cssClass="sub3_border" list="lsb" listKey="key" listValue="value" name="stockmm.materielABC" />
				<a href="#" onclick="form_submit()"><img src="<%=base%>/images/img09.gif" title="查询" alt="查询" border="0" style="margin-bottom:-4px;"></a>
			</s:form>
			</div>	
		</div>
		<div class="center_boder">
		
		<table class="center_table" cellspacing="1" cellpadding="0">
	    <s:if test="lhp.size>0">
	    	<tr class="table_head">
			    <td>物料编号</td>
		    	<td>名称</td>
		    	<td>现有数目</td>
		    	<td>最小库存</td>
		    	<td>超储数目</td>
		    	<td>ABC类型</td>
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
	       	<td><s:property value="stocknum"/></td>
	       	<td><s:property value="materielMinStore"/></td>
	       	<td><s:property value="materielMaxStore-stocknum"/></td>
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
		<s:form action="ShowMin" namespace="/stockmanage" theme="simple" name="pageform">
       <s:if test="lhp.size>0">
       <s:push value="stockmm">
       <s:hidden name="stockmm.materielABC" value="%{stockmm.materielABC}"></s:hidden>
       <s:hidden id="countsize" name="stockmm.countSize" value="%{stockmm.countSize}"></s:hidden>
        <input type="image"  class="img_size" src="<%=base%>/images/btn_first.gif"  onclick="pageSet(0)"  title="首页" alt="首页"/>
       <s:if test="stockmm.startSize-1<1">
       		<font color="gray">上一页</font>
       </s:if>
       <s:else>
      	   <input class="img_size" type="image" src="<%=base%>/images/btn1_pre.gif" onclick="pageSet(-1)" title="上一页" alt="上一页"/>
       </s:else>
       <s:property value="stockmm.startSize"/>/<s:property value="stockmm.countSize"/>
       <s:if test="stockmm.startSize+1>stockmm.countSize">
       		<font color="gray" >下一页</font>
       </s:if>
       <s:else>
      	 	<input type="image" class="img_size" src="<%=base%>/images/btn_next.gif" onclick="pageSet(1)" title="下一页" alt="下一页"/>
       </s:else>
       		<input type="image" class="img_size" align="bottom" src="<%=base%>/images/btn1_end.gif" onclick="pageSet(2)" title="末页" alt="末页"/>
       <font color="gray">共<s:property value="countValue"/>条记录,合计<s:property value="countSize"/>页</font>
	    <font color="gray">跳转到：<input type="text" onchange="pageChange(this,<s:property value="countSize"/>)" id="size" size="2" name="stockmm.startSize" value="<s:property value="startSize"/>" class="pages_border"/>页</font>
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