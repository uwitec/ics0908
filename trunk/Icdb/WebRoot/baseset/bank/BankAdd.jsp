<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>

    <head>
        <title>添加新银行信息</title>
    </head>
    <body>
		<s:form action="AddBank" namespace="/baseset">
		<table>
			<tr><td><s:textfield name="bank.bankCode" label="银行编码"></s:textfield></td></tr>
			<tr><td><s:textfield name="bank.bankName" label="银行名称"></s:textfield></td></tr>
			<tr><td align="center"><s:submit value="确认"></s:submit></td></tr>
		</table>
		</s:form>
    </body>
</html>