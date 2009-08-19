<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>

<% String base=request.getContextPath(); %>
    <head>
        <title>修改员工信息</title>
    </head>
    <SCRIPT type="text/javascript">
    function showJob(){
	window.showModalDialog("<%=base%>/baseset/FindJob.jsp","","dialogHeight:400px;dialogWidth:500px");
}
    </SCRIPT>
    <body>
		<s:form action="UpdateEmployee" namespace="/baseset">
		<table>
		<tr><td>
		<table>
		<s:push value="employee">
			<s:textfield name="employee.employeeCode" label="人员编码" value="%{employeeCode}"></s:textfield>
			<s:textfield id="jobName" name="employee.jobName" label="岗位" value="%{jobName}" onclick="showJob()"></s:textfield>
			<s:hidden id="jobCode" name="employee.jobCode" value="%{jobCode}"></s:hidden>
			<s:textfield id="departmentName" name="employee.departmentName" value="%{departmentName}" label="部门名称"></s:textfield>
			<s:hidden id="departmentCode" name="employee.departmentCode" value="%{departmentCode}"></s:hidden>
			<s:textfield id="structName" id="structName" name="employee.structName" label="所属公司"></s:textfield>
			<s:hidden id="structCode" name="employee.structCode"></s:hidden>
		</s:push>
		</table>
		</td>
		<td>
		<table>
		<s:push value="person">
			<s:textfield name="person.personCode" label="人员编码" value="%{personCode}"></s:textfield>
			<s:textfield name="person.personName" label="姓名" value="%{personName}"></s:textfield>
			<s:textfield name="person.personPhone" label="电话" value="%{personPhone}"></s:textfield>
			<s:textfield name="person.personEmail" label="电邮" value="%{personEmail}"></s:textfield> 
			<s:radio list="{'男','女'}" name="person.personSex" label="性别" value="%{personSex}"></s:radio>
			<s:textfield name="person.personPhoto" label="照片" value="%{personPhoto}"></s:textfield>   
		</s:push>
		</table>
		</td>
		</tr>
		<tr><td align="center" colspan="2"><s:submit value="确认"></s:submit></td></tr>
		</table>
		</s:form>
    </body>
</html>