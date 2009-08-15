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
    <table border="1"> 
	  <tr>
	  <td>
	  <s:textfield name="personCode" value="%{personCode}" label="人员编号"></s:textfield>
	  </td>
	  </tr>
	  <tr>
	  	<td><s:textfield name="personName" value="%{personName}" label="名字"></s:textfield></td>
	  </tr>
	  <tr>
	  <td>
	  <s:textfield name="personPhone" value="%{personPhone}" label="电话"></s:textfield>
	  </td>
	  </tr>
	  <tr>
	  <td>
	  <s:textfield name="personEmail" value="%{personEmail}" label="电邮"></s:textfield>
	  </td>
	  </tr>
	  <tr>
	  <td>
	 	<s:select list="{'男','女'}"  name="personSex" label="性别"></s:select>
	  </td>
	  </tr>
	  <tr>
	  <td>
	  <s:textfield name="personPhoto" value="%{personPhoto}" label="照片"></s:textfield>
	  </tr>
	  <tr><td colspan="2">
		<s:submit value="确认修改"></s:submit>
		</td></tr>
     </table>
     </s:form>
     </s:push>
    </body>
</html>