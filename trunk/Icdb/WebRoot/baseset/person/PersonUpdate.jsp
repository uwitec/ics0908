<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">


<html>
    <head>
        <title>修改人员信息</title>
    </head>
    <body>
    <s:push value="person">
      <s:form action="UpdatePerson" namespace="/baseset">
	  <s:textfield name="person.personCode" value="%{personCode}" label="人员编号" readonly="true"></s:textfield>
	  <s:textfield name="person.personName" value="%{personName}" label="名字"></s:textfield>
	  <s:textfield name="person.personPhone" value="%{personPhone}" label="电话"></s:textfield>
	  <s:textfield name="person.personEmail" value="%{personEmail}" label="电邮"></s:textfield>
	  <s:radio list="{'男','女'}"  name="person.personSex" label="性别"></s:radio>
	  <s:textfield name="person.personPhoto" value="%{personPhoto}" label="照片"></s:textfield>
	 <s:submit value="确认修改"></s:submit>
     </s:form>
     </s:push>
    </body>
</html>