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
			<s:textfield name="employeeCode" label="人员编码" value="%{employeeCode}"></s:textfield>
			<s:textfield id="jobName" name="jobName" label="岗位" value="%{jobName}" onclick="showJob()"></s:textfield>
			<s:hidden id="jobCode" name="jobCode" value="%{jobCode}"></s:hidden>
			<s:textfield id="departmentName" name="departmentName" value="%{departmentName}" label="部门名称"></s:textfield>
			<s:hidden id="departmentCode" name="departmentCode" value="%{departmentCode}"></s:hidden>
			<s:textfield id="structName" id="structName" name="structName" label="所属公司"></s:textfield>
			<s:hidden id="structCode" name="structCode"></s:hidden>
		</s:push>
		</table>
		</td>
		<td>
		<table>
		<s:push value="person">
			<s:textfield name="personCode" label="人员编码" value="%{personCode}"></s:textfield>
			<s:textfield name="personName" label="姓名" value="%{personName}"></s:textfield>
			<s:textfield name="personPhone" label="电话" value="%{personPhone}"></s:textfield>
			<s:textfield name="personEmail" label="电邮" value="%{personEmail}"></s:textfield> 
			<s:select list="{'男','女'}" name="personSex" label="性别"></s:select>
			<s:textfield name="personPhoto" label="照片" value="%{personPhoto}"></s:textfield>   
		</s:push>
		</table>
		</td>
		</tr>
		<tr><td align="center" colspan="2"><s:submit value="确认"></s:submit></td></tr>
		</table>
		</s:form>
    </body>
</html>