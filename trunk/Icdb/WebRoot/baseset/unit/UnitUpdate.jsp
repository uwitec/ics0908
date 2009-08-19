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
	  <s:textfield name="unit.unitCode" value="%{unitCode}" label="计量单位编号" readonly="true"></s:textfield>
	  <s:textfield name="unit.unitName" value="%{unitName}" label="计量单位名称"></s:textfield>
	  <s:select list="lph" listKey="unitTypeCode" listValue="unitTypeName" name="unit.unitTypeCode" label="所属类型"></s:select>
	  <s:submit value="确认"></s:submit>
     </s:form>
     </s:push>
    </body>
</html>