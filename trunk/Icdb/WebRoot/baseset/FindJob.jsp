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
    <s:form action="FindJob" namespace="/baseset">
    <s:textfield name="job.s_value" label="内容"></s:textfield>
    <s:hidden name="job.jobCode"></s:hidden>
    <s:submit value="查询"></s:submit>
    </s:form>
    </td></tr>
    </table>
    <s:if test="lhp!=null">
    <table border="1">
    	<tr>
    	<td>单选</td>
    	<th>岗位编号</th>
    	<th>岗位名称</th>
    	<th>所属部门</th>
		<th>所属机构</th>
		</tr>
       <s:iterator value="lhp" status="stat">
       	<tr>
       	<td align="center"><input type="radio" name="p_radio" value="<%=idtitle%>"/></td>
       	<td id="jobCode<%=idtitle%>"><s:property value="jobCode"></s:property></td>
        <td id="jobName<%=idtitle++%>"><s:property value="jobName"></s:property></td>
        <td><s:property value="departmentName"></s:property></td>
        <td><s:property value="structName"></s:property></td>
        </tr>
       </s:iterator>
       <tr><td>
       <input type="button" onclick="toSetId(new Array('jobCode','jobName'),'p_radio')" value="确认"/>
       </td></tr>
     </table>
     </s:if>
     <s:elseif test="lhp==null">
     	未找到你需要的数据！
     </s:elseif>
    </body>
</html>