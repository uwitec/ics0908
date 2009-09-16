<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>

<% String base=request.getContextPath(); %>
    <head>
        <title>添加新员工</title>
    </head>
    <SCRIPT type="text/javascript">
    function showJob(){
	window.showModalDialog("<%=base%>/baseset/FindJob.jsp","","dialogHeight:400px;dialogWidth:500px");
}
    </SCRIPT>
    <body>
		<s:form action="AddEmployee" namespace="/baseset" method="post" enctype ="multipart/form-data">
		<table>
		<tr><td>
		<table>
			<s:textfield name="employee.employeeCode" label="人员编码" value="%{employee.employeeCode}"></s:textfield>
			<s:textfield id="jobName" name="employee.jobName" label="岗位" onclick="showJob()"></s:textfield>
			<s:hidden id="jobCode" name="employee.jobCode"></s:hidden>
			<s:textfield id="departmentName" name="employee.departmentName" label="部门名称"></s:textfield>
			<s:hidden id="departmentCode" name="employee.departmentCode"></s:hidden>
			<s:textfield id="structName" name="employee.structName" label="所属公司"></s:textfield>
			<s:hidden id="structCode" name="semployee.tructCode"></s:hidden>
		</table>
		</td>
		<td>
		<table>
			<s:textfield name="person.personCode" label="人员编码" value="%{employee.personCode}"></s:textfield>
			<s:textfield name="person.personName" label="姓名"></s:textfield>
			<s:textfield name="person.personPhone" label="电话"></s:textfield>
			<s:textfield name="person.personEmail" label="电邮"></s:textfield> 
			<s:radio list="{'男','女'}" name="person.personSex" label="性别"></s:radio>
			<s:file name="photoImg" label="照片"></s:file> 
		</table>
		</td>
		</tr>
		<tr><td align="center" colspan="2"><s:submit value="确认"></s:submit></td></tr>
		</table>
		</s:form>
    </body>
</html>