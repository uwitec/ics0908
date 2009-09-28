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
		<link href="<%=base%>/css/form_css.css" type="text/css" rel="stylesheet">
	</head>
<body>
<script type="text/javascript" src="<%=base%>/javascript/innerText.js"></script>
     <SCRIPT type="text/javascript">    
    	
    	function save(){
    		document.getElementById("save_").value="1";
    		addform.submit();
    	}
    	
    	function save_submit(){
    		addform.submit();
    	}
    	
    	function removeTable(){
    		  tblObj = document.getElementById("addMaterTab");
			  var length= tblObj.rows.length ;
			  for( var i=5; i<length; i++ ){
			      tblObj.deleteRow(5);    
			  } 
    	}
    	  
	  function getPrice(tab){
 		var a = document.getElementById("addMaterTab");
		var rownum = tab.parentNode.parentNode.rowIndex;
 		var stockInAmount = a.rows.item(rownum).cells.item(3).firstChild.value;
 		var stockPrice    = a.rows.item(rownum).cells.item(2).firstChild.value;
 		var maxAmount     = a.rows.item(rownum).cells.item(4).innerText;
 	        
 	        if(isNumber(stockInAmount,10)){
 	        	if(parseFloat(maxAmount)<parseFloat(stockInAmount)){
 	        		alert("输入数据有错误");
	 				a.rows.item(rownum).cells.item(3).firstChild.value=0;
 	        	}
 	        }else{
 	        	alert("输入数据有错误");
	 			a.rows.item(rownum).cells.item(3).firstChild.value=0;
 	        }  
 	          
	 		if(stockPrice !='' && stockInAmount != ''){
	 			a.rows.item(rownum).cells.item(5).innerHTML=stockPrice*a.rows.item(rownum).cells.item(3).firstChild.value;
	 		}else{
	 			alert("输入数据有错误");
	 			a.rows.item(rownum).cells.item(3).firstChild.value=0;
	 		}
	 		getSumPrice();
 		}
 		
 		function getSumPrice(){
	  	var a = document.getElementById("addMaterTab");

	  	var sumPrice=0;
	  	for(var row = 5; row < a.rows.length; row++){
	  		var price = a.rows.item(row).cells.item(5).innerText;
	  		if(price != ''){
	  			sumPrice = parseFloat(sumPrice)+parseFloat(price);
	  		}
	  	}

	  	var sum = document.getElementById("sumTD");
	  	sum.innerHTML="总金额:"+sumPrice;
	  }
 		
 		
    	
    	function showMateriels(){
		var a = document.getElementById("addMaterTab");
		var materielIds ="";
	 	removeTable();
		for(var row = 4;  row < a.rows.length; row++){
			materielIds = materielIds + trim(a.rows.item(row).cells.item(1).innerHTML);
			if(row != a.rows.length-1){
			materielIds = materielIds + ","
			}
		}
	  	var materiels = window.showModalDialog("<%=base%>/storage/ShowMaterStore.action","","dialogHeight:400px;dialogWidth:550px");	
	  	if(!materiels){
	  		return;
	  	}
		var a = document.getElementById("addMaterTab");
 		for(var i = 0; i < materiels.length; i++){
 			var rownum = a.rows.length;
		  	var newTr = a.insertRow(rownum);
		  	newTr.id = "row"+rownum;
		  	newTr.style.backgroundColor="#FFFFFF";
			newTr.style.fontSize="12px";
			newTr.style.textAlign ="center";
			newTr.style.verticalAlign ="middle";
			newTr.style.height="23px";
			newTr.style.color="#636B6D";
			
			var newTd1 = newTr.insertCell(0);
			var newTd2 = newTr.insertCell(1);
			var newTd3 = newTr.insertCell(2);
			var newTd4 = newTr.insertCell(3);
			var newTd5 = newTr.insertCell(4);
			var newTd6 = newTr.insertCell(5);
			var newTd7 = newTr.insertCell(6);
			var newTd8 = newTr.insertCell(7);
			
			//设置列内容和属性
			newTd1.innerHTML ='<input type="hidden" name="materielCode" value="'+materiels[i].materielCode+'"/>'+materiels[i].materielCode;
			newTd2.innerHTML= '<input type="hidden"  value="'+materiels[i].materielName+'">'+materiels[i].materielName;
			newTd3.innerHTML= '<input type="hidden" name="stockPrice" value="'+materiels[i].stockPrice+'"/>'+materiels[i].stockPrice;
			newTd4.innerHTML= '<input type="text" Class="sub_small_border" name="wasNumber" value="0" onchange="getPrice(this)"/>';
			newTd5.innerHTML= materiels[i].stockAmount||'';;
			newTd6.innerHTML= '';
			newTd7.innerHTML= materiels[i].cargoSpaceName;
			newTd8.innerHTML='<input type="text" Class="sub1_border" name="wasCause" value="">'
			
 		}	
	  }	
    </SCRIPT>
<body topmargin="0">
	<div class="body_div">
		<jsp:include flush="true" page="/pagecom/head.jsp"></jsp:include>
		<jsp:include flush="true" page="/main/left_.jsp"></jsp:include>
		<div class="center_body">
			<div class="center_head_text">新增报损单</div>
			<div class="center_tools">
			</div>	
		</div>
		<div class="center_boder">
		<s:form theme="simple" action="AddWasTage" id="addform">
		    <table id="addMaterTab"  border="0" class="center_table">
		    	<tr class="table_tr_left"><td colspan="8">
		    	报损单号：<s:textfield name="wasTage.wasCode" readonly="true" cssClass="sub1_border"/>
		    	</td></tr>
		    	<tr class="table_tr_left"><td colspan="8">
		    	报损类型：<s:select id="wasTypeM" list="wasTypeList" value="value" name="wasTage.wasType" cssClass="sub1_border" key="key"/>
		    	</td></tr>
		    	<tr class="table_tr_left"><td colspan="8">
		    	相关单据：<s:textfield id="DocNum" name="wasTage.wasDoc" readonly="true" cssClass="sub1_border"/>
		    	<a href="#" onclick="showMateriels()" class="a_top"><img src="<%=base%>/images/img06.gif" border="0" class="a_top">选择物料</a>
		    	</td></tr>
		    		<tr class="table_tr_right"><td colspan="8" width="100%"  align="right" id="sumTD">总金额:0</td></tr>
		    	<tr class="table_tr__even"><th>物料编号</th><th>物料</th><th>单价</th><th>数量</th><th>报损最大值</th><th>报损总额</th><th>库位</th><th>报损原因</th></tr>
		    </table>
		    <div align="right" style="margin-top: 8px;margin-right: 12px;">
		    		<input id="save_" type="hidden" name="wasTage.s_value" value=""/>
		    		<a href="#" onclick="save()"><img src="<%=base%>/images/sub1_btn_save.jpg" border="0"/></a>
   					<a href="#" onclick="save_submit()"><img src="<%=base%>/images/sub1_btn_save_add.jpg" border="0"/></a>
		    		<a href="#" onclick="removeTable()"><img src="<%=base%>/images/sub1_btn_reset.jpg" border="0"/></a>
   			</div>
   		</s:form>
		</div>
		<div class="center_boder_foot"></div>
		<jsp:include flush="true" page="/main/bottom_.jsp"></jsp:include>
	</div>
</body>
</html>