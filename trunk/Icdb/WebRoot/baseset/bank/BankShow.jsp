<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<% String base=request.getContextPath(); %>
<html>
    <head>
        <title>银行信息</title>
    </head>
    <body>
    <s:form action="SelectBankDef" namespace="/baseset">
    <s:textfield label="内容" name="bank.s_value" size="20"></s:textfield>
    <s:hidden name="bank.bankName"></s:hidden>
    <s:submit value="查询"></s:submit>
    </s:form>
    <table border="1">
    <s:if test="lhp.size>0">
    	<tr><th>银行编码</th><th>银行名称</th><th>操作</th></tr>
    </s:if>
    <s:else>
    	未找到符合的信息!
    </s:else>
       <s:iterator value="lhp" status="stat">
       	<tr>
       	<td><s:property value="bankCode"></s:property></td>
        <td><s:property value="bankName"></s:property></td>
        <td><s:url id="updateUrl" action="GetOneBank">
			<s:param name="bank.bankCode" value="bankCode"></s:param>      
        	</s:url> 
        	<s:url id="deleteUrl" action="DeleteBank">
        	<s:param name="bank.bankCode" value="bankCode"></s:param>
        	</s:url>
        	<s:a href="%{updateUrl}">修改</s:a>|
        	<s:a href="%{deleteUrl}">删除</s:a>
        </td>
        
        </tr>
       </s:iterator>
     </table>
  	<a href="<%=base%>/baseset/bank/BankAdd.jsp" >添加</a>
    </body>
</html>