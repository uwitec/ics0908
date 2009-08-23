<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
    <head>
        <title>银行信息</title>
    </head>
<% 
int idtitle=1;
String base=request.getContextPath();
%>
<script type="text/javascript" src="<%=base%>/javascript/innerText.js"></script>


    <body>
    <table>
    <tr><td>
    <s:form action="FindAccount" namespace="/baseset">
    <s:textfield name="res.s_value" label="内容"></s:textfield>
    <s:hidden name="account.accountNumber"></s:hidden>
    <s:submit value="查询"></s:submit>
    </s:form>
    </td></tr>
    </table>
    <s:if test="lhp!=null">
    <table border="1">
    	<tr>
    	<th>选择</th>
    	<th>帐号</th>
		<th>帐户名</th>
		<th>帐号类型</th>
		<th>所属人</th>
		<th>所属银行</th>
		</tr>
       <s:iterator value="lhp" status="stat">
       	<tr>
       	<td align="center"><input type="radio" name="p_radio" value="<%=idtitle%>"/></td>
       	<td id="accountCode<%=idtitle%>"><s:property value="accountCode"></s:property></td>
        <td id="accountNumber<%=idtitle%>"><s:property value="accountNumber"></s:property></td>
        <td><s:property value="accountName"></s:property></td>
         <input id="personCode<%=idtitle%>" type="hidden" value='<s:property value="personCode"/>'/>     	
         <td id="personName<%=idtitle%>"><s:property value="personName"></s:property>
         </td>
        <input id="bankCode<%=idtitle%>" type="hidden" value='<s:property value="bankCode"/>'/>	
        <td id="bankName<%=idtitle++%>"><s:property value="bankName"></s:property>
        </td>
        </tr>
       </s:iterator>
       <tr><td colspan="6"><input type="button" onclick="toSetId(new Array('accountCode','accountNumber','personName','personCode','bankCode','bankName'),'p_radio')" value="确认"/></td></tr>
     </table>
     </s:if>
     <s:elseif test="lhp==null">
     	未找到你需要的数据！
     </s:elseif>
    </body>
</html>