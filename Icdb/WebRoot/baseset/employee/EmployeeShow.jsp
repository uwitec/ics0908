<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
    <head>
        <title>员工信息</title>
    </head>
     <% 
String base=request.getContextPath();
%>  

    <script type="text/javascript" src="<%=base%>/javascript/innerText.js"></script>
    <body>
	<s:form action="ShowEmployee">
		<s:textfield name="employee.s_value" label="内容"></s:textfield>
		<s:hidden name="employee.employeeCode"></s:hidden>
		<s:submit value="查找"></s:submit>
	</s:form>
    <table border="1">
    <s:if test="lhp.size>0">
    	<tr>
    	<th>员工编号</th>
    	<th>员工姓名</th>
		<th>所属岗位</th>
		<th>所在部门</th>
		<th>操作</th>
		</tr>
	</s:if>
	<s:else>
		未找到相关数据
	</s:else>
       <s:iterator value="lhp" status="stat">
       	<tr>
       	<td><s:property value="employeeCode"></s:property></td>
        <td><s:property value="personName"></s:property></td>
        <td><s:property value="jobName"></s:property></td>
        <td><s:property value="departmentName"></s:property></td>
        <td><s:url id="updateUrl" action="GetOneEmployee">
			<s:param name="employee.employeeCode" value="employeeCode"></s:param>       
        	</s:url> 
        	<s:a href="%{updateUrl}">修改</s:a>
        </td>
        </tr>
       </s:iterator>
       <tr><td colspan="5">
       <s:form action="ShowEmployee" namespace="/baseset" theme="simple" name="pageform">
       <s:push value="employee">
       <s:hidden name="employee.s_value" value="%{employee.s_value}"></s:hidden>
       <s:hidden id="countsize" name="employee.countSize" value="%{employee.countSize}"></s:hidden>
        <input size="10" type="button" onclick="pageSet(0)" value="首页"/>
       <s:if test="employee.startSize-1<1">
       		<font color="gray">上一页</font>
       </s:if>
       <s:else>
      	   <input size="10" type="button" onclick="pageSet(-1)" value="上一页"/>
       </s:else>
       <s:if test="employee.startSize+1>employee.countSize">
       		<font color="gray">下一页</font>
       </s:if>
       <s:else>
      	 	<input size="10" type="button" onclick="pageSet(1)" value="下一页"/>
       </s:else>
       		<input size="10" type="button" onclick="pageSet(2)" value="末页"/>
        第<s:textfield id="size" size="2" name="employee.startSize"></s:textfield>页
       <font><s:property value="employee.startSize"/>/<s:property value="employee.countSize"/>页数</font>
       </s:push> 
       </s:form>
       </td></tr>
     </table>
     <s:a href="GoAddEmployee.action">添加</s:a>
    </body>
</html>