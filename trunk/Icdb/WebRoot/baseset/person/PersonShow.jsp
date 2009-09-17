<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<% String base=request.getContextPath(); %>
<html>
    <head>
        <title>人员信息</title>
		<link href="<%=base%>/css/sub.css" type="text/css" rel="stylesheet">
	</head>
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
<tr>
	<td colspan="3" width="1002"><jsp:include flush="true" page="/main/head.jsp"></jsp:include></td>
</tr>
<tr>
	<td colspan="3"><jsp:include flush="true" page="/main/menu.jsp"></jsp:include></td>
</tr>
<tr>
	<td><jsp:include flush="true" page="/main/left.jsp"></jsp:include></td>
	<td>
   <div class="orgstructure_con_tit">
		<div class="orgstructure_con_tit_text">人员信息</div>
	</div>
	
	<div class="orgstructure_table_operate">
		<s:form action="ShowPerson" namespace="/baseset" theme="simple" >
		<a href="#" onclick="AddPerson()" class="a_top"><img src="<%=base%>/images/img06.gif" border="0" class="a_top">添加</a>
		<input type="text" name="person.s_value" value="<s:property value="person.s_value"/>" class="search_border" size="20"/>
		<input type="image" onclick="submit()" src="<%=base%>/images/img09.gif"/>
		</s:form>
	</div> 
	<div class="orgstructure_table_tit">
	<div class="orgstructure_con">
<div class="orgstructure_table_tit">
</div>
	    <table class="orgstructure_table" cellspacing="1" cellpadding="0">
	    <s:if test="lhp.size>0">
	    	<tr class="orgstructure_table_th">
	    		<td class="orgstructure_table_tit_m">人员编号</td>
	    		<td class="orgstructure_table_tit_m">姓名</td>
	    		<td class="orgstructure_table_tit_m">电话</td>
	    		<td class="orgstructure_table_tit_m">性别</td>
	    		<td class="orgstructure_table_tit_m">操作</td>
	    	</tr>
	    </s:if>
	    <s:else>
	    	<tr>
	    	<td class="orgstructure_table_td_odd_r" colspan="3">
	    		未找到符合的信息!
	    	</td>
	    	</tr>
	    </s:else>
    	<tr>
		</tr>
       <s:iterator value="lhp" status="stat">
	       	<s:if test="#stat.even">
	       		<tr class="orgstructure_table_td_odd">
	       	</s:if>
	       	<s:else>
	       		<tr class="orgstructure_table_td_even">
	       	</s:else>
       	<td><s:property value="personCode"></s:property></td>
        <td><s:property value="personName"></s:property></td>
        <td><s:property value="personPhone"></s:property></td>
        <td><s:property value="personSex"></s:property></td>
        <td>
        	<a href="#" onclick="UpdatePerson('<s:property value='personCode'/>')"><img src="<%=base%>/images/img03.gif" border="0"></a>
        </td>
        </tr>
       </s:iterator>
	   </table>
  	<div class="pages">
  	<s:form action="ShowPerson" namespace="/baseset" theme="simple" name="pageform">
       <s:push value="person">
       <s:hidden name="person.s_value" value="%{person.s_value}"></s:hidden>
       <s:hidden id="countsize" name="person.countSize" value="%{person.countSize}"></s:hidden>
        <input size="10" type="button" onclick="pageSet(0)" value="首页"/>
       <s:if test="person.startSize-1<1">
       		<font color="gray">上一页</font>
       </s:if>
       <s:else>
      	   <input size="10" type="button" onclick="pageSet(-1)" value="上一页"/>
       </s:else>
       <s:property value="person.startSize"/>/<s:property value="person.countSize"/>
       <s:if test="person.startSize+1>person.countSize">
       		<font color="gray">下一页</font>
       </s:if>
       <s:else>
      	 	<input size="10" type="button" onclick="pageSet(1)" value="下一页"/>
       </s:else>
       		<input size="10" type="button" onclick="pageSet(2)" value="末页"/>
        <font color="gray">跳转到：<s:textfield  id="size" size="2" name="person.startSize" cssClass="pages_border"/>页</font>
       </s:push> 
       </s:form>
  	</div>
  	 </div>
  	<div class="orgstructure_con_foot"></div>
	</td>
	<td><jsp:include flush="true" page="/main/message.jsp"></jsp:include></td>
</tr>
<tr><td colspan="3">&nbsp;<jsp:include flush="true" page="/main/bottom.jsp"></jsp:include></td></tr>
</table>
</body>
</html>