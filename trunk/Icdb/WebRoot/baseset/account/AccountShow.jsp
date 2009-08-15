<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
    <head>
        <title>帐号信息</title>
    </head>
    <body>
    <table border="1">
    	<tr>
    	
    	<th>帐号</th>
		<th>帐户名</th>
		<th>帐号类型</th>
		<th>所属人</th>
		<th>所属银行</th>
		<th>操作</th>
		</tr>
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
			<s:param name="accountCode" value="accountCode"></s:param>       
        	</s:url> 
        	<s:a href="%{updateUrl}">修改</s:a>
        </td>
        </tr>
       </s:iterator>
     </table>
     <s:a href="GoAddAccount.action">添加</s:a>
    </body>
</html>