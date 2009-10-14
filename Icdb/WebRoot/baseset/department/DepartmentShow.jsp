<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<% String base=request.getContextPath(); %>
<html>
    <head>
        <title>部门信息</title>
    <link href="<%=base%>/css/left_css.css" type="text/css" rel="stylesheet">
    <link href="<%=base%>/css/body_css.css" type="text/css" rel="stylesheet">
    <link href="<%=base%>/css/center_css.css" type="text/css" rel="stylesheet">
	</head>
<body topmargin="0">
<script type="text/javascript" src="<%=base%>/javascript/innerText.js"></script>
<SCRIPT type="text/javascript">

    function AddDep(){
    	var href_="GoAddDepartment.action";
    	window.showModalDialog(href_,"","center:1;resizable:0;dialogHeight:250px;dialogWidth:450px");
		location.reload();
	}
	function UpdateDep(value_str){
		var url="GetOneDepartment.action?department.departmentCode="+value_str;
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
			<div class="center_head_text">部门信息</div>
			<div class="center_tools">
			<s:form action="ShowDepartment" namespace="/baseset" theme="simple" >
				<a href="#" onclick="AddDep()" class="a_top"><img src="<%=base%>/images/img06.gif" border="0" align="bottom">添加</a>
				<input type="text" name="department.s_value" value="<s:property value="department.s_value"/>" class="search_border" size="20"/>
				<input type="image" onclick="submit()" src="<%=base%>/images/img09.gif"/>
			</s:form>
			</div>	
		</div>
		<div class="center_boder">
		<table class="center_table" cellspacing="1" cellpadding="0">
		   <s:if test="lhp.size>0">
	    	<tr>
	    		<td class="table_head">部门编号</td>
	    		<td class="table_head">部门名称</td>
	    		<td class="table_head">所属机构</td>
	    		<td class="table_head">操作</td>
	    	</tr>
	    </s:if>
	    <s:else>
	    	<tr>
	    	<td class="table_tr_no" colspan="3">
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
	       	<td><s:property value="departmentCode"/></td>
       		<td><s:property value="departmentName"/></td>
        	<td><s:property value="structName"/></td>
	       	<td>
	       	<a href="#" onclick="UpdateDep('<s:property value="departmentCode"/>')">
	       	<img src="<%=base%>/images/img03.gif" border="0" alt="修改">
	       	</a>
	        </td>
	        </tr>
	    	</s:iterator>
	     </table>
		<div class="pages">
			<s:form action="ShowDepartment" namespace="/baseset" theme="simple" name="pageform">
       <s:push value="department">
       <s:hidden name="department.s_value" value="%{department.s_value}"></s:hidden>
       <s:hidden id="countsize" name="department.countSize" value="%{department.countSize}"></s:hidden>
        <input type="image"  class="img_size" src="<%=base%>/images/btn_first.gif"  onclick="pageSet(0)"/>
       <s:if test="department.startSize-1<1">
       		<font color="gray">上一页</font>
       </s:if>
       <s:else>
      	   <input class="img_size" type="image" src="<%=base%>/images/btn1_pre.gif" onclick="pageSet(-1)"/>
       </s:else>
       <s:property value="department.startSize"/>/<s:property value="department.countSize"/>
       <s:if test="department.startSize+1>department.countSize">
       		<font color="gray" >下一页</font>
       </s:if>
       <s:else>
      	 	<input type="image" class="img_size" src="<%=base%>/images/btn_next.gif" onclick="pageSet(1)"/>
       </s:else>
       		<input type="image" class="img_size" align="bottom" src="<%=base%>/images/btn1_end.gif" onclick="pageSet(2)"/>
        <font color="gray">跳转到：<s:textfield  id="size" size="2" name="department.startSize" cssClass="pages_border"/>页</font>
       </s:push> 
       </s:form>
		</div>
		</div>
	<div class="center_boder_foot"></div>
		<jsp:include flush="true" page="/main/bottom_.jsp"></jsp:include>
		</div>
	</div>
</body>
</html>