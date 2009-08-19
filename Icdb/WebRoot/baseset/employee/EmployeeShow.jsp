<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
    <head>
        <title>员工信息</title>
    </head>
    <body>
	<s:form action="SelectEmployeeDef">
		<s:textfield name="res.s_value" label="内容"></s:textfield>
		<s:hidden name="employee.employeeCode"></s:hidden>
		<s:submit value="查找"></s:submit>
	</s:form>
    <table border="1">
    <s:if test="lhp.size>0">
    	<tr>
    	<th>员工编号</th>
    	<th>员工姓名</th>
		<th>所属岗位</th>
		<th>所在部门</th>
		<th>操作</th>
		</tr>
	</s:if>
	<s:else>
		未找到相关数据
	</s:else>
       <s:iterator value="lhp" status="stat">
       	<tr>
       	<td><s:property value="employeeCode"></s:property></td>
        <td><s:property value="personName"></s:property></td>
        <td><s:property value="jobName"></s:property></td>
        <td><s:property value="departmentName"></s:property></td>
        <td><s:url id="updateUrl" action="GetOneEmployee">
			<s:param name="employee.employeeCode" value="employeeCode"></s:param>       
        	</s:url> 
        	<s:a href="%{updateUrl}">修改</s:a>
        </td>
        </tr>
       </s:iterator>
     </table>
     <s:a href="GoAddEmployee.action">添加</s:a>
    </body>
</html>