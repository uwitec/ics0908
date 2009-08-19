<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>

    <head>
        <title>添加机构信息</title>
    </head>
    <body>
		<s:form action="AddStruct" namespace="/baseset">
		<table>
			<tr><td><s:textfield name="struct.structCode" label="机构编码" value="%{struct.structCode}" readonly="true"></s:textfield></td></tr>
			<tr><td><s:textfield name="struct.structName" label="机构名称"></s:textfield></td></tr>
			<tr><td align="center"><s:submit value="确认"></s:submit></td></tr>
		</table>
		</s:form>
    </body>
</html>