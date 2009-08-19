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
		<s:form action="UpdateSupplier" namespace="/baseset">
		<s:push value="supplier">
		<s:textfield name="supplier.supplierCode" label="供应商编码" value="%{supplierCode}"></s:textfield>
        <s:textfield name="supplier.supplierName" label="供应商名称" value="%{supplierName}"></s:textfield>
        <s:textfield name="supplier.supplierAddress" label="供应商地址" value="%{supplierAddress}"></s:textfield>
        <s:textfield name="supplier.supplierPhone" label="供应商电话" value="%{supplierPhone}"></s:textfield>
        <s:textfield name="supplier.supplierFax" label="供应商传真" value="%{supplierFax}"></s:textfield>
        <s:textfield name="supplier.supplierZipCode" label="供应商邮编" value="%{supplierZipCode}"></s:textfield>
        <s:textfield name="supplier.supplierTaxFileNumber" label="税号" value="%{supplierTaxFileNumber}"></s:textfield>
        <s:textfield name="supplier.supplierRemark" label="备注" value="%{supplierRemark}"></s:textfield>
        <s:textfield id="personName" name="supplier.personName" value="%{personName}" label="联系人名称" onclick="showPerson()"></s:textfield>
        <s:hidden id="personCode" name="supplier.personCode" value="%{personCode}"></s:hidden>
        <s:textfield id="accountNumber" name="supplier.accountNumber" value="%{accountNumber}" label="银行帐号" onclick="showAccount()"></s:textfield>
        <s:hidden id="accountCode" name="supplier.accountCode" value="%{accountCode}"></s:hidden>
        <s:textfield id="bankName" name="supplier.bankName" value="%{bankName}" label="所属银行"></s:textfield>
		<s:hidden id="bankCode" name="supplier.bankCode" value="%{bankCode}"></s:hidden>
		<s:submit value="确认"></s:submit>
		</s:push>
		</s:form>
    </body>
</html>