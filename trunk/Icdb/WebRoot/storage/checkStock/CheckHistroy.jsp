<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
    <head>
        <title>物料信息</title>
    </head>
    <base/>
<% 
String base=request.getContextPath();
%>
<script type="text/javascript" src="<%=base%>/javascript/innerText.js"></script>
    <body>
    <s:form theme="simple">
    	<table>
    	<tr><td>
    	<s:textfield name="checkStock.s_value"></s:textfield>
    	<s:submit value="查找"></s:submit>
    	</td></tr>
    	</table>
    </s:form>
    <table border="1">
    	<tr align="center">
    		<td>盘点仓库</td>
    		<td>盘点时间</td>
    		<td>审核人</td>
    		<td>操作员</td>
    		<td>是否通过审核</td>
    		<td>详细信息</td>
    	</tr>
    	<s:iterator value="lhp" status="stat">
    		<tr>
    		<td><s:property value="storehouseName"/></td>
    		<td><s:property value="csDate"/></td>
    		<td><s:property value="csCheckPerson"/></td>
    		<td><s:property value="personName"/></td>
    		<td>
    		<s:iterator value="list_state" status="inner">
    			<s:if test="key==csApproveState">
    				<s:property value="value"/>
    			</s:if>
    		</s:iterator>
    		</td>
    		<td>
	    		<s:url id="findUrl" action="FindCheck">
	    			<s:param name="checkStock.csCode" value="csCode"></s:param>
	    		</s:url>
    			<s:a href="%{findUrl}">查看</s:a>
    		</td>
    		</tr>
    	</s:iterator>
    	<tr><td colspan="5">
    	<s:form action="ShowHistroy" namespace="/storage" theme="simple" name="pageform">
       <s:push value="checkStock">
       <s:hidden name="checkStock.s_value" value="%{checkStock.s_value}"></s:hidden>
       <s:hidden id="countsize" name="checkStock.countSize" value="%{checkStock.countSize}"></s:hidden>
        <input size="10" type="button" onclick="pageSet(0)" value="首页"/>
       <s:if test="checkStock.startSize-1<1">
       		<font color="gray">上一页</font>
       </s:if>
       <s:else>
      	   <input size="10" type="button" onclick="pageSet(-1)" value="上一页"/>
       </s:else>
       <s:if test="checkStock.startSize+1>checkStock.countSize">
       		<font color="gray">下一页</font>
       </s:if>
       <s:else>
      	 	<input size="10" type="button" onclick="pageSet(1)" value="下一页"/>
       </s:else>
       		<input size="10" type="button" onclick="pageSet(2)" value="末页"/>
        第<s:textfield id="size" size="2" name="checkStock.startSize"></s:textfield>页
       <font><s:property value="checkStock.startSize"/>/<s:property value="checkStock.countSize"/>页数</font>
       </s:push> 
       </s:form>
    	</td></tr>
    </table>
    </body>
</html>