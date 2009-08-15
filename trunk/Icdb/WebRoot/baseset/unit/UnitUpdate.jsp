<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html>
    <head>
        <title>计量单位信息维护</title>
    </head>
    <body>
    <s:push value="unit">
      <s:form action="UpdateUnit" namespace="/baseset">
    <table border="1">
	  <tr>
	  <td>
	  <s:textfield name="unitCode" value="%{unitCode}" label="计量单位编号"></s:textfield>
	  </tr>
	  <tr>
	  <td>
	  <s:textfield name="unitName" value="%{unitName}" label="计量单位名称"></s:textfield>
	  <s:hidden name="isEnabled" value="%{isEnabled}"></s:hidden>
	  </td>
	  <td>
	  <s:select list="lph" listKey="unitTypeCode" listValue="unitTypeName" name="unitTypeCode" label="所属类型"></s:select>
	  </td>
	  </tr>
	  <tr><td colspan="2"><s:submit></s:submit></td></tr>
     </table>
     </s:form>
     </s:push>
    </body>
</html>