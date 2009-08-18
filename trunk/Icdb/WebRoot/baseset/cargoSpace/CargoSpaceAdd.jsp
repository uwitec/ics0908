<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>

    <head>
        <title>添加新库位</title>
    </head>
    <body>
		<s:form action="AddCargoSpace" namespace="/baseset">
		<table>
			<s:textfield name="cargoSpaceCode" label="仓库编号" value="%{cargoSpaceCode}"></s:textfield>
			<s:textfield name="cargoSpaceName" label="仓库名" ></s:textfield>
			<s:textfield name="cargoSpaceAddress" label="所在地"></s:textfield>
			<s:textfield name="storehouseName" label="所属仓库" value="%{storehouseName}"></s:textfield>
			<s:hidden id="storehouseCode" name="storehouseCode"></s:hidden>
		<tr><td align="center"><s:submit value="确认"></s:submit></td></tr>
		</table>
		</s:form>
    </body>
</html>