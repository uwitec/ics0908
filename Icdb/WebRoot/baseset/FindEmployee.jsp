<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
    <head>
        <title>y银行信息</title>
    </head>
<% 
int idtitle=1;
String base=request.getContextPath();
%>
<script type="text/javascript" src="<%=base%>/javascript/innerText.js"></script>


    <body>
    <table>
    <tr><td>
    <s:form action="FindEmployee" namespace="/baseset">
    <s:textfield name="employee.s_value" label="内容"></s:textfield>
    <s:hidden name="employee.employeeCode"></s:hidden>
    <s:submit value="查询"></s:submit>
    </s:form>
    </td></tr>
    </table>
    <s:if test="lhp!=null">
    <table border="1">
    	<tr>
    	<td>选择</td>
    	<th>员工编号</th>
		<th>员工姓名</th>
		<th>岗位</th>
		<th>所属部门</th>
		</tr>
       <s:iterator value="lhp" status="stat">
       	<tr>
       	<td align="center"><input type="radio" name="p_radio" value="<%=idtitle%>"/></td>
       	<td id="employeeCode<%=idtitle%>"><s:property value="employeeCode"></s:property></td>
        <td id="personName<%=idtitle++%>"><s:property value="personName"></s:property></td>
        <td><s:property value="jobName"></s:property></td>
        <td><s:property value="departmentName"></s:property></td>
        </tr>
       </s:iterator>
       <tr><td colspan="5"><input type="button" onclick="toSetId(new Array('employeeCode','personName'),'p_radio')" value="确认"/></td></tr>
     </table>
     </s:if>
     <s:elseif test="lhp==null">
     	未找到你需要的数据！
     </s:elseif>
    </body>
</html>