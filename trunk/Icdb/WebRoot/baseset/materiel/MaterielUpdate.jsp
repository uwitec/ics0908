<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>

    <head>
        <title>修改物料信息</title>
    </head>
    <body>
		<s:form action="UpdateMateriel" namespace="/baseset">
		<s:textfield name="materiel.materielCode" label="物品编码" value="%{materiel.materielCode}"></s:textfield>
		<s:textfield name="materiel.materielName" label="物品名称" value="%{materiel.materielName}"></s:textfield>
		<s:textfield name="materiel.materielMadeIn" label="产地" value="%{materiel.materielMadeIn}"></s:textfield>
		<s:textfield name="materiel.materielPrice" label="单价" value="%{materiel.materielPrice}"></s:textfield>
		<s:textfield name="materiel.materielMaxStore" label="最大库存量" value="%{materiel.materielMaxStore}"></s:textfield>
		<s:textfield name="materiel.materielMinStore" label="最小库存量" value="%{materiel.materielMinStore}"></s:textfield>
		<s:textfield name="materiel.materielSize" label="规格" value="%{materiel.materielSize}"></s:textfield>
		<s:select list="lsb" listKey="key" listValue="value" name="materiel.materielABC"  label="部门名称"></s:select>
		<s:submit value="确认"></s:submit>
		</s:form>
    </body>
</html>