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
    	</tr>
    </table>
    </s:form>
    </body>
</html>