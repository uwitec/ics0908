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
function showAccount(){
	window.showModalDialog("<%=base%>/baseset/FindAccount.jsp","","dialogHeight:400px;dialogWidth:500px");
}
</script>

    <body>
		<s:form action="UpdateSupplier" namespace="/baseset">
		<table>
		<s:textfield name="supplierCode" label="供应商编码" value="%{supplierCode}"></s:textfield>
        <s:textfield name="supplierName" label="供应商名称" value="%{supplierName}"></s:textfield>
        <s:textfield name="supplierAddress" label="供应商地址" value="%{supplierAddress}"></s:textfield>
        <s:textfield name="supplierPhone" label="供应商电话" value="%{supplierPhone}"></s:textfield>
        <s:textfield name="supplierFax" label="供应商传真" value="%{supplierFax}"></s:textfield>
        <s:textfield name="supplierZipCode" label="供应商邮编" value="%{supplierZipCode}"></s:textfield>
        <s:textfield name="supplierTaxFileNumber" label="税号" value="%{supplierTaxFileNumber}"></s:textfield>
        <s:textfield name="supplierRemark" label="备注" value="%{supplierRemark}"></s:textfield>
        <s:textfield name="peopleName" label="联系人名称" value="%{peopleName}" onclick="showPerson"></s:textfield>
        <s:textfield name="accountName" label="银行帐号" value="%{accountName}" onclick="showAccount"></s:textfield>
        <s:textfield name="bankName" label="所属银行" value="%{bankName}" onclick="showBank"></s:textfield>
			<tr><td align="center"><s:submit value="确认"></s:submit></td></tr>
		</table>
		</s:form>
    </body>
</html>