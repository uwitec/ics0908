<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html>
    <head>
        <title>岗位信息维护</title>
    </head>
    <body>
    <s:push value="job">
      <s:form action="UpdateJob" namespace="/baseset">
    <table border="1">
	  <tr>
	  <td>
	  <s:textfield name="jobCode" value="%{jobCode}" label="岗位编号"></s:textfield>
	  </tr>
	  <tr>
	  <td>
	  <s:textfield name="jobName" value="%{jobName}" label="岗位名称"></s:textfield>
	  </td>
	  <td>
	  <s:select list="ldb" listKey="departmentCode" listValue="departmentName" name="departmentCode" label="所属机构"></s:select>
	  </td>
	  </tr>
	  <tr><td colspan="2"><s:submit></s:submit></td></tr>
     </table>
     </s:form>
     </s:push>
    </body>
</html>