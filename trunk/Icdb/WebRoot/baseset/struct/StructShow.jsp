<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html>
    <head>
        <title>机构信息</title>
    </head>
    <body>
<% 
String base=request.getContextPath();
%>  
    <script type="text/javascript" src="<%=base%>/javascript/innerText.js"></script>
    <s:form action="ShowStruct">
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
       <tr><td colspan="5">
       <s:form action="ShowStruct" namespace="/baseset" theme="simple" name="pageform">
       <s:push value="struct">
       <s:hidden name="res.s_value" value="%{res.s_value}"></s:hidden>
       <s:hidden id="countsize" name="struct.countSize" value="%{struct.countSize}"></s:hidden>
        <input size="10" type="button" onclick="pageSet(0)" value="首页"/>
       <s:if test="struct.startSize-1<1">
       		<font color="gray">上一页</font>
       </s:if>
       <s:else>
      	   <input size="10" type="button" onclick="pageSet(-1)" value="上一页"/>
       </s:else>
       <s:if test="struct.startSize+1>struct.countSize">
       		<font color="gray">下一页</font>
       </s:if>
       <s:else>
      	 	<input size="10" type="button" onclick="pageSet(1)" value="下一页"/>
       </s:else>
       		<input size="10" type="button" onclick="pageSet(2)" value="末页"/>
        第<s:textfield id="size" size="2" name="struct.startSize"></s:textfield>页
       <font><s:property value="struct.startSize"/>/<s:property value="struct.countSize"/>页数</font>
       </s:push> 
       </s:form>
       </td></tr>
     </table>
     <s:a href="GoAddStruct.action">添加</s:a>
    </body>
</html>