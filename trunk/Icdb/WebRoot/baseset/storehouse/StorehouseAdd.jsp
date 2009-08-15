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
		<s:form action="AddStorehouse" namespace="/baseset">
		<table>
			<s:textfield name="storehouseCode" label="仓库编号" value="%{storehouseCode}"></s:textfield>
			<s:textfield name="storehouseName" label="仓库名" ></s:textfield>
			<s:textfield name="storehouseAddress" label="所在地"></s:textfield>
			<s:textfield name="storehouseDefaultCargo" label="默认货位"></s:textfield>
			<s:textfield id="personName" name="personName" label="负责人" onclick="showEmployee()"></s:textfield>
			<s:hidden id="employeeCode" name="employeeCode"></s:hidden>
		<tr><td align="center"><s:submit value="确认"></s:submit></td></tr>
		</table>
		</s:form>
    </body>
</html>