<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
    <head>
        <title>帐号信息</title>
    </head>
    <body>
<% 
	String base=request.getContextPath();
%>  
    <script type="text/javascript" src="<%=base%>/javascript/innerText.js"></script>
    <s:form action="ShowAccount">
    <s:textfield label="内容" name="account.s_value"></s:textfield>
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
       <tr><td colspan="6">
     
       <s:form action="ShowAccount" namespace="/baseset" theme="simple" name="pageform">
       <s:push value="account">
       <s:hidden name="account.s_value" value="%{account.s_value}"></s:hidden>
       <s:hidden id="countsize" name="account.countSize" value="%{account.countSize}"></s:hidden>
        <input size="10" type="button" onclick="pageSet(0)" value="首页"/>
       <s:if test="account.startSize-1<1">
       		<font color="gray">上一页</font>
       </s:if>
       <s:else>
      	   <input size="10" type="button" onclick="pageSet(-1)" value="上一页"/>
       </s:else>
       <s:if test="account.startSize+1>account.countSize">
       		<font color="gray">下一页</font>
       </s:if>
       <s:else>
      	 	<input size="10" type="button" onclick="pageSet(1)" value="下一页"/>
       </s:else>
       		<input size="10" type="button" onclick="pageSet(2)" value="末页"/>
        第<s:textfield id="size" size="2" name="account.startSize"></s:textfield>页
       <font><s:property value="account.startSize"/>/<s:property value="account.countSize"/>页数</font>
       </s:push> 
       </s:form>
       </td></tr>
     </table>
     <s:a href="GoAddAccount.action">添加</s:a>
    </body>
</html>