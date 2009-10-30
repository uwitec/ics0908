<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<% String base=request.getContextPath(); %>
<html>
    <head>
        <title>盘点</title>
		 <link href="<%=base%>/css/left_css.css" type="text/css" rel="stylesheet">
	    <link href="<%=base%>/css/body_css.css" type="text/css" rel="stylesheet">
	    <link href="<%=base%>/css/center_css.css" type="text/css" rel="stylesheet">
	</head>
<body>
<script type="text/javascript" src="<%=base%>/javascript/innerText.js"></script>
<SCRIPT type="text/javascript">	
	function formSub(){
		var ok_=document.getElementById("toCheck");
		var hose_value=document.getElementById("housID").value;
		if(confirm("盘点进行将不能撤销！请确认")){
			document.getElementById("error").innerHTML="";
			if(ok_.value=='disabled'){
				alert("未到盘点时间");
			}else{
				if(host_value!=""){
					goaddCheck.submit();
				}else{
					document.getElementById("error").innerHTML="请选择一个有效的仓库进行盘点！";
				}
			}
		}
	}
    </SCRIPT>
<body topmargin="0">
	<div class="body_div">
		<jsp:include flush="true" page="/pagecom/head.jsp"></jsp:include>
		<div class="left_body">
		<jsp:include flush="true" page="/main/left_.jsp"></jsp:include>
		<div class="center_body">
			<div class="center_head_text">盘点</div>
			<div class="center_tools">
			</div>	
		</div>
		<div class="center_boder">
		<div>
			 <s:form action="GoAddCheckStock"  namespace="/storage" theme="simple" name="goaddCheck">
			    <table class="center_table">
			    	<s:if test="checkStock.message!=null">
			    	    	<tr  class="table_tr_left"><td colspan="2"><s:property value="checkStock.message"/></td></tr>
			    	</s:if>
			    	<tr class="table_tr_left">
			    		<td>仓库：
			    		<s:hidden id="toCheck" name="checkTime" value="%{checkTime}"/>
			    		<s:select id="housID" cssClass="sub1_border" list="lsb" listKey="StorehouseCode" listValue="StorehouseName" name="checkStock.StorehouseCode"/>
			    		<a href="#" onclick="formSub()"><img src="<%=base%>/images/img05.gif" border="0" align="top" title="新增" alt="新增"></a>
			    		<font color="red" id="error"></font>
			    		</td>
			    	</tr>
			    </table>
	    	</s:form>
		</div>
		<table class="center_table" cellspacing="1" cellpadding="0">
	    <s:if test="lhp.size>0">
	    	<tr>
			    <td class="table_head">盘点仓库</td>
	    		<td class="table_head">盘点时间</td>
	    		<td class="table_head">审核人</td>
	    		<td class="table_head">操作员</td>
	    		<td class="table_head">是否审核通过</td>
	    		<td class="table_head">操作</td>
	    	</tr>
	    </s:if>
	    <s:else>
	    	<tr>
	    	<td class="table_tr_no" colspan="5">
	    		还有以下工作需要进行完成!
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
       		<td><s:property value="storehouseName"/></td>
    		<td><s:property value="csDate"/></td>
    		<td><s:property value="csCheckPerson"/></td>
    		<td><s:property value="personName"/></td>
    			<td>
    		<s:iterator value="list_state" status="inner">
    			<s:if test="key==csApproveState">
    				<s:property value="value"/>
    			</s:if>
    		</s:iterator>
    		</td>
    		<td>
    		<s:if test="csState==2">
    			<a href="EditCheckStock.action?checkStock.csCode=<s:property value='csCode'/>"><img src="<%=base%>/images/img03.gif" alt="编辑" title="编辑" border="0"></a>
    		</s:if>
    		<s:if test="csState==1">
    			<a href="FindCheck.action?checkStock.message='show'&checkStock.csCode=<s:property value='csCode'/>"><img src="<%=base%>/images/chaxunyu_e.gif" alt="查看" title="查看" border="0"></a>
    		</s:if>
    		</td>
    		</tr>
	       </s:iterator>
	     </table>
		  
		<div class="pages">
		<s:form action="ShowCheck" namespace="/storage" theme="simple" name="pageform">
        <s:if test="lhp.size>0">
	       <s:push value="checkStock">
	       <s:hidden name="checkStock.s_value" value="%{checkStock.s_value}"></s:hidden>
	       <s:hidden id="countsize" name="checkStock.countSize" value="%{checkStock.countSize}"></s:hidden>
	       <input type="image"  class="img_size" src="<%=base%>/images/btn_first.gif"  onclick="pageSet(0)" title="首页" alt="首页"/>
	       <s:if test="checkStock.startSize-1<1">
	       		<font color="gray">上一页</font>
	       </s:if>
	       <s:else>
	      	  <input class="img_size" type="image" src="<%=base%>/images/btn1_pre.gif" onclick="pageSet(-1)" title="上一页" alt="上一页"/>
	       </s:else>
	       <s:property value="checkStock.startSize"/>/<s:property value="checkStock.countSize"/>
	       <s:if test="checkStock.startSize+1>checkStock.countSize">
	       		<font color="gray">下一页</font>
	       </s:if>
	       <s:else>
	      	 	<input type="image" class="img_size" src="<%=base%>/images/btn_next.gif" onclick="pageSet(1)" title="下一页" alt="下一页"/>
	       </s:else>
	       		<input type="image" class="img_size" align="bottom" src="<%=base%>/images/btn1_end.gif" onclick="pageSet(2)" title="末页" alt="末页"/>
	        <font color="gray">共<s:property value="checkStock.countValue"/>条记录,合计<s:property value="checkStock.countSize"/>页</font>
	        <font color="gray">跳转到：<input type="text" onchange="pageChange(this,<s:property value="checkStock.countSize"/>)" id="size" size="2" name="checkStock.startSize" value="<s:property value="checkStock.startSize"/>" class="pages_border"/>页</font>
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