<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
    <head>
        <title>初期库存信息</title>
    </head>
    <body>
<% 
String base=request.getContextPath();
%>
	<s:push value="storehouse">
	所属仓库：<s:property value="storehouse.storehouseName"/><br/>
	仓库负责人:<s:property value="storehouse.personName"/>
	</s:push>
    <table border="1">
    	<tr>
    	<th>物料名称</th>
    	<th>库位名称</th>
    	<th>单价</th>
    	<th>数量</th>
    	</tr>
       <s:iterator value="lsb" status="stat">
       	<tr>
       	<td><s:property value="materielName"></s:property></td>
       	<td><s:property value="cargoSpaceName"></s:property></td>
       	<td><s:property value="stockPrice"></s:property></td>
       	<td><s:property value="stockAmount"></s:property></td>
        </tr>
       </s:iterator>
     </table>
     <a href="<%=base%>/store">录入初期库存</a>
    </body>
</html>