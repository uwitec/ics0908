<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
    <head>
        <title>仓库信息</title>
    </head>
    <body>
    <% 
String base=request.getContextPath();
%>  
    <script type="text/javascript" src="<%=base%>/javascript/innerText.js"></script>
    
	<s:form action="ShowStorehouse">
		<s:textfield name="storehouse.s_value" label="内容"></s:textfield>
		<s:hidden name="storehouse.storehouseCode"></s:hidden>
		<s:submit value="查询"></s:submit>
	</s:form>
    <table border="1">
    <s:if test="lhp.size>0">
    	<tr>
    	<th>仓库编号</th>
    	<th>仓库名</th>
		<th>所在地</th>
		<th>默认货位</th>
		<th>负责人</th>
		<th>操作</th>
		</tr>
	</s:if>
	<s:else>
		未找到合适的信息！
	</s:else>
       <s:iterator value="lhp" status="stat">
       	<tr>
       	<td><s:property value="storehouseCode"></s:property></td>
        <td><s:property value="storehouseName"></s:property></td>
        <td><s:property value="storehouseAddress"></s:property></td>
        <td><s:property value="storehouseDefaultCargo"></s:property></td>
        <td><s:property value="personName"></s:property></td>
        <td><s:url id="updateUrl" action="GetOneStorehouse">
			<s:param name="storehouse.storehouseCode" value="storehouseCode"></s:param>       
        	</s:url> 
        	<s:a href="%{updateUrl}">修改</s:a>
        	|
        	<s:url id="showUrl" action="ShowCargoSpace">
			<s:param name="cargoSpace.storehouseCode" value="storehouseCode"></s:param>
			<s:param name="cargoSpace.storehouseName" value="storehouseName"></s:param>       
        	</s:url> 
        	<s:a href="%{showUrl}">详细信息</s:a>
        </td>
        </tr>
       </s:iterator>
       <tr><td colspan="6">
       <s:form action="ShowStorehouse" namespace="/baseset" theme="simple" name="pageform">
       <s:push value="storehouse">
       <s:hidden name="storehouse.s_value" value="%{storehouse.s_value}"></s:hidden>
       <s:hidden id="countsize" name="storehouse.countSize" value="%{storehouse.countSize}"></s:hidden>
        <input size="10" type="button" onclick="pageSet(0)" value="首页"/>
       <s:if test="storehouse.startSize-1<1">
       		<font color="gray">上一页</font>
       </s:if>
       <s:else>
      	   <input size="10" type="button" onclick="pageSet(-1)" value="上一页"/>
       </s:else>
       <s:if test="storehouse.startSize+1>storehouse.countSize">
       		<font color="gray">下一页</font>
       </s:if>
       <s:else>
      	 	<input size="10" type="button" onclick="pageSet(1)" value="下一页"/>
       </s:else>
       		<input size="10" type="button" onclick="pageSet(2)" value="末页"/>
        第<s:textfield id="size" size="2" name="storehouse.startSize"></s:textfield>页
       <font><s:property value="storehouse.startSize"/>/<s:property value="storehouse.countSize"/>页数</font>
       </s:push> 
       </s:form>
       </td></tr>
     </table>
     <s:a href="GoAddStorehouse.action">添加</s:a>
    </body>
</html>