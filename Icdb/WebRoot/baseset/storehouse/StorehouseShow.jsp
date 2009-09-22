<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<% String base=request.getContextPath(); %>
<html>
    <head>
        <title>仓库信息</title>
		<link href="<%=base%>/css/left_css.css" type="text/css" rel="stylesheet">
		<link href="<%=base%>/css/body_css.css" type="text/css" rel="stylesheet">
		<link href="<%=base%>/css/center_css.css" type="text/css" rel="stylesheet">
		<link href="<%=base%>/css/form_css.css" type="text/css" rel="stylesheet">
	</head>
<body>
<script type="text/javascript" src="<%=base%>/javascript/innerText.js"></script>
<SCRIPT type="text/javascript">
	
	function showCargo(valur_str){
		var url="ShowCargoSpace.action?cargoSpace.storehouseCode="+valur_str;
		window.showModalDialog(url,"","dialogHeight:350px;dialogWidth:700px");
		location.reload();
	}

</SCRIPT>
<body topmargin="0">
	<div class="body_div">
		<jsp:include flush="true" page="/pagecom/head.jsp"></jsp:include>
		<jsp:include flush="true" page="/main/left_.jsp"></jsp:include>
		<div class="center_body">
			<div class="center_head_text">物料信息</div>
			<div class="center_tools">
			<s:form action="ShowStorehouse" namespace="/baseset" theme="simple" >
				<a href="GoAddStorehouse.action" class="a_top"><img src="<%=base%>/images/img06.gif" border="0" class="a_top">添加</a>
				<input type="text" name="storehouse.s_value" value="<s:property value="storehouse.s_value"/>" class="search_border" size="20"/>
				<input type="image" onclick="submit()" src="<%=base%>/images/img09.gif"/>
			</s:form>
			</div>	
		</div>
		<div class="center_boder">
		
		   <table class="center_table" cellspacing="1" cellpadding="0">
	    <s:if test="lhp.size>0">
	    	<tr class="table_head">
			    <th>仓库编号</th>
		    	<th>仓库名</th>
				<th>所在地</th>
				<th>负责人</th>
				<th>操作</th>
	    	</tr>
	    </s:if>
	    <s:else>
	    	<tr>
	    	<td class="orgstructure_table_td_odd_r" colspan="5">
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
       		<td><s:property value="storehouseCode"/></td>
	        <td><s:property value="storehouseName"/></td>
	        <td><s:property value="storehouseAddress"/></td>
	        <td><s:property value="personName"/></td>
	       	<td>
	       	<a href="GetOneStorehouse.action?storehouse.storehouseCode=<s:property value="storehouseCode"/>"><img src="<%=base%>/images/img03.gif" border="0"></a>|
	       	<a href="#" onclick="showCargo('<s:property value="storehouseCode"/>')"><img src="<%=base%>/images/img06.gif" alt="添加库位" border="0"></a>
	       	</td>
	       	</tr>
	       </s:iterator>
	     </table>
		  
		<div class="pages">
				<s:form action="ShowStorehouse" namespace="/baseset" theme="simple" name="pageform">
       <s:push value="storehouse">
       <s:hidden name="storehouse.s_value" value="%{storehouse.s_value}"></s:hidden>
       <s:hidden id="countsize" name="storehouse.countSize" value="%{storehouse.countSize}"></s:hidden>
       <input type="image"  class="img_size" src="<%=base%>/images/btn_first.gif"  onclick="pageSet(0)"/>
       <s:if test="storehouse.startSize-1<1">
       		<font color="gray">上一页</font>
       </s:if>
       <s:else>
      	  <input class="img_size" type="image" src="<%=base%>/images/btn1_pre.gif" onclick="pageSet(-1)"/>
       </s:else>
       <s:property value="storehouse.startSize"/>/<s:property value="storehouse.countSize"/>
       <s:if test="storehouse.startSize+1>storehouse.countSize">
       		<font color="gray">下一页</font>
       </s:if>
       <s:else>
      	 	<input type="image" class="img_size" src="<%=base%>/images/btn_next.gif" onclick="pageSet(1)"/>
       </s:else>
       		<input type="image" class="img_size" align="bottom" src="<%=base%>/images/btn1_end.gif" onclick="pageSet(2)"/>
        <font color="gray">跳转到：<s:textfield  id="size" size="2" name="storehouse.startSize" cssClass="pages_border"/>页</font>
       </s:push> 
       </s:form>
		</div>
		</div>
		<div class="center_boder_foot"></div>
		<jsp:include flush="true" page="/main/bottom_.jsp"></jsp:include>
	</div>
</body>
</html>