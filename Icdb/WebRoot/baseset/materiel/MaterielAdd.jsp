<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>

    <head>
        <title>添加物料信息</title>
    </head>
    <body>
		<s:form action="AddMateriel" namespace="/baseset">
		<s:textfield name="materiel.materielCode" label="物品编码" value="%{materiel.materielCode}" readonly="true"></s:textfield>
		<s:textfield name="materiel.materielName" label="物品名称"></s:textfield>
		<s:textfield name="materiel.materielMadeIn" label="产地"></s:textfield>
		<s:textfield name="materiel.materielPrice" label="单价"></s:textfield>
		<s:textfield name="materiel.materielMaxStore" label="最大库存量"></s:textfield>
		<s:textfield name="materiel.materielMinStore" label="最小库存量"></s:textfield>
		<s:textfield name="materiel.materielSize" label="规格"></s:textfield>
		<s:select list="lsb" listValue="value" listKey="key" name="materiel.materielABC" label="部门名称"></s:select>
		<s:submit value="确认"></s:submit>
		</s:form>
    </body>
</html>