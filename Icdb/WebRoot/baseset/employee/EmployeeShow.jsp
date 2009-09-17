<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<% String base=request.getContextPath(); %>
<html>
    <head>
        <title>员工信息</title>
		<link href="<%=base%>/css/sub.css" type="text/css" rel="stylesheet">
	</head>
<body>
<script type="text/javascript" src="<%=base%>/javascript/innerText.js"></script>
<SCRIPT type="text/javascript">

    function Addem(){
    	var href_="GoAddEmployee.action";
    	window.showModalDialog(href_,"","center:1;resizable:0;dialogHeight:250px;dialogWidth:450px");
		location.reload();
	}
	function Updateem(value_str){
		var url="GetOneEmployee.action?employee.employeeCode="+value_str;
		window.showModalDialog(url,"","dialogHeight:250px;dialogWidth:450px");
		location.reload();
	}
    </SCRIPT>
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
		<div class="orgstructure_con_tit_text">员工信息</div>
	</div>
	
	<div class="orgstructure_table_operate">
		<s:form action="ShowEmployee" namespace="/baseset" theme="simple" >
		<a href="#" onclick="Addem()" class="a_top"><img src="<%=base%>/images/img06.gif" border="0" class="a_top">添加</a>
		<input type="text" name="employee.s_value" value="<s:property value="employee.s_value"/>" class="search_border" size="20"/>
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
			    <td class="orgstructure_table_tit_m">员工编号</td>
		    	<td class="orgstructure_table_tit_m">员工姓名</td>
				<td class="orgstructure_table_tit_m">所属岗位</td>
				<td class="orgstructure_table_tit_m">所在部门</td>
				<td class="orgstructure_table_tit_m">操作</td>
	    	</tr>
	    </s:if>
	    <s:else>
	    	<tr>
	    	<td class="orgstructure_table_td_odd_r" colspan="5">
	    		未找到符合的信息!
	    	</td>
	    	</tr>
	    </s:else>
	       <s:iterator value="lhp" status="stat">
	       	<s:if test="#stat.even">
	       		<tr class="orgstructure_table_td_odd">
	       	</s:if>
	       	<s:else>
	       		<tr class="orgstructure_table_td_even">
	       	</s:else>
       	
       		<td><s:property value="employeeCode"></s:property></td>
       		<td><s:property value="personName"></s:property></td>
       		<td><s:property value="jobName"></s:property></td>
       		<td><s:property value="departmentName"></s:property></td>
	       	<td><a href="#" onclick="Updateem('<s:property value='employeeCode'/>')"><img src="<%=base%>/images/img03.gif" border="0"></a>
	        </td>
	        </tr>
	       </s:iterator>
	     </table>

  	<div class="pages">
  	<s:form action="ShowEmployee" namespace="/baseset" theme="simple" name="pageform">
       <s:push value="employee">
       <s:hidden name="employee.s_value" value="%{employee.s_value}"></s:hidden>
       <s:hidden id="countsize" name="employee.countSize" value="%{employee.countSize}"></s:hidden>
        <input size="10" type="button" onclick="pageSet(0)" value="首页"/>
       <s:if test="employee.startSize-1<1">
       		<font color="gray">上一页</font>
       </s:if>
       <s:else>
      	   <input size="10" type="button" onclick="pageSet(-1)" value="上一页"/>
       </s:else>
       <s:property value="employee.startSize"/>/<s:property value="employee.countSize"/>
       <s:if test="employee.startSize+1>employee.countSize">
       		<font color="gray">下一页</font>
       </s:if>
       <s:else>
      	 	<input size="10" type="button" onclick="pageSet(1)" value="下一页"/>
       </s:else>
       		<input size="10" type="button" onclick="pageSet(2)" value="末页"/>
        <font color="gray">跳转到：<s:textfield  id="size" size="2" name="employee.startSize" cssClass="pages_border"/>页</font>
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