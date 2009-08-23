<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>

    <head>
        <title>添加新库位</title>
    </head>
    <body>
		<s:form action="AddCargoSpace" namespace="/baseset">
			<s:textfield name="cargoSpace.cargoSpaceCode" label="仓库编号" value="%{cargoSpace.cargoSpaceCode}" readonly="true"></s:textfield>
			<s:textfield name="cargoSpace.cargoSpaceName" label="仓库名" ></s:textfield>
			<s:textfield name="cargoSpace.cargoSpaceAddress" label="所在地"></s:textfield>
			<s:textfield name="cargoSpace.storehouseName" label="所属仓库" value="%{cargoSpace.storehouseName}" readonly="true"></s:textfield>
			<s:hidden id="storehouseCode" name="cargoSpace.storehouseCode" value="%{cargoSpace.storehouseCode}"></s:hidden>
			<s:submit value="确认"></s:submit>
		</s:form>
    </body>
</html>