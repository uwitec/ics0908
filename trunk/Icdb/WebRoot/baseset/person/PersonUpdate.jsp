<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%String base=request.getContextPath(); %>

<html>
    <head>
        <title>修改人员信息</title>
    </head>
    <body>
    
    <s:push value="person">
      <s:form action="UpdatePerson" namespace="/baseset" method="post" enctype ="multipart/form-data">
	  <s:textfield name="person.personCode" value="%{personCode}" label="人员编号" readonly="true"></s:textfield>
	  <s:textfield name="person.personName" value="%{personName}" label="名字"></s:textfield>
	  <s:textfield name="person.personPhone" value="%{personPhone}" label="电话"></s:textfield>
	  <s:textfield name="person.personEmail" value="%{personEmail}" label="电邮"></s:textfield>
	  <s:radio list="{'男','女'}"  name="person.personSex" label="性别"></s:radio>
	  <tr><td colspan="2"><img src='<%=base%>/upLoadImg/<s:property value ="personPhoto"/>' alt='<s:property value ="personName"/>'/></td></tr>
	  <s:file  name="photoImg" label="照片"></s:file>
	  <s:hidden name="person.personPhoto" value="%{personPhoto}"></s:hidden>
	  <s:submit value="确认修改"></s:submit>
     </s:form>
     </s:push>
    </body>
</html>