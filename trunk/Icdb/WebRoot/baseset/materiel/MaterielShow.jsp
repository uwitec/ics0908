<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html>
    <head>
        <title>物料信息</title>
    </head>
    <body>
<% 
String base=request.getContextPath();
%>  
    <script type="text/javascript" src="<%=base%>/javascript/innerText.js"></script>
    <s:form action="ShowMateriel">
    	<s:textfield name="res.s_value" label="内容"></s:textfield>
    	<s:hidden name="materiel.jobCode"></s:hidden>
    	<s:submit value="查询"></s:submit>
    </s:form>
    <table border="1">
    	<s:if test="lhp.size>0">
    	<tr>
    	<th>物品编号</th>
		<th>物品名称</th>
		<th>产地</th>
		<th>单价</th>
		<th>最大库存量</th>
		<th>最小库存量</th>
		<th>规格</th>
		<th>ABC类别</th>
		<th>操作</th>
    	</tr>
    	</s:if>
    	<s:else>
    		未找到合适的数据信息！
    	</s:else>
       <s:iterator value="lhp" status="stat">
       	<tr>
        <td><s:property value="materielCode"></s:property></td>
		<td><s:property value="materielName"></s:property></td>
		<td><s:property value="materielMadeIn"></s:property></td>
		<td><s:property value="materielPrice"></s:property></td>
		<td><s:property value="materielMaxStore"></s:property></td>
		<td><s:property value="materielMinStore"></s:property></td>
		<td><s:property value="materielSize"></s:property></td>
		<td><s:property value="materielABC"></s:property></td>
        <td><s:url id="updateUrl" action="GetOneMateriel">
			<s:param name="materiel.materielCode" value="materielCode"></s:param>      
        	</s:url> 
        	<s:a href="%{updateUrl}">修改</s:a>
        </td>
        </tr>
       </s:iterator>
       <tr><td colspan="9">
       <s:form action="ShowMateriel" namespace="/baseset" theme="simple" name="pageform">
       <s:push value="materiel">
       <s:hidden name="res.s_value" value="%{res.s_value}"></s:hidden>
       <s:hidden id="countsize" name="materiel.countSize" value="%{materiel.countSize}"></s:hidden>
        <input size="10" type="button" onclick="pageSet(0)" value="首页"/>
       <s:if test="materiel.startSize-1<1">
       		<font color="gray">上一页</font>
       </s:if>
       <s:else>
      	   <input size="10" type="button" onclick="pageSet(-1)" value="上一页"/>
       </s:else>
       <s:if test="materiel.startSize+1>materiel.countSize">
       		<font color="gray">下一页</font>
       </s:if>
       <s:else>
      	 	<input size="10" type="button" onclick="pageSet(1)" value="下一页"/>
       </s:else>
       		<input size="10" type="button" onclick="pageSet(2)" value="末页"/>
        第<s:textfield id="size" size="2" name="materiel.startSize"></s:textfield>页
       <font><s:property value="materiel.startSize"/>/<s:property value="materiel.countSize"/>页数</font>
       </s:push> 
       </s:form>
       </td></tr>
     </table>
  	<s:a href="GoAddMateriel.action">添加</s:a>
    </body>
</html>