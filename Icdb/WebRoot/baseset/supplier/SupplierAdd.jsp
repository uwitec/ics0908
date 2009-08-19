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
function showAccount(){
	window.showModalDialog("<%=base%>/baseset/FindAccount.jsp","","dialogHeight:400px;dialogWidth:500px");
}
</script>

    <body>
		<s:form action="AddSupplier" namespace="/baseset">
		<table>
		<s:textfield name="supplier.supplierCode" label="供应商编码" value="%{supplier.supplierCode}"></s:textfield>
        <s:textfield name="supplier.supplierName" label="供应商名称"></s:textfield>
        <s:textfield name="supplier.supplierAddress" label="供应商地址"></s:textfield>
        <s:textfield name="supplier.supplierPhone" label="供应商电话"></s:textfield>
        <s:textfield name="supplier.supplierFax" label="供应商传真"></s:textfield>
        <s:textfield name="supplier.supplierZipCode" label="供应商邮编"></s:textfield>
        <s:textfield name="supplier.supplierTaxFileNumber" label="税号"></s:textfield>
        <s:textfield name="supplier.supplierRemark" label="备注"></s:textfield>
        <s:textfield id="personName" name="supplier.personName" label="联系人名称" onclick="showPerson()"></s:textfield>
        <s:hidden id="personCode" name="supplier.personCode"></s:hidden>
        <s:textfield id="accountNumber" name="supplier.accountName" label="银行帐号" onclick="showAccount()"></s:textfield>
        <s:hidden id="accountCode" name="supplier.accountCode"></s:hidden>
        <s:textfield id="bankName" name="supplier.bankName" label="所属银行"></s:textfield>
		<s:hidden id="bankCode" name="supplier.bankCode"></s:hidden>
			<tr><td align="center"><s:submit value="确认"></s:submit></td></tr>
		</table>
		</s:form>
    </body>
</html>