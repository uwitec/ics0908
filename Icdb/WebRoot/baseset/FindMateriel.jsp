<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
    <head>
        <title>物料信息</title>
    </head>
<% 
int idtitle=1;
String base=request.getContextPath();
%>
<script type="text/javascript" src="<%=base%>/javascript/innerText.js"></script>
    <body>
    <table>
    <tr><td>
    <s:form action="FindMateriel">
    	<s:textfield name="res.s_value" label="内容"></s:textfield>
    	<s:hidden name="materiel.jobCode"></s:hidden>
    	<s:submit value="查询"></s:submit>
    </s:form>
    </td></tr>
    </table>
    <s:if test="lhp!=null">
    <table border="1">
    	<tr>
    	<th>物料编号</th>
    	<th>物料名称</th>
    	<th>物料产地</th>
		<th>物料价格</th>
		<th>物料最大库存</th>
		<th>物料最小库存</th>
		</tr>
       <s:iterator value="lhp" status="stat">
       	<tr>
       	<td align="center"><input type="radio" name="p_radio" value="<%=idtitle%>"/></td>
 		<td id="materielCode<%=idtitle%>"><s:property value="materielCode"></s:property></td>
		<td id="materielName<%=idtitle%>"><s:property value="materielName"></s:property></td>
		<td><s:property value="materielMadeIn"></s:property></td>
		<td id="stockPrice<%=idtitle++%>"><s:property value="materielPrice"></s:property></td>
		<td><s:property value="materielMaxStore"></s:property></td>
		<td><s:property value="materielMinStore"></s:property></td>
        </tr>
       </s:iterator>
       <tr><td>
       <input type="button" onclick="toSetId(new Array('materielCode','materielName','stockPrice'),'p_radio')" value="确认"/>
       </td></tr>
     </table>
     </s:if>
     <s:elseif test="lhp==null">
     	未找到你需要的数据！
     </s:elseif>
    </body>
</html>