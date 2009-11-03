<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<% String base=request.getContextPath(); %>
<html>
    <head>
        <title>报损单</title>
	<link href="<%=base%>/css/left_css.css" type="text/css" rel="stylesheet">
    <link href="<%=base%>/css/body_css.css" type="text/css" rel="stylesheet">
    <link href="<%=base%>/css/center_css.css" type="text/css" rel="stylesheet">
	</head>
<body>
<script type="text/javascript" src="<%=base%>/javascript/innerText.js"></script>
<SCRIPT type="text/javascript">
  	
  	function getOneWas(str_url){
    	var href_="GetOneWas.action?wasTage.wasCode="+str_url;
    	window.showModalDialog(href_,"","center:1;resizable:0;dialogHeight:450px;dialogWidth:700px");
		location.reload();
	}</SCRIPT>
<body topmargin="0">
	<div class="body_div">
			<jsp:include flush="true" page="/pagecom/head.jsp"></jsp:include>
		<div class="left_body">
		<jsp:include flush="true" page="/main/left_.jsp"></jsp:include>
		<div class="center_body">
			<div class="center_head_text">报损单查询</div>
			<div class="center_tools">
			<s:form action="ShowWasHistroy" namespace="/storage" theme="simple" >
				<input type="text" name="wasTage.s_value" value="<s:property value="wasTage.s_value"/>" class="search_border" size="20"/>
				<input type="image" onclick="submit()" src="<%=base%>/images/img09.gif" title="查询" alt="查询"/>
			</s:form>
			</div>	
		</div>
		<div class="center_boder">
		
		<table class="center_table" cellspacing="1" cellpadding="0">
	    <s:if test="lhp.size>0">
	    	<tr>
			    <td class="table_head">报损编号</td>
		    	<td class="table_head">报损时间</td>
		    	<td class="table_head">报损类型</td>
		    	<td class="table_head">状态</td>
		    	<td class="table_head">操作员</td>
				<td class="table_head">查看</td>
	    	</tr>
	    </s:if>
	    <s:else>
	    	<tr>
	    	<td class="table_tr_no" colspan="4">
	    		没有未完成的工作
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
			<td><s:property value="wasCode"/></td>
	       	<td><s:property value="wasTime"/></td>
	       	<td><s:iterator value="wasTypeList" status="inner">
	       			<s:if test="key==wasType">
	       				<s:property value="value"/>
	       			</s:if>
	       		</s:iterator>
	       	</td>
	       	<td><s:iterator value="wasComplete" status="inner_">
	       			<s:if test="key==wasState">
	       				<s:property value="value"/>
	       			</s:if>
	       		</s:iterator>
	       	</td>
	       	<td><s:property value="personName"/></td>
	       	<td>
	       		<a href="#" onclick="getOneWas('<s:property value="wasCode"/>')"><img src="<%=base%>/images/chaxunyu_e.gif" title="查看" alt="查看" border="0"></a>
	       	</td>
	       	</tr>
	       </s:iterator>
	     </table>
	     		<div class="pages">
	   <s:form action="ShowWasHistroy" namespace="/storage" theme="simple" name="pageform">
       <s:if test="lhp.size>0">
       <s:push value="wasTage">
       <s:hidden name="wasTage.s_value" value="%{wasTage.s_value}"></s:hidden>
       <s:hidden id="countsize" name="wasTage.countSize" value="%{wasTage.countSize}"></s:hidden>
        <input type="image"  class="img_size" src="<%=base%>/images/btn_first.gif"  onclick="pageSet(0)" title="首页" alt="首页"/>
       <s:if test="wasTage.startSize-1<1">
       		<font color="gray">上一页</font>
       </s:if>
       <s:else>
      	   <input class="img_size" type="image" src="<%=base%>/images/btn1_pre.gif" onclick="pageSet(-1)"  title="上一页" alt="上一页"/>
       </s:else>
       <s:property value="wasTage.startSize"/>/<s:property value="wasTage.countSize"/>
       <s:if test="wasTage.startSize+1>wasTage.countSize">
       		<font color="gray" >下一页</font>
       </s:if>
       <s:else>
      	 	<input type="image" class="img_size" src="<%=base%>/images/btn_next.gif" onclick="pageSet(1)" title="下一页" alt="下一页"/>
       </s:else>
       		<input type="image" class="img_size" align="bottom" src="<%=base%>/images/btn1_end.gif" onclick="pageSet(2)" title="末页" alt="末页"/>
        <font color="gray">共<s:property value="countValue"/>条记录,合计<s:property value="countSize"/>页</font>
	       <font color="gray">跳转到：<input type="text" onchange="pageChange(this,<s:property value="countSize"/>)" id="size" size="2" name="wasTage.startSize" value="<s:property value="startSize"/>" class="pages_border"/>页</font>
	  </s:push> 
	  </s:if>
       </s:form>
		</div>
		</div>
		<div class="center_boder_foot"></div>
		<jsp:include flush="true" page="/main/bottom_.jsp"></jsp:include>
	</div>
</body>
</html>