<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html>
    <head>
        <title>计量单位信息</title>
    </head>
    <body>
    <s:form action="SelectUnitDef">
    	<s:textfield name="unit.s_value" label="内容"></s:textfield>
    	<s:hidden name="unit.unitCode"></s:hidden>
    	<s:submit value="查询"></s:submit>
    </s:form>
    <table border="1">
    <s:if test="lhp.size>0">
    	<tr><th>计量单位编码</th><th>单位名称</th><th>所属类型</th><th>操作</th></tr>
    </s:if>
    <s:else>
    	未找到相应信息！
    </s:else>
       <s:iterator value="lhp" status="stat">
       	<tr>
       	<td><s:property value="unitCode"></s:property></td>
        <td><s:property value="unitName"></s:property></td>
        <td><s:property value="unitTypeName"></s:property></td>
        <td><s:url id="updateUrl" action="GetOneUnit">
			<s:param name="unit.unitCode" value="unitCode"></s:param>      
        	</s:url> 
        	<s:a href="%{updateUrl}">修改</s:a>
        </td>
        </tr>
       </s:iterator>
     </table>
  	<s:a href="GoAddUnit.action">添加</s:a>
    </body>
</html>