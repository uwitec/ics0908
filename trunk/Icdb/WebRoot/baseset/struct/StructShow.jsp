<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html>
    <head>
        <title>机构信息</title>
    </head>
    <body>
    <s:form action="SelectStructDef">
    	<s:textfield name="res.s_value" label="内容"></s:textfield>
    	<s:hidden name="struct.structCode"></s:hidden>
    	<s:submit value="查询"></s:submit>
    </s:form>
    <table border="1">
    	<s:if test="lhp.size>0">
    	<tr><th>机构编码</th><th>机构名称</th><th>操作</th></tr>
    	</s:if>
    	<s:else>
    	未找到相应信息！
    	</s:else>
       <s:iterator value="lhp" status="stat">
       	<tr>
       	<td><s:property value="structCode"></s:property></td>
        <td><s:property value="structName"></s:property></td>
        <td><s:url id="updateUrl" action="GetOneStruct">
			<s:param name="struct.structCode" value="structCode"></s:param>     
        	</s:url> 
        	<s:a href="%{updateUrl}">修改</s:a>
        </td>
        </tr>
       </s:iterator>
     </table>
     <s:a href="GoAddStruct.action">添加</s:a>
    </body>
</html>