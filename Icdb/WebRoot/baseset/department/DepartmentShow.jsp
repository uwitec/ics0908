<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html>
    <head>
        <title>部门信息</title>
    </head>
    <body>
    <s:form action="SelectDepartmentDef">
    	<s:textfield name="res.s_value" label="内容"></s:textfield>
    	<s:hidden name="department.departmentCode"></s:hidden>
    	<s:submit value="查询"></s:submit>
    </s:form>
    <table border="1">
    	<s:if test="lhp.size>0">
    	<tr><th>部门编号</th><th>部门名称</th><th>所属机构</th><th>操作</th></tr>
    	</s:if>
    	<s:else>
    		未找到符合的信息！
    	</s:else>
       <s:iterator value="lhp" status="stat">
       	<tr>
       	<td><s:property value="departmentCode"></s:property></td>
        <td><s:property value="departmentName"></s:property></td>
        <td><s:property value="structName"></s:property></td>
        <td><s:url id="updateUrl" action="GetOneDepartment">
			<s:param name="department.departmentCode" value="departmentCode"></s:param>      
        	</s:url> 
        	<s:url id="deleteUrl" action="DeleteDepartment">
			<s:param name="department.departmentCode" value="departmentCode"></s:param>      
        	</s:url>
        	<s:a href="%{updateUrl}">修改</s:a>
        </td>
        </tr>
       </s:iterator>
     </table>
  	<s:a href="GoAddDepartment.action">添加</s:a>
    </body>
</html>