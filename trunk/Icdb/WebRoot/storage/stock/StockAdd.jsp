<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<% String base=request.getContextPath(); %>
<html>
    <head>
        <title>初期库存</title>
		 <link href="<%=base%>/css/left_css.css" type="text/css" rel="stylesheet">
	    <link href="<%=base%>/css/body_css.css" type="text/css" rel="stylesheet">
	    <link href="<%=base%>/css/center_css.css" type="text/css" rel="stylesheet">
	</head>
<body>
<script type="text/javascript" src="<%=base%>/javascript/innerText.js"></script>
	<SCRIPT type="text/javascript">
  	function createTable(){
  		var num=document.getElementById("rowcount").value;
  		var allValue="";
  		for(var i=0;i<num;i++){
  			allValue+="<tr><td><input type='text' name='stock.materielName["+i+"]'/>";
  			allValue+="<input type='hidden' name='stock.matereilCode["+i+"]'/></td>";
  			allValue+="<td><input type='text' name='stock.cargoSpaceName["+i+"]'/>";
  			allValue+="<input type='hidden' name='stock.cargoSpaceCode["+i+"]'/></td>";
  			allValue+="<td><input type='text' name='stock.stockPrice["+i+"]'/></td>";
			allValue+="<td><input type='text' name='stock.stockAmount["+i+"]'/></td></tr>";
  		}
  		document.getElementById("inputTable").innerHTML=allValue;
  	}
  	
  	</SCRIPT>
<body topmargin="0">
	<div class="body_div">
		<jsp:include flush="true" page="/pagecom/head.jsp"></jsp:include>
		<div class="left_body">
		<jsp:include flush="true" page="/main/left_.jsp"></jsp:include>
		<div class="center_body">
			<div class="center_head_text">物料信息</div>
			<div class="center_tools">
			<s:form action="ShowMateriel" namespace="/baseset" theme="simple" >
				<a href="#" onclick="AddMat()" class="a_top"><img src="<%=base%>/images/img06.gif" border="0" class="a_top">添加</a>
				<input type="text" name="materiel.s_value" value="<s:property value="materiel.s_value"/>" class="search_border" size="20"/>
				<input type="image" onclick="submit()" src="<%=base%>/images/img09.gif"/>
			</s:form>
			</div>	
		</div>
		<div class="center_boder">
		
		<table class="center_table" cellspacing="1" cellpadding="0">
	    <s:if test="lhp.size>0">
	    	<tr class="table_head">
			   <td>物品编号</td>
			   <td>物品名称</td>
			   <td>产地</td>
			   <td>规格</td>
			   <td>ABC类别</td>
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
       		<td><s:property value="materielCode"/></td>
			<td><s:property value="materielName"/></td>
			<td><s:property value="materielMadeIn"/></td>
			<td><s:property value="materielSize"/></td>
			<td>
			<s:iterator value="lsb" status="inner">
				<s:if test="key==materielABC">
					<s:property value="value"/>
				</s:if>
			</s:iterator></td>
	       	<td><a href="#" onclick="UpdateMat('<s:property value="materielCode"/>')"><img src="<%=base%>/images/img03.gif" border="0"></a></td>
	       	</tr>
	       </s:iterator>
	     </table>
		  
		<div class="pages">
				<s:form action="ShowMateriel" namespace="/baseset" theme="simple" name="pageform">
       <s:push value="materiel">
       <s:hidden name="materiel.s_value" value="%{materiel.s_value}"></s:hidden>
       <s:hidden id="countsize" name="materiel.countSize" value="%{materiel.countSize}"></s:hidden>
       <input type="image"  class="img_size" src="<%=base%>/images/btn_first.gif"  onclick="pageSet(0)"/>
       <s:if test="materiel.startSize-1<1">
       		<font color="gray">上一页</font>
       </s:if>
       <s:else>
      	  <input class="img_size" type="image" src="<%=base%>/images/btn1_pre.gif" onclick="pageSet(-1)"/>
       </s:else>
       <s:property value="materiel.startSize"/>/<s:property value="materiel.countSize"/>
       <s:if test="materiel.startSize+1>materiel.countSize">
       		<font color="gray">下一页</font>
       </s:if>
       <s:else>
      	 	<input type="image" class="img_size" src="<%=base%>/images/btn_next.gif" onclick="pageSet(1)"/>
       </s:else>
       		<input type="image" class="img_size" align="bottom" src="<%=base%>/images/btn1_end.gif" onclick="pageSet(2)"/>
        <font color="gray">跳转到：<s:textfield  id="size" size="2" name="materiel.startSize" cssClass="pages_border"/>页</font>
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