<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>

    <head>
        <title>添加人员信息</title>
    </head>
    <body>
		<s:form action="AddPerson" namespace="/baseset">
		<table>
			<s:textfield name="person.personCode" label="人员编码" value="%{person.personCode}"></s:textfield>
			<s:textfield name="person.personName" label="姓名"></s:textfield>
			<s:textfield name="person.personPhone" label="电话"></s:textfield>
			<s:textfield name="person.personEmail" label="电邮"></s:textfield> 
			<s:radio list="{'男','女'}" name="person.personSex" label="性别"></s:radio>
			<s:textfield name="person.personPhoto" label="照片"></s:textfield>   
			<tr><td align="center"><s:submit value="确认"></s:submit></td></tr>
		</table>
		</s:form>
    </body>
</html>