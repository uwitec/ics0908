<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<% 
String base=request.getContextPath(); 
%>
    <head>
    <link href="<%=base%>/css/form_css.css" type="text/css" rel="stylesheet">
		<link href="<%=base%>/css/body_css.css" type="text/css" rel="stylesheet">
		<link href="<%=base%>/css/center_css.css" type="text/css" rel="stylesheet">
		<link href="<%=base%>/css/stock_css.css" type="text/css" rel="stylesheet">
	   <title>报损信息</title>
	</HEAD>
	 <script type="text/javascript" src="<%=base%>/javascript/innerText.js"></script>
     <SCRIPT type="text/javascript">    
    	
    	 function intiPrice(row_){
	 		var a = document.getElementById("addMaterTab");
	 		var stockInAmount = a.rows.item(row_).cells.item(3).firstChild.value;
	 		var stockPrice = a.rows.item(row_).cells.item(2).firstChild.value;
 			if(stockPrice ==''){
 				stockPrice=0;
 			}
	 		if(stockInAmount == ''){
	 			stockInAmount=0;
	 		}	
	 		a.rows.item(row_).cells.item(5).innerHTML=stockPrice*stockInAmount;
 		}
 		
 		function intSumPrice(){
		  	var a = document.getElementById("addMaterTab");
		  	var sumPrice=0;
		  	for(var row = 2; row < a.rows.length; row++){
		  			intiPrice(row);
		  		var price = a.rows.item(row).cells.item(5).innerText;
		  		if(price != ''){
		  			sumPrice = parseFloat(sumPrice)+parseFloat(price);
		  		}
		  	}
		  	var sum = document.getElementById("sumTD");
		  	sum.innerHTML="总金额:"+sumPrice;
	  }
    	
    	
    	
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
			  for( var i=2; i<length; i++ ){
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
	  	for(var row = 2; row < a.rows.length; row++){
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
		for(var row = 1;  row < a.rows.length; row++){
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
			newTd3.innerHTML= '<input type="hidden"" name="stockPrice" value="'+materiels[i].stockPrice+'"/>'+materiels[i].stockPrice;
			newTd4.innerHTML= '<input type="text" Class="sub_small_border" name="wasNumber" value="0" onchange="getPrice(this)"/>';
			newTd5.innerHTML= materiels[i].stockAmount||'';;
			newTd6.innerHTML= '';
			newTd7.innerHTML= materiels[i].cargoSpaceName;
			newTd8.innerHTML='<input type="text" Class="sub1_border" name="wasCause" value="">'
 		}	
	  }	
    </SCRIPT>
	<body class="stock_body">
		<div class="stock_title"><img src="<%=base%>/images/img01.gif">修改报损单</div>
		<div class="stock_con">
			
		<s:form theme="simple" action="UpdateWasTage" namespace="/storage" id="addform">
		  <div style="margin-top: 8px;">
		    	报损单号：<s:textfield name="wasTage.wasCode" readonly="true" cssClass="sub1_border"/>
		  </div>
		  <div style="margin-top: 8px;">
		    	报损类型：<s:select id="wasTypeM" list="wasTypeList" value="value" name="wasTage.wasType" cssClass="sub1_border" key="key"/>
		  </div>
		  <div style="margin-top: 8px;">
		    	相关单据：<s:textfield id="DocNum" name="wasTage.wasDoc" readonly="true" cssClass="sub1_border"/>
		    	<a href="#" onclick="showMateriels()" class="a_top"><img src="<%=base%>/images/img06.gif" border="0" class="a_top">选择物料</a>
		  </div>
		  <div style="margin-top: 8px;">
		  		报损时间：<s:textfield name="wasTage.wasTime" value="%{wasTage.wasTime}" readonly="true" cssClass="sub1_border"/>
		  </div>
		  <div style="margin-top: 8px;">
		  		操作员：<s:textfield value="%{emp.personName}" cssClass="sub1_border" readonly="true"/>
		  </div>
		  <div style="margin-top: 8px;">
		    <table id="addMaterTab"  border="0" class="center_table">
		    		<tr class="stock_tr"><td colspan="8" width="100%"  align="right" id="sumTD">总金额:0</td></tr>
		    	<tr class="table_tr__even"><th>物料编号</th><th>物料</th><th>单价</th><th>数量</th><th>报损最大值</th><th>报损总额</th><th>库位</th><th>报损原因</th></tr>
		    	<s:iterator value="lwb">
		   			<tr class="table_tr_odd">
		       		<td><s:hidden name="materielCode" value="%{materielCode}"/><s:property value="materielCode"/></td>
		       		<td><s:property value="materielName"/></td>
		       		<td><s:hidden name="stockPrice" value="%{wasMoney}"/><s:property value="wasMoney"/></td>
		       		<td><s:textfield name="wasNumber" value="%{wasNumber}" onchange="getPrice(this)" cssClass="sub_small_border"/></td>
		       		<td><s:property value="stockAmount"/></td>
		       		<td></td>
		       		<td><s:hidden value="%{cargoSpaceCode}" name="cargoSpaceCode"/><s:property value="cargoSpaceName"/></td>
		       		<td><s:textfield cssClass="sub1_border" name="wasCause"/></td>
		       		</tr>
		   		</s:iterator>
		    </table>
		  </div>
		    <div align="right" style="margin-top: 8px;margin-right: 12px;">
		    		<input id="save_" type="hidden" name="wasTage.s_value" value=""/>
		    		<a href="#" onclick="save()"><img src="<%=base%>/images/sub1_btn_save.jpg" border="0"/></a>
   					<a href="#" onclick="save_submit()"><img src="<%=base%>/images/sub1_btn_save_add.jpg" border="0"/></a>
		    		<a href="#" onclick="removeTable()"><img src="<%=base%>/images/sub1_btn_reset.jpg" border="0"/></a>
   			</div>
   		</s:form>
		</div>
		<SCRIPT type="text/javascript">
			intSumPrice();
		</SCRIPT>
    </body>
</html>