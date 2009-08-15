<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html>
    <head>
        <title>部门信息维护</title>
    </head>
    <body>
    <s:push value="department">
      <s:form action="UpdateDepartment" namespace="/baseset">
    <table border="1">
	  <tr>
	  <td>
	  <s:textfield name="departmentCode" value="%{departmentCode}" label="部门编号" readonly="true"></s:textfield>
	  </tr>
	  <tr>
	  <td>
	  <s:textfield name="departmentName" value="%{departmentName}" label="部门名称"></s:textfield>
	  </td>
	  <td>
	  <s:select list="lsb" listKey="structCode" listValue="structName" name="structCode" label="所属机构"></s:select>
	  </td>
	  </tr>
	  <tr><td colspan="2"><s:submit></s:submit></td></tr>
     </table>
     </s:form>
     </s:push>
    </body>
</html>