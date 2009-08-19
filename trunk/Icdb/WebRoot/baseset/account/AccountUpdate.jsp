<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<% String base=request.getContextPath(); %>
    <head>
        <title>修改帐号信息</title>
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
		<s:form action="UpdateAccount" namespace="/baseset">
		 <s:push value="account">
		<table>
			<s:textfield name="account.accountCode" label="账户编号" value="%{accountCode}" readonly="true"></s:textfield>
			<s:textfield name="account.accountNumber" label="帐号" value="%{accountNumber}"></s:textfield>
			<s:textfield name="account.accountName" label="帐户名" value="%{accountName}"></s:textfield>
			<s:textfield name="account.accountType" label="帐号类型" value="%{accountType}"></s:textfield>
			<s:textfield id="personName" name="account.personName" value="%{personName}" label="户主" onclick="showPerson()"></s:textfield>
			<s:hidden id="personCode" name="account.personCode" value="%{personCode}"></s:hidden>
			<s:textfield id="bankName" name="account.bankName" value="%{bankName}" label="所属银行" onclick="showBank()"></s:textfield>
			<s:hidden id="bankCode" name="account.bankCode" value="%{bankCode}"></s:hidden>
			<tr><td align="center"><s:submit value="确认"></s:submit></td></tr>
		</table>
		</s:push>
		</s:form>
    </body>
</html>