<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html>
    <head>
        <title>部门信息</title>
    </head>
<% 
String base=request.getContextPath();
%>  
    <script type="text/javascript" src="<%=base%>/javascript/innerText.js"></script>
    <body>
    <s:form action="ShowDepartment">
    	<s:textfield name="res.s_value" label="内容"></s:textfield>
    	<s:hidden name="department.departmentCode"></s:hidden>
    	<s:submit value="查询"></s:submit>
    </s:form>
    <table border="1">
    	<s:if test="lhp.size>0">
    	<tr><th>部门编号</th><th>部门名称</th><th>所属机构</th><th>操作</th></tr>
    	</s:if>
    	<s:else>
    		未找到符合的信息！
    	</s:else>
       <s:iterator value="lhp" status="stat">
       	<tr>
       	<td><s:property value="departmentCode"></s:property></td>
        <td><s:property value="departmentName"></s:property></td>
        <td><s:property value="structName"></s:property></td>
        <td><s:url id="updateUrl" action="GetOneDepartment">
			<s:param name="department.departmentCode" value="departmentCode"></s:param>      
        	</s:url> 
        	<s:url id="deleteUrl" action="DeleteDepartment">
			<s:param name="department.departmentCode" value="departmentCode"></s:param>      
        	</s:url>
        	<s:a href="%{updateUrl}">修改</s:a>
        </td>
        </tr>
       </s:iterator>
       <tr><td colspan="4">
       <s:form action="ShowDepartment" namespace="/baseset" theme="simple" name="pageform">
       <s:push value="department">
       <s:hidden name="res.s_value" value="%{res.s_value}"></s:hidden>
       <s:hidden id="countsize" name="department.countSize" value="%{department.countSize}"></s:hidden>
        <input size="10" type="button" onclick="pageSet(0)" value="首页"/>
       <s:if test="department.startSize-1<1">
       		<font color="gray">上一页</font>
       </s:if>
       <s:else>
      	   <input size="10" type="button" onclick="pageSet(-1)" value="上一页"/>
       </s:else>
       <s:if test="department.startSize+1>department.countSize">
       		<font color="gray">下一页</font>
       </s:if>
       <s:else>
      	 	<input size="10" type="button" onclick="pageSet(1)" value="下一页"/>
       </s:else>
       		<input size="10" type="button" onclick="pageSet(2)" value="末页"/>
        第<s:textfield id="size" size="2" name="department.startSize"></s:textfield>页
       <font><s:property value="department.startSize"/>/<s:property value="department.countSize"/>页数</font>
       </s:push> 
       </s:form>
       </td></tr>
     </table>
  	<s:a href="GoAddDepartment.action">添加</s:a>
    </body>
</html>