<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<% String base=request.getContextPath(); %>
    <head>
        <title>添加帐号信息</title>
    </head>
<script type="text/javascript">
function showPerson(){
	window.showModalDialog("<%=base%>/baseset/FindPerson.jsp","","dialogHeight:400px;dialogWidth:500px");
}
function showBank(){
	window.showModalDialog("<%=base%>/baseset/FindBank.jsp","","dialogHeight:400px;dialogWidth:500px");
}
</script>

    <body>
		<s:form action="AddAccount" namespace="/baseset">
		<table>
			<s:textfield name="accountCode" label="账户编号" value="%{accountCode}"></s:textfield>
			<s:textfield name="accountNumber" label="帐号"></s:textfield>
			<s:textfield name="accountName" label="帐户名"></s:textfield>
			<s:textfield name="accountType" label="帐号类型"></s:textfield>
			<s:textfield id="personName" name="personName" label="户主" onclick="showPerson()"></s:textfield>
			<s:hidden id="personCode" name="personCode"></s:hidden>
			<s:textfield id="bankName" name="bankName" label="所属银行" onclick="showBank()"></s:textfield>
			<s:hidden id="bankCode" name="bankCode"></s:hidden>
			<tr><td align="center"><s:submit value="确认"></s:submit></td></tr>
		</table>
		</s:form>
    </body>
</html>