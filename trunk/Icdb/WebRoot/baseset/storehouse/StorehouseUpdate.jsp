<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>

<% String base=request.getContextPath(); %>
    <head>
        <title>添加新仓库</title>
    </head>
    <SCRIPT type="text/javascript">
    function showEmployee(){
	window.showModalDialog("<%=base%>/baseset/FindEmployee.jsp","","dialogHeight:400px;dialogWidth:500px");
}
    </SCRIPT>
    <body>
		<s:form action="UpdateStorehouse" namespace="/baseset">
		<table>
		<s:push value="storehouse">
			<s:textfield name="storehouse.storehouseCode" label="仓库编号" value="%{storehouseCode}" readonly="true"></s:textfield>
			<s:textfield name="storehouse.storehouseName" label="仓库名" value="%{storehouseName}"></s:textfield>
			<s:textfield name="storehouse.storehouseAddress" label="所在地" value="%{storehouseAddress}"></s:textfield>
			<s:textfield name="storehouse.storehouseDefaultCargo" label="默认货位" value="%{storehouseDefaultCargo}"></s:textfield>
			<s:textfield id="personName" name="storehouse.personName" label="负责人" value="%{personName}" onclick="showEmployee()"></s:textfield>
			<s:hidden id="employeeCode" name="storehouse.employeeCode" value="%{employeeCode}"></s:hidden>
		<tr><td align="center"><s:submit value="确认"></s:submit></td></tr>
		</s:push>
		</table>
		</s:form>
    </body>
</html>