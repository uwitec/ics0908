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
		<s:form action="AddEmployee" namespace="/baseset">
		<table>
		<tr><td>
		<table>
			<s:textfield name="employeeCode" label="人员编码" value="%{personCode}"></s:textfield>
			<s:textfield id="jobName" name="jobName" label="岗位" onclick="showJob()"></s:textfield>
			<s:hidden id="jobCode" name="jobCode"></s:hidden>
			<s:textfield id="departmentName" name="departmentName" label="部门名称"></s:textfield>
			<s:hidden id="departmentCode" name="departmentCode"></s:hidden>
			<s:textfield id="structName" name="structName" label="所属公司"></s:textfield>
			<s:hidden id="structCode" name="structCode"></s:hidden>
		</table>
		</td>
		<td>
		<table>
			<s:textfield name="personCode" label="人员编码" value="%{personCode}"></s:textfield>
			<s:textfield name="personName" label="姓名"></s:textfield>
			<s:textfield name="personPhone" label="电话"></s:textfield>
			<s:textfield name="personEmail" label="电邮"></s:textfield> 
			<s:select list="{'男','女'}" name="personSex" label="性别"></s:select>
			<s:textfield name="personPhoto" label="照片"></s:textfield>   
		</table>
		</td>
		</tr>
		<tr><td align="center" colspan="2"><s:submit value="确认"></s:submit></td></tr>
		</table>
		</s:form>
    </body>
</html>