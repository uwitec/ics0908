<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
    <head>
        <title>人员信息</title>
    </head>
 <% 
String base=request.getContextPath();
%>  

    <script type="text/javascript" src="<%=base%>/javascript/innerText.js"></script>
    <SCRIPT type="text/javascript">
    function AddPerson(){
		window.showModalDialog("GoAddPerson.action","","dialogHeight:400px;dialogWidth:500px");
		location.reload();
	}
	function UpdatePerson(value_str){
		var url="GetOnePerson.action?person.personCode="+value_str;
		window.showModalDialog(url,"","dialogHeight:400px;dialogWidth:500px");
		location.reload();
	}
    </SCRIPT>
    <body>
    <table>
    <tr><td>
    <s:form action="ShowPerson" namespace="/baseset" theme="simple">
	    <s:textfield name="person.s_value"></s:textfield>
	    <s:hidden name="person.personCode"></s:hidden>
	    <s:submit value="查询"></s:submit>
    </s:form>
    </td></tr>
    </table>
    <s:if test="lhp.size>0">
    <table border="1">
    	<tr>
    	<th>人员编号</th>
    	<th>姓名</th>
		<th>电话</th>
		<th>电邮</th>
		<th>性别</th>
		<th>操作</th>
		</tr>
       <s:iterator value="lhp" status="stat">
       	<tr>
       	<td><s:property value="personCode"></s:property></td>
        <td><s:property value="personName"></s:property></td>
        <td><s:property value="personPhone"></s:property></td>
        <td><s:property value="personEmail"></s:property></td>
        <td><s:property value="personSex"></s:property></td>
        <td>
        	<a href="#" onclick="UpdatePerson('<s:property value='personCode'/>')">修改</a>
        </td>
        </tr>
       </s:iterator>
       <tr><td colspan="6">
     
       <s:form action="ShowPerson" namespace="/baseset" theme="simple" name="pageform">
       <s:push value="person">
       <s:hidden name="res.s_value" value="%{res.s_value}"></s:hidden>
       <s:hidden id="countsize" name="person.countSize" value="%{person.countSize}"></s:hidden>
        <input size="10" type="button" onclick="pageSet(0)" value="首页"/>
       <s:if test="person.startSize-1<1">
       		<font color="gray">上一页</font>
       </s:if>
       <s:else>
      	   <input size="10" type="button" onclick="pageSet(-1)" value="上一页"/>
       </s:else>
       <s:if test="person.startSize+1>person.countSize">
       		<font color="gray">下一页</font>
       </s:if>
       <s:else>
      	 	<input size="10" type="button" onclick="pageSet(1)" value="下一页"/>
       </s:else>
       		<input size="10" type="button" onclick="pageSet(2)" value="末页"/>
        第<s:textfield id="size" size="2" name="person.startSize"></s:textfield>页
       <font><s:property value="person.startSize"/>/<s:property value="person.countSize"/>页数</font>
       </s:push> 
       </s:form>
       </td></tr>
     </table>
     	</s:if>
	<s:else>
		未找到相关信息！
	</s:else>
     <a href="#" onclick="AddPerson()">添加</a>
    </body>
</html>