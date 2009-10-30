<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<% String base=request.getContextPath(); %>
<html>
    <head>
        <title>员工信息</title>
		<link href="<%=base%>/css/left_css.css" type="text/css" rel="stylesheet">
		<link href="<%=base%>/css/body_css.css" type="text/css" rel="stylesheet">
		<link href="<%=base%>/css/center_css.css" type="text/css" rel="stylesheet">
		<link href="<%=base%>/css/form_css.css" type="text/css" rel="stylesheet">
	</head>
<body>
<script type="text/javascript" src="<%=base%>/javascript/innerText.js"></script>
<SCRIPT type="text/javascript">

	function Updateem(value_str){
		var url="GetOneEmployee.action?employee.employeeCode="+value_str;
		window.showModalDialog(url,"","dialogHeight:250px;dialogWidth:450px");
		location.reload();
	}
    </SCRIPT>
<body topmargin="0">
	<div class="body_div">
		<jsp:include flush="true" page="/pagecom/head.jsp"></jsp:include>
		<div class="left_body">
		<jsp:include flush="true" page="/main/left_.jsp"></jsp:include>
		<div class="center_body">
			<div class="center_head_text">员工信息</div>
			<div class="center_tools">
			<s:form action="ShowEmployee" namespace="/baseset" theme="simple" >
				<a href="GoAddEmployee.action" class="a_top"><img src="<%=base%>/images/img06.gif" border="0" alt="添加" title="添加" class="a_top">添加</a>
				<input type="text" name="employee.s_value" value="<s:property value="employee.s_value"/>"  class="search_border" size="20"/>
				<input type="image" onclick="submit()" src="<%=base%>/images/img09.gif" alt="查询" title="查询"/>
			</s:form>
			</div>	
		</div>
		<div class="center_boder">
		
		   <table class="center_table" cellspacing="1" cellpadding="0">
	    <s:if test="lhp.size>0">
	    	<tr>
			    <td class="table_head">员工编号</td>
		    	<td class="table_head">员工姓名</td>
				<td class="table_head">所属岗位</td>
				<td class="table_head">所在部门</td>
				<td class="table_head">操作</td>
	    	</tr>
	    </s:if>
	    <s:else>
	    	<tr>
	    	<td class="table_tr_no" colspan="5">
	    		未找到符合的信息!
	    	</td>
	    	</tr>
	    </s:else>
	       <s:iterator value="lhp" status="stat">
         	<tr 
	       		<s:if test="#stat.even">
	       			class="table_tr_odd"
		       	</s:if>
		       	<s:else>
	       			class="table_tr__even"
	       		</s:else>
	       	>
       		<td><s:property value="employeeCode"/></td>
       		<td><s:property value="personName"/></td>
       		<td><s:property value="jobName"/></td>
       		<td><s:property value="departmentName"/></td>
	       	<td><a href="GetOneEmployee.action?employee.employeeCode=<s:property value="employeeCode"/>"><img src="<%=base%>/images/img03.gif" alt="修改" title="修改" border="0"></a></td>
	       	</tr>
	       </s:iterator>
	     </table>
		  
		<div class="pages">
		<s:form action="ShowEmployee" namespace="/baseset" theme="simple" name="pageform">
        <s:if test="lhp.size>0">
       <s:push value="employee">
       <s:hidden name="employee.s_value" value="%{employee.s_value}"></s:hidden>
       <s:hidden id="countsize" name="employee.countSize" value="%{employee.countSize}"></s:hidden>
       <input type="image"  class="img_size" src="<%=base%>/images/btn_first.gif"  onclick="pageSet(0)" title="首页" alt="首页"/>
       <s:if test="employee.startSize-1<1">
       		<font color="gray">上一页</font>
       </s:if>
       <s:else>
      	  <input class="img_size" type="image" src="<%=base%>/images/btn1_pre.gif" onclick="pageSet(-1)" title="上一页" alt="上一页"/>
       </s:else>
       <s:property value="employee.startSize"/>/<s:property value="employee.countSize"/>
       <s:if test="employee.startSize+1>employee.countSize">
       		<font color="gray">下一页</font>
       </s:if>
       <s:else>
      	 	<input type="image" class="img_size" src="<%=base%>/images/btn_next.gif" onclick="pageSet(1)" title="下一页" alt="下一页"/>
       </s:else>
       		<input type="image" class="img_size" align="bottom" src="<%=base%>/images/btn1_end.gif" onclick="pageSet(2)" title="末页" alt="末页"/>
       <font color="gray">共<s:property value="countValue"/>条记录,合计<s:property value="countSize"/>页</font>
	   <font color="gray">跳转到：<input type="text" onchange="pageChange(this,<s:property value="countSize"/>)" id="size" size="2" name="employee.startSize" value="<s:property value="startSize"/>" class="pages_border"/>页</font>
	   </s:push> 
	   </s:if>
       </s:form>
		</div>
		</div>
		<div class="center_boder_foot"></div>
		<jsp:include flush="true" page="/main/bottom_.jsp"></jsp:include>
		</div>
	</div>
</body>
</html>