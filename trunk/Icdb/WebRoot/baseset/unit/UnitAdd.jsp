<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>

    <head>
        <title>添加计量单位信息</title>
    </head>
    <body>
		<s:form action="AddUnit" namespace="/baseset">
		<s:textfield name="unit.UnitCode" label="计量单位编号"></s:textfield>
		<s:textfield name="unit.UnitName" label="计量单位名称"></s:textfield>
		<s:select list="utb" listKey="unitTypeCode" listValue="unitTypeName" name="unit.unitTypeCode" label="类型名称" headerKey="-1" headerValue="请选择类型名称"></s:select>
		<s:submit value="确认"></s:submit>
		</s:form>
    </body>
</html>