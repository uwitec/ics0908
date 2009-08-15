<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
    <head>
        <title>人员信息</title>
    </head>
    <body>
    <table>
    <tr><td>
    <s:form action="" namespace="/baseset">
    <s:textfield name="personName"></s:textfield>
    <s:submit value="查询"></s:submit>
    </s:form>
    </td></tr>
    </table>
    <table border="1">
    	<tr>
    	<th>人员编号</th>
    	<th>姓名</th>
		<th>电话</th>
		<th>电邮</th>
		<th>性别</th>
		<th>操作</th>
		</tr>
       <s:iterator value="lhp" status="stat">
       	<tr>
       	<td><s:property value="personCode"></s:property></td>
        <td><s:property value="personName"></s:property></td>
        <td><s:property value="personPhone"></s:property></td>
        <td><s:property value="personEmail"></s:property></td>
        <td><s:property value="personSex"></s:property></td>
        <td><s:url id="updateUrl" action="GetOnePerson">
			<s:param name="personCode" value="personCode"></s:param>       
        	</s:url> 
        	<s:a href="%{updateUrl}">修改</s:a>
        </td>
        </tr>
       </s:iterator>
     </table>
     <s:a href="GoAddPerson.action">添加</s:a>
    </body>
</html>