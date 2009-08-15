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
			<s:textfield name="personCode" label="人员编码" value="%{personCode}"></s:textfield>
			<s:textfield name="personName" label="姓名"></s:textfield>
			<s:textfield name="personPhone" label="电话"></s:textfield>
			<s:textfield name="personEmail" label="电邮"></s:textfield> 
			<s:select list="{'男','女'}" name="personSex" label="性别"></s:select>
			<s:textfield name="personPhoto" label="照片"></s:textfield>   
			<tr><td align="center"><s:submit value="确认"></s:submit></td></tr>
		</table>
		</s:form>
    </body>
</html>