<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
    <head>
        <title>现有仓库信息</title>
    </head>
    <body>

    <table border="0">
       <s:iterator value="lsb" status="stat">
       	<tr>
       	<td><s:hidden value="storehouseCode"></s:hidden>
        <td><s:url id="updateUrl" action="GetStockMaterielList">
			<s:param name="storehouse.storehouseCode" value="storehouseCode"></s:param>       
        	</s:url> 
        	<s:a href="%{updateUrl}"><s:property value="storehouseName"></s:property></s:a>
        </td>
        </tr>
       </s:iterator>
     </table>
    </body>
</html>