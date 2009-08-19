<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
    <head>
        <title>帐号信息</title>
    </head>
    <body>
    <s:form action="SelectAccountDef">
    <s:textfield label="内容" name="res.s_value"></s:textfield>
    <s:hidden name="account.accountCode"></s:hidden>
    <s:submit value="查询"></s:submit>
    </s:form>
    <table border="1">
    <s:if test="lhp.size>0">
    	<tr>
    	<th>帐号</th>
		<th>帐户名</th>
		<th>帐号类型</th>
		<th>所属人</th>
		<th>所属银行</th>
		<th>操作</th>
		</tr>
	</s:if>
	<s:else>
		未找到符合的信息!
	</s:else>
       <s:iterator value="lhp" status="stat">
       	<tr>
       	<td><s:property value="accountCode"></s:property></td>
        <td><s:property value="accountNumber"></s:property></td>
        <td><s:property value="accountName"></s:property></td>
         <td><s:property value="personName"></s:property>
         	<s:hidden value="personCode"></s:hidden>
         </td>
        <td><s:property value="bankName"></s:property>
        	<s:hidden value="bankCode"></s:hidden>
        </td>
        <td><s:url id="updateUrl" action="GetOneAccount">
			<s:param name="account.accountCode" value="accountCode"></s:param>       
        	</s:url> 
        	<s:a href="%{updateUrl}">修改</s:a>
        </td>
        </tr>
       </s:iterator>
     </table>
     <s:a href="GoAddAccount.action">添加</s:a>
    </body>
</html>