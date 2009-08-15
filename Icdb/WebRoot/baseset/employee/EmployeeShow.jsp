<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
    <head>
        <title>员工信息</title>
    </head>
    <body>

    <table border="1">
    	<tr>
    	<th>员工编号</th>
    	<th>员工姓名</th>
		<th>所属岗位</th>
		<th>所在部门</th>
		<th>操作</th>
		</tr>
       <s:iterator value="lhp" status="stat">
       	<tr>
       	<td><s:property value="employeeCode"></s:property></td>
        <td><s:property value="personName"></s:property></td>
        <td><s:property value="jobName"></s:property></td>
        <td><s:property value="departmentName"></s:property></td>
        <td><s:url id="updateUrl" action="GetOneEmployee">
			<s:param name="employeeCode" value="employeeCode"></s:param>       
        	</s:url> 
        	<s:a href="%{updateUrl}">修改</s:a>
        </td>
        </tr>
       </s:iterator>
     </table>
     <s:a href="GoAddEmployee.action">添加</s:a>
    </body>
</html>