<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>

    <head>
        <title>添加岗位信息</title>
    </head>
    <body>
		<s:form action="AddJob" namespace="/baseset">
		<table>
			<tr><td><s:textfield name="jobCode" label="岗位编号" value="%{jobCode}"></s:textfield></td></tr>
			<tr><td><s:textfield name="jobName" label="岗位名称"></s:textfield></td></tr>
			<tr><td>
			<s:select list="ldb" listKey="departmentCode" listValue="departmentName" name="departmentCode" label="部门名称" headerKey="-1" headerValue="请选择部门名称">		
			</s:select>
			</td></tr>
			<tr><td align="center"><s:submit value="确认"></s:submit></td></tr>
		</table>
		</s:form>
    </body>
</html>