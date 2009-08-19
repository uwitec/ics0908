<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html>
    <head>
        <title>部门信息维护</title>
    </head>
    <body>
    <s:push value="department">
      <s:form action="UpdateDepartment" namespace="/baseset" >
		  <s:textfield name="department.departmentCode" value="%{department.departmentCode}" label="部门编号" readonly="true"></s:textfield>
		  <s:textfield name="department.departmentName" value="%{department.departmentName}" label="部门名称"></s:textfield>
		  <s:select list="lsb" listKey="structCode" listValue="structName" name="department.structCode" label="所属机构"></s:select>
		  <s:submit value="修改"></s:submit>
     </s:form>
     </s:push>
    </body>
</html>