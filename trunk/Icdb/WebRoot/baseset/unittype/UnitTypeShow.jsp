<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<% String base=request.getContextPath(); %>
<html>
    <head>
        <title>类型信息</title>
    </head>
    <body>
    <table border="1">
    	<tr><th>类型编码</th><th>类型名称</th><th>操作</th></tr>
       <s:iterator value="lhp" status="stat">
       	<tr>
       	<td><s:property value="unitTypeCode"></s:property></td>
        <td><s:property value="unitTypeName"></s:property></td>
        <td><s:url id="updateUrl" action="GetOneUnitType">
			<s:param name="unitTypeCode" value="unitTypeCode"></s:param>
        	</s:url> 
        	<s:a href="%{updateUrl}">修改</s:a>
        </td>
        </tr>
       </s:iterator>
     </table>
  	<a href="<%=base%>/baseset/unittype/UnitTypeAdd.jsp" >添加</a>
    </body>
</html>