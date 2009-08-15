<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>

    <head>
        <title>添加新类型信息</title>
    </head>
    <body>
		<s:form action="AddUnitType" namespace="/baseset">
		<table>
			<tr><td><s:textfield name="unitTypeCode" label="类型编码"></s:textfield></td></tr>
			<tr><td><s:textfield name="unitTypeName" label="类型名称"></s:textfield></td></tr>
			<tr><td><s:textarea name="unitTypeRemark" cols="20" rows="6" label="类型描述"></s:textarea></td></tr>
			<tr><td align="center"><s:submit value="确认"></s:submit></td></tr>
		</table>
		</s:form>
    </body>
</html>