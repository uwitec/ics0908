<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>

    <head>
        <title>修改库位</title>
    </head>
    <body>
		<s:form action="UpdateCargoSpace" namespace="/baseset">
		<s:push value="cargoSpace">
			<s:textfield name="cargoSpace.cargoSpaceCode" label="仓库编号" value="%{cargoSpaceCode}" readonly="true"></s:textfield>
			<s:textfield name="cargoSpace.cargoSpaceName" label="仓库名" value="%{cargoSpaceName}"></s:textfield>
			<s:textfield name="cargoSpace.cargoSpaceAddress" label="所在地" value="%{cargoSpaceAddress}"></s:textfield>
			<s:textfield name="cargoSpace.storehouseName" label="所属仓库" value="%{storehouseName}" readonly="true"></s:textfield>
			<s:hidden id="storehouseCode" name="cargoSpace.storehouseCode"></s:hidden>
		<s:submit value="确认"></s:submit>
		</s:push>
		</s:form>
    </body>
</html>