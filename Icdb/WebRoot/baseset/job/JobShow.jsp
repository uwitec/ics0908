<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<% String base=request.getContextPath(); %>
<html>
    <head>
        <title>岗位信息</title>
    <link href="<%=base%>/css/left_css.css" type="text/css" rel="stylesheet">
    <link href="<%=base%>/css/body_css.css" type="text/css" rel="stylesheet">
    <link href="<%=base%>/css/center_css.css" type="text/css" rel="stylesheet">
	</head>
<body topmargin="0">
<script type="text/javascript" src="<%=base%>/javascript/innerText.js"></script>
<SCRIPT type="text/javascript">

    function AddJob(){
    	var href_="GoAddJob.action";
    	window.showModalDialog(href_,"","center:1;resizable:0;dialogHeight:250px;dialogWidth:450px");
		location.reload();
	}
	function UpdateJob(value_str){
		var url="GetOneJob.action?job.jobCode="+value_str;
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
			<div class="center_head_text">岗位信息</div>
			<div class="center_tools">
			<s:form action="ShowJob" namespace="/baseset" theme="simple" >
				<a href="#" onclick="AddJob()" class="a_top"><img src="<%=base%>/images/img06.gif" border="0" align="bottom">添加</a>
				<input type="text" name="job.s_value" value="<s:property value="job.s_value"/>" class="search_border" size="20"/>
				<input type="image" onclick="submit()" src="<%=base%>/images/img09.gif"/>
			</s:form>
			</div>	
		</div>
		<div class="center_boder">
		<table class="center_table" cellspacing="1" cellpadding="0">
		   <s:if test="lhp.size>0">
	    	<tr>
	    		<td class="table_head">岗位编码</td>
	    		<td class="table_head">岗位名称</td>
	    		<td class="table_head">所属部门</td>
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
	       	<td><s:property value="jobCode"/></td>
        	<td><s:property value="jobName"/></td>
        	<td><s:property value="departmentName"/></td>
	       	<td>
	       	<a href="#" onclick="UpdateJob('<s:property value="jobCode"/>')">
	       	<img src="<%=base%>/images/img03.gif" border="0" alt="修改">
	       	</a>
	        </td>
	        </tr>
	    	</s:iterator>
	     </table>
		<div class="pages">
			<s:form action="ShowJob" namespace="/baseset" theme="simple" name="pageform">
       <s:push value="job">
       <s:hidden name="job.s_value" value="%{job.s_value}"></s:hidden>
       <s:hidden id="countsize" name="job.countSize" value="%{job.countSize}"></s:hidden>
        <input type="image"  class="img_size" src="<%=base%>/images/btn_first.gif"  onclick="pageSet(0)"/>
       <s:if test="job.startSize-1<1">
       		<font color="gray">上一页</font>
       </s:if>
       <s:else>
      	   <input class="img_size" type="image" src="<%=base%>/images/btn1_pre.gif" onclick="pageSet(-1)"/>
       </s:else>
       <s:property value="job.startSize"/>/<s:property value="job.countSize"/>
       <s:if test="job.startSize+1>job.countSize">
       		<font color="gray" >下一页</font>
       </s:if>
       <s:else>
      	 	<input type="image" class="img_size" src="<%=base%>/images/btn_next.gif" onclick="pageSet(1)"/>
       </s:else>
       		<input type="image" class="img_size" align="bottom" src="<%=base%>/images/btn1_end.gif" onclick="pageSet(2)"/>
        <font color="gray">跳转到：<s:textfield  id="size" size="2" name="job.startSize" cssClass="pages_border"/>页</font>
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