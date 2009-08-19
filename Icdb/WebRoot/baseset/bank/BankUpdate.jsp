<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html>
    <head>
        <title>银行信息维护</title>
    </head>
    <body>
    <s:push value="bank">
      <s:form action="UpdateBank" namespace="/baseset" >
      <table>
	  <tr><td><s:textfield name="bank.bankCode" value="%{bankCode}" label="银行编码" readonly="true"></s:textfield></td></tr>
	  <tr><td><s:textfield name="bank.bankName" value="%{bankName}" label="银行名称"></s:textfield></td></tr>
	  <tr><td colspan="2"><s:submit value="修改"></s:submit></td></tr>
	  </table>
     </s:form>
     </s:push>
    </body>
</html>