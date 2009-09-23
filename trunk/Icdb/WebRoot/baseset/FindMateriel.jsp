<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<% 
String base=request.getContextPath(); 
int idtitle=1;
%>
    <head>
        <link href="<%=base%>/css/sub.css" type="text/css" rel="stylesheet">
        <link href="<%=base%>/css/center_css.css" type="text/css" rel="stylesheet">
	   <title>物料信息</title>
	</HEAD>
	<script type="text/javascript" src="<%=base%>/javascript/innerText.js"></script>
	<base target="_self"> 
	<body class="sub1_body">
		<div class="sub1_title"><img src="<%=base%>/images/img01.gif">物料信息</div>
		<div class="sub1_con">
		   <div align="right">
		    <s:form action="FindMateriel" namespace="/baseset" theme="simple">
		    <input type="text" name="materiel.s_value" class="search_border"/><input type="image" onclick="submit()" src="<%=base%>/images/img09.gif" align="top"/>
		    </s:form>
		  	</div>
		<div>
		<table width="600" style="background-color:#B4BCC2;border:0px;margin-left:11px;" cellspacing="1" cellpadding="0" id="up_tab">
	    <s:if test="lhp.size>0">
	    	<tr class="table_head">
	    		<td>单选</td>
			    <td>编号</td>
		    	<td>名称</td>
		    	<td>产地</td>
				<td>价格</td>
				<td>最大库存</td>
				<td>最小库存</td>
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
	      	<tr 
	       		<s:if test="#stat.even">
	       			class="table_tr_odd"
		       	</s:if>
		       	<s:else>
	       			class="table_tr__even"
	       		</s:else>
	       	>
	       		<td align="center"><input type="radio" name="p_radio" value="<%=idtitle%>"/></td>
		 		<td id="materielCode<%=idtitle%>"><s:property value="materielCode"/></td>
				<td id="materielName<%=idtitle%>"><s:property value="materielName"/></td>
				<td><s:property value="materielMadeIn"/></td>
				<td id="stockPrice<%=idtitle++%>"><s:property value="materielPrice"/></td>
				<td><s:property value="materielMaxStore"/></td>
				<td><s:property value="materielMinStore"/></td>
			</tr>
       		</s:iterator>
		    </table>
       		 <div style="margin-top: 8px;" align="right">  
       		 <s:form action="ShowMateriel" namespace="/baseset" theme="simple" name="pageform">
       <s:push value="materiel">
       <s:hidden name="materiel.s_value" value="%{materiel.s_value}"></s:hidden>
       <s:hidden id="countsize" name="materiel.countSize" value="%{materiel.countSize}"></s:hidden>
       <input type="image"  class="img_size" src="<%=base%>/images/btn_first.gif"  onclick="pageSet(0)"/>
       <s:if test="materiel.startSize-1<1">
       		<font color="gray">上一页</font>
       </s:if>
       <s:else>
      	  <input class="img_size" type="image" src="<%=base%>/images/btn1_pre.gif" onclick="pageSet(-1)"/>
       </s:else>
       <s:property value="materiel.startSize"/>/<s:property value="materiel.countSize"/>
       <s:if test="materiel.startSize+1>materiel.countSize">
       		<font color="gray">下一页</font>
       </s:if>
       <s:else>
      	 	<input type="image" class="img_size" src="<%=base%>/images/btn_next.gif" onclick="pageSet(1)"/>
       </s:else>
       		<input type="image" class="img_size" align="bottom" src="<%=base%>/images/btn1_end.gif" onclick="pageSet(2)"/>
        <font color="gray">跳转到：<s:textfield  id="size" size="2" name="materiel.startSize" cssClass="pages_border"/>页</font>
       </s:push> 
       </s:form>
		       </div>
				<div align="right">
       			<a href="#" onclick="toSetId(new  Array('materielCode','materielName','stockPrice'),'p_radio')"><img src="<%=base%>/images/sub1_btn_hand.jpg" border="0"></a>
	      		</div>
	     </div>
		</div>
    </body>
</html>