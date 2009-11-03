<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<% String base=request.getContextPath(); %>
<html>
    <head>
        <title>初期库存</title>
		 <link href="<%=base%>/css/left_css.css" type="text/css" rel="stylesheet">
	    <link href="<%=base%>/css/body_css.css" type="text/css" rel="stylesheet">
	    <link href="<%=base%>/css/center_css.css" type="text/css" rel="stylesheet">
	</head>
<body>
<script type="text/javascript" src="<%=base%>/javascript/innerText.js"></script>
<SCRIPT type="text/javascript">
 
    function AddMat(){
    	var href_="GoAddMateriel.action";
    	window.showModalDialog(href_,"","center:1;resizable:0;dialogHeight:450px;dialogWidth:500px");
		location.reload();
	}
	function UpdateMat(value_str){
		var url="GetOneMateriel.action?materiel.materielCode="+value_str;
		window.showModalDialog(url,"","dialogHeight:450px;dialogWidth:500px");
		location.reload();
	}
	

    </SCRIPT>
<body topmargin="0">
	<div class="body_div">
		<jsp:include flush="true" page="/pagecom/head.jsp"></jsp:include>
		<div class="left_body">
		<jsp:include flush="true" page="/main/left_.jsp"></jsp:include>
		<div class="center_body">
			<div class="center_head_text">初期库存</div>
			<div class="center_tools">
			</div>	
		</div>
		<div class="center_boder">
		 <table class="center_table"  border="0">
	       <s:iterator value="lsb" status="stat">
	       	<tr 
	       		<s:if test="#stat.even">
	       			class="table_tr_odd"
		       	</s:if>
		       	<s:else>
	       			class="table_tr__even"
	       		</s:else>
	       	>
	       
	        <td><s:hidden value="storehouseCode"/><s:url id="updateUrl" action="GetStockMaterielList">
				<s:param name="storehouse.storehouseCode" value="storehouseCode"></s:param>       
	        	</s:url> 
	        	<s:a href="%{updateUrl}"><s:property value="storehouseName"></s:property></s:a>
	        </td>
	        </tr>
	       </s:iterator>
    	 </table>  
		<div class="pages">
		</div>
		</div>
		<div class="center_boder_foot"></div>
		<jsp:include flush="true" page="/main/bottom_.jsp"></jsp:include>
		</div>
	</div>
</body>
</html>