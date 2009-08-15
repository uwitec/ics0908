<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%int i=1;%>
<html>
    <head>
        <title>部门信息</title>
    </head>
    <body>
    <table border="1">
    	<tr><th>序号</th><th>部门名称</th><th>所属机构</th><th>操作</th></tr>
       <s:iterator value="lhp" status="stat">
       	<tr>
       	
       	<td><%=i++%></td>
        <td><s:property value="departmentName"></s:property></td>
        <td><s:property value="structName"></s:property></td>
        <td><s:url id="updateUrl" action="GetOneDepartment">
			<s:param name="departmentCode" value="departmentCode"></s:param>      
        	</s:url> 
        	<s:url id="deleteUrl" action="DeleteDepartment">
			<s:param name="departmentCode" value="departmentCode"></s:param>      
        	</s:url>
        	<s:a href="%{updateUrl}">修改</s:a>
        	<s:a href="%{deleteUrl}">删除</s:a>
        </td>
        </tr>
       </s:iterator>
     </table>
  	<s:a href="GoAddDepartment.action">添加</s:a>
    </body>
</html>