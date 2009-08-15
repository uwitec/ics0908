<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
    <head>
        <title>人员信息</title>
    </head>
<% 
int idtitle=1;
String base=request.getContextPath();
%>
<script type="text/javascript" src="<%=base%>/javascript/innerText.js"></script>
    <body>
    <table>
    <tr><td>
    <s:form action="FindPerson" namespace="/baseset">
    <s:textfield name="personName"></s:textfield>
    <s:submit value="查询"></s:submit>
    </s:form>
    </td></tr>
    </table>
    <s:if test="lhp!=null">
    <table border="1">
    	<tr>
    	<th>单选</th>
    	<th>人员编号</th>
    	<th>姓名</th>
		<th>电话</th>
		<th>电邮</th>
		<th>性别</th>
		</tr>
       <s:iterator value="lhp" status="stat">
       	<tr>
       	<td align="center"><input type="radio" name="p_radio" value="<%=idtitle%>"/></td>
       	<td id="personCode<%=idtitle%>"><s:property value="personCode"></s:property></td>
        <td id="personName<%=idtitle++%>"><s:property value="personName"></s:property></td>
        <td><s:property value="personPhone"></s:property></td>
        <td><s:property value="personEmail"></s:property></td>
        <td><s:property value="personSex"></s:property></td>  
        </tr>
       </s:iterator>
       <tr><td>
       <input type="button" onclick="toSetId(new Array('personCode','personName'),'p_radio')" value="确认"/>
       </td></tr>
     </table>
     </s:if>
     <s:elseif test="lhp==null">
     	未找到你需要的数据！
     </s:elseif>
    </body>
</html>