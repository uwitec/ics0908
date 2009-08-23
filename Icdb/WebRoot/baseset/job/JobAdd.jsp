<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>

    <head>
        <title>添加岗位信息</title>
    </head>
    <body>
		<s:form action="AddJob" namespace="/baseset">
		<s:textfield name="job.jobCode" label="岗位编号" value="%{job.jobCode}"></s:textfield>
		<s:textfield name="job.jobName" label="岗位名称"></s:textfield>
		<s:select list="ldb" listKey="departmentCode" listValue="departmentName" name="job.departmentCode" label="部门名称" headerKey="-1" headerValue="请选择部门名称">	</s:select>
		<s:submit value="确认"></s:submit>
		</s:form>
    </body>
</html>