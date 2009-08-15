<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html>
    <head>
        <title>机构信息维护</title>
    </head>
    <body>
    <s:push value="struct">
      <s:form action="UpdateStruct" namespace="/baseset">
    <table border="1">
	  <tr>
	  <td>
	  <s:textfield name="structCode" value="%{structCode}" label="机构编码"></s:textfield>
	 </td>
	  </tr>
	  <tr>
	  <td>
	  <s:textfield name="structName" value="%{structName}" label="机构名称"></s:textfield>
	  </td>
	  </tr>
	  <tr><td colspan="2"><s:submit></s:submit></td></tr>
     </table>
     </s:form>
     </s:push>
    </body>
</html>