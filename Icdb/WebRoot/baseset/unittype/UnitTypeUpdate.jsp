<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html>
    <head>
        <title>类型信息维护</title>
    </head>
    <body>
    <s:push value="utb">
      <s:form action="UpdateUnitType" namespace="/baseset">
    <table border="1">
	  <tr>
	  <td>
	  <s:textfield name="unitTypeCode" value="%{unitTypeCode}" label="类型编码"></s:textfield>
	  </td>
	  </tr>
	  <tr>
	  <td>
	  <s:textfield name="unitTypeName" value="%{unitTypeName}" label="类型名称"></s:textfield>
	  </td>
	  </tr>
	  <tr>
	  <td>
	  <s:textarea name="unitTypeRemark" value="%{unitTypeRemark}" label="类型描述" cols="20" rows="6"></s:textarea>
		</td>
	  </tr>
	  <tr><td colspan="2"><s:submit></s:submit></td></tr>
     </table>
     </s:form>
     </s:push>
    </body>
</html>