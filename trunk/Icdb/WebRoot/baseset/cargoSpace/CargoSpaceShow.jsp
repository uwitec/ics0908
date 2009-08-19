<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
    <head>
        <title>货位信息</title>
    </head>
    <body>
	<s:if test="lhp.size>0">
    <table border="1">
    	<tr>
    	<th colspan="4">
    	<s:property value="cargoSpace.storehouseName"></s:property>
    	<s:if test="cargoSpace.storehouseName!=null">
    		的库位信息
    	</s:if>
    	</th>
    	</tr>
    	<tr>
    	<th>货位编号</th>
    	<th>货位名</th>
		<th>所在地</th>
		<th>操作</th>
		</tr>
       <s:iterator value="lhp" status="stat">
       	<tr>
       	<td><s:property value="cargoSpaceCode"></s:property></td>
        <td><s:property value="cargoSpaceName"></s:property></td>
        <td><s:property value="cargoSpaceAddress"></s:property></td>
        <td><s:url id="updateUrl" action="GetOneCargoSpace">
			<s:param name="cargoSpace.cargoSpaceCode" value="cargoSpaceCode"></s:param>       
        	</s:url> 
        	<s:a href="%{updateUrl}">修改</s:a>
        </td>
        </tr>
       </s:iterator>
     </table>
     </s:if>
     <s:else>
      	未有相关信息！<br/>
     </s:else>
     <s:url id="addUrl" action="GoAddCargoSpace">
     	<s:param name="cargoSpace.storehouseCode" value="cargoSpace.storehouseCode"></s:param>
     	<s:param name="cargoSpace.storehouseName" value="cargoSpace.storehouseName"></s:param>
     </s:url>
     <s:a href="%{addUrl}">添加</s:a>
    </body>
</html>