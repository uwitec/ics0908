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
    <s:form action="SelectPersonDef" namespace="/baseset">
	    <s:textfield name="res.s_value"></s:textfield>
	    <s:hidden name="person.personCode"></s:hidden>
	    <s:submit value="查询"></s:submit>
    </s:form>
    </td></tr>
    </table>
    <s:if test="lhp.size>0">
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
			<s:param name="person.personCode" value="personCode"></s:param>       
        	</s:url> 
        	<s:a href="%{updateUrl}">修改</s:a>
        </td>
        </tr>
       </s:iterator>
       <tr><td colspan="6">
      <s:push value="person">
      <s:form theme="simple">
      <s:url id="showUrl" action="ShowPerson">
      	<s:param name="person.startSize" value="person.startSize"></s:param>
      </s:url>
       <s:a href="%{showUrl}">首页</s:a>
       <s:a href="%{showUrl}">上一页</s:a>
       <s:a href="%{showUrl}">下一页</s:a>
       <s:a href="%{showUrl}">末页</s:a>
       <s:textfield size="3" name="person.startSize"></s:textfield>
       <font>页数:<s:property value="person.startSize"/>/<s:property value="person.countSize"/>页</font>
      </s:form>
       </s:push> 
       </td></tr>
     </table>
     	</s:if>
	<s:else>
		未找到相关信息！
	</s:else>
     <s:a href="GoAddPerson.action">添加</s:a>
    </body>
</html>