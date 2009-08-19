<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html>
    <head>
        <title>岗位信息</title>
    </head>
    <body>
    <s:form action="SelectJobDef">
    	<s:textfield name="res.s_value" label="内容"></s:textfield>
    	<s:hidden name="job.jobCode"></s:hidden>
    	<s:submit value="查询"></s:submit>
    </s:form>
    <table border="1">
    	<s:if test="lhp.size>0">
    	<tr><th>岗位编码</th><th>岗位名称</th><th>所属部门</th><th>操作</th></tr>
    	</s:if>
    	<s:else>
    		未找到合适的数据信息！
    	</s:else>
       <s:iterator value="lhp" status="stat">
       	<tr>
       	<td><s:property value="jobCode"></s:property></td>
        <td><s:property value="jobName"></s:property></td>
        <td><s:property value="departmentName"></s:property></td>
        <td><s:url id="updateUrl" action="GetOneJob">
			<s:param name="job.jobCode" value="jobCode"></s:param>      
        	</s:url> 
        	<s:a href="%{updateUrl}">修改</s:a>
        </td>
        </tr>
       </s:iterator>
     </table>
  	<s:a href="GoAddJob.action">添加</s:a>
    </body>
</html>