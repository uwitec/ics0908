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
    <s:form action="GoAddCheckStock" theme="simple">
    <table>
    	<s:if test="checkStock.message!=null">
    	    	<tr><td colspan="2"><s:property value="checkStock.message"/></td></tr>
    	</s:if>

    	<tr>
    		<td>仓库：
    		<s:select list="lsb" listKey="StorehouseCode" listValue="StorehouseName" name="checkStock.StorehouseCode"></s:select>
    		</td>
    		<td>
    		<input type="submit" value="进行盘点"  <s:property value="checkTime"/>"/>
    		</td>
    		<td><s:a href="ShowHistroy.action">查看历史</s:a></td>
    	</tr>
    </table>
    </s:form>
    <s:if test="lhp.size!=0">
    <table border="1">
    	<tr>
    	<td colspan="5">还有以下工作需要进行完成</td>
    	</tr>
    	<tr align="center">
    		<td>盘点仓库</td>
    		<td>盘点时间</td>
    		<td>审核人</td>
    		<td>操作员</td>
    		<td>是否审核通过</td>
    		<td>编辑</td>
    	</tr>
    	<s:iterator value="lhp">
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
	    		<s:url id="editUrl" action="EditCheckStock">
	    			<s:param name="checkStock.csCode" value="csCode"></s:param>
	    		</s:url>
    			<s:a href="%{editUrl}">编辑</s:a>
    		</td>
    		</tr>
    	</s:iterator>
    </table>
    </s:if>
    </body>
</html>