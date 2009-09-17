<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<% String base=request.getContextPath(); %>
<html>
    <head>
        <title>添加人员信息</title>
    </head>
    <script type="text/javascript" src="<%=base%>/javascript/innerText.js"></script>
    <body>
		<s:form action="AddPerson" namespace="/baseset" method="post" enctype ="multipart/form-data">
		<table>
			<s:textfield name="person.personCode" label="人员编码" value="%{person.personCode}"></s:textfield>
			<s:textfield name="person.personName" label="姓名"></s:textfield>
			<s:textfield name="person.personPhone" label="电话"></s:textfield>
			<s:textfield name="person.personEmail" label="电邮"></s:textfield> 
			<s:radio list="{'男','女'}" name="person.personSex" label="性别"></s:radio>
			<s:file  name="photoImg" label="照片" ></s:file>
			<tr><td align="center"><s:submit value="确认"></s:submit></td></tr>
			<tr><td><input type="button" onclick="page_close()" value="关闭"/></td></tr>
		</table>
		</s:form>
    </body>
</html>