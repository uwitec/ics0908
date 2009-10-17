<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<% String base=request.getContextPath(); %>
<html>
    <head>
        <title>物料流向</title>
	<link href="<%=base%>/css/left_css.css" type="text/css" rel="stylesheet">
    <link href="<%=base%>/css/body_css.css" type="text/css" rel="stylesheet">
    <link href="<%=base%>/css/center_css.css" type="text/css" rel="stylesheet">
    <link href="<%=base%>/css/form_css.css" type="text/css" rel="stylesheet">
	</head>
<body>
<script type="text/javascript" src="<%=base%>/javascript/innerText.js"></script>
<SCRIPT type="text/javascript">
	
	function search1(){
		aform.submit();
	} 
	function search2(){
		bform.submit();
	}
	
	function showSearch(){
		document.getElementById("seachDIV").style.display="block";
	}
	function closeDIV(){
		document.getElementById("seachDIV").style.display="none";
	}
	
</SCRIPT>
<body topmargin="0">

	<div class="body_div">
		<div id="seachDIV" class="searche_DIV" style="display: none;height:200px;">
			<s:form action="ShowMaterInFrom" namespace="/stockmanage" theme="simple" id="bform">
					<s:push value="materinf">
						<div align="right">
						<a href="#" onclick="closeDIV()"><img src="<%=base%>/images/quit.gif" alt="关闭" border="0"></a>
						</div>
						<div style="margin-top: 15px;margin-left: 50px;" align="left">
						开始时间:<s:textfield cssClass="sub3_border" name="materinf.startTime" value="%{materinf.startTime}" cssStyle="margin-top:5px;" /><br/>
						截至时间:<s:textfield cssClass="sub3_border" name="materinf.endTime" value="%{materinf.endTime}"/><br/>
						物料名称:<s:textfield cssClass="sub3_border" name="materinf.materielName" value="%{materinf.materielName}" cssStyle="margin-top:5px;"/><br/>
						仓库名称:<s:textfield cssClass="sub3_border" name="materinf.storehouseName" value="%{materinf.storehouseName}" cssStyle="margin-top:5px;"/><br/>
						供应商名:<s:textfield cssClass="sub3_border" name="materinf.supplierName" value="%{materinf.supplierName}" cssStyle="margin-top:5px;"/><br/>
						物料类别:<s:select cssClass="sub3_border" list="lsb" listKey="key" listValue="value" name="materinf.materielABC"/>
						<a href="#" onclick="search2()"><img src="<%=base%>/images/img09.gif" border="0" style="margin-bottom:-4px;"></a><br/>
						</div>
					</s:push>
				</s:form>
		</div>
		<jsp:include flush="true" page="/pagecom/head.jsp"></jsp:include>
		<div class="left_body">
		<jsp:include flush="true" page="/main/left_.jsp"></jsp:include>
		<div class="center_body">
			<div class="center_head_text">物料流入清单</div>
			<div class="center_tools">
				
			<div style="margin-top: -3px;">
			<s:form action="ShowMaterInFrom" namespace="/stockmanage" theme="simple" id="aform">
			<s:push value="materinf">
			<s:hidden cssClass="sub3_border" name="materinf.startTime" value="%{materinf.startTime}"/>
			<s:hidden cssClass="sub3_border" name="materinf.endTime" value="%{materinf.endTime}"/>
			<s:hidden cssClass="sub3_border" name="materinf.storehouseName" value="%{materinf.storehouseName}"/>
			<s:hidden cssClass="sub3_border" name="materinf.supplierName" value="%{materinf.supplierName}"/>
				物料名称:<s:textfield cssClass="sub3_border" name="materinf.materielName" value="%{materinf.materielName}"/>
				物料类别:<s:select cssClass="sub3_border" list="lsb" listKey="key" listValue="value" name="materinf.materielABC"/>
				<a href="#" onclick="search1()"><img src="<%=base%>/images/img09.gif" border="0" style="margin-bottom:-4px;"></a>
				<a href="#" onclick="showSearch()">高级查询</a>
			</s:push>
			</s:form>
			</div>
			</div>	
		</div>
		<div class="center_boder">
		
		<table class="center_table" cellspacing="1" cellpadding="0">
	    <s:if test="lhp.size>0">
	    	<tr class="table_head">
			    <td>编号</td>
		    	<td>名称</td>
		    	<td>入库数目</td>
		    	<td>供应商</td>
		    	<td>仓库</td>
		    	<td>ABC类型</td>
	    	</tr>
	    </s:if>
	    <s:else>
	    	<tr>
	    	<td class="table_tr_no" colspan="4">
	    		没有警告信息
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
			<td><s:property value="materielCode"/></td>
	       	<td><s:property value="materielName"/></td>
	       	<td><s:property value="lastamount"/></td>
	       	<td><s:property value="supplierName"/></td>
	       	<td><s:property value="storehouseName"/></td>
	       	<td><s:iterator value="lsb" status="inner">
	       			<s:if test="key==materielABC">
	       				<s:property value="value"/>
	       			</s:if>
	       		</s:iterator>
	       	</td>
	       	</tr>
	       </s:iterator>
	     </table>
	     		<div class="pages">
		<s:form action="ShowMaterInFrom" namespace="/stockmanage" theme="simple" name="pageform">
       <s:push value="materinf">
		<s:hidden name="materinf.materielABC" value="%{materinf.materielABC}"/>
       <s:hidden name="materinf.startTime" value="%{materinf.startTime}"/>
       <s:hidden name="materinf.endTime" value="%{materinf.endTime}"/>
       <s:hidden name="materinf.materielName" value="%{materinf.materielName}"/>
       <s:hidden cssClass="sub3_border" name="materinf.storehouseName" value="%{materinf.storehouseName}"/>
	   <s:hidden cssClass="sub3_border" name="materinf.supplierName" value="%{materinf.supplierName}"/>
       <s:hidden id="countsize" name="materinf.countSize" value="%{materinf.countSize}"/>
           <input type="image"  class="img_size" src="<%=base%>/images/btn_first.gif"  onclick="pageSet(0)"/>
       <s:if test="materinf.startSize-1<1">
       		<font color="gray">上一页</font>
       </s:if>
       <s:else>
      	   <input class="img_size" type="image" src="<%=base%>/images/btn1_pre.gif" onclick="pageSet(-1)"/>
       </s:else>
       <s:property value="materinf.startSize"/>/<s:property value="materinf.countSize"/>
       <s:if test="materinf.startSize+1>materinf.countSize">
       		<font color="gray" >下一页</font>
       </s:if>
       <s:else>
      	 	<input type="image" class="img_size" src="<%=base%>/images/btn_next.gif" onclick="pageSet(1)"/>
       </s:else>
       		<input type="image" class="img_size" align="bottom" src="<%=base%>/images/btn1_end.gif" onclick="pageSet(2)"/>
        <font color="gray">跳转到：<s:textfield  id="size" size="2" name="materinf.startSize" cssClass="pages_border"/>页</font>
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