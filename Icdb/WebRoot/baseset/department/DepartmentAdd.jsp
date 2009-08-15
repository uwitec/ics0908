<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>

    <head>
        <title>添加部门信息</title>
    </head>
    <body>
		<s:form action="AddDepartment" namespace="/baseset">
		<table>
			<tr><td><s:textfield name="departmentCode" label="部门编号" value="%{departmentCode}"></s:textfield></td></tr>
			<tr><td><s:textfield name="departmentName" label="部门名称"></s:textfield></td></tr>
			<tr><td>
			<s:select list="lsb" listKey="structCode" listValue="structName" name="structCode" label="机构名称" headerKey="-1" headerValue="请选择机构名称">		
			</s:select>
			</td></tr>
			<tr><td align="center"><s:submit value="确认"></s:submit></td></tr>
		</table>
		</s:form>
    </body>
</html>