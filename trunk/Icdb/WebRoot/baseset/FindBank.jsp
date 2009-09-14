<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
    <head>
        <title>y银行信息</title>
    </head>
<% 
int idtitle=1;
String base=request.getContextPath();
%>
<script type="text/javascript" src="<%=base%>/javascript/innerText.js"></script>


    <body>
    <table>
    <tr><td>
    <s:form action="FindBank" namespace="/baseset">
    <s:textfield name="bank.s_value" label="内容"></s:textfield>
    <s:hidden name="bank.bankCode"></s:hidden>
    <s:submit value="查询"></s:submit>
    </s:form>
    </td></tr>
    </table>
    <s:if test="lhp!=null">
    <table border="1">
    	<tr>
    	<th>单选</th>
    	<th>银行编号</th>
    	<th>银行名称</th>
		</tr>
       <s:iterator value="lhp" status="stat">
       	<tr>
       	<td align="center"><input type="radio" name="p_radio" value="<%=idtitle%>"/></td>
       	<td id="bankCode<%=idtitle%>"><s:property value="bankCode"></s:property></td>
        <td id="bankName<%=idtitle++%>"><s:property value="bankName"></s:property></td>
        </tr>
       </s:iterator>
       <tr><td>
       <input type="button" onclick="toSetId(new Array('bankCode','bankName'),'p_radio')" value="确认"/>
       </td></tr>
     </table>
     </s:if>
     <s:elseif test="lhp==null">
     	未找到你需要的数据！
     </s:elseif>
    </body>
</html>