<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html>
    <head>
        <title>修改机构信息</title>
    </head>
    <body>
    <s:push value="struct">
      <s:form action="UpdateStruct" namespace="/baseset">
	  <s:textfield name="struct.structCode" value="%{structCode}" label="机构编码" readonly="true"></s:textfield>
	  <s:textfield name="struct.structName" value="%{structName}" label="机构名称"></s:textfield>
	  <s:submit value="修改"></s:submit>
     </s:form>
     </s:push>
    </body>
</html>