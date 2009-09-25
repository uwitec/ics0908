<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<% 
String base=request.getContextPath(); 
int index = 1;
%>
    <head>
       <link href="<%=base%>/css/sub.css" type="text/css" rel="stylesheet">
		<link href="<%=base%>/css/body_css.css" type="text/css" rel="stylesheet">
		<link href="<%=base%>/css/center_css.css" type="text/css" rel="stylesheet">
		<link href="<%=base%>/css/stock_css.css" type="text/css" rel="stylesheet">
	   <title>出库单</title>
	</HEAD>
	<script type='text/javascript'
			src='<%=request.getContextPath()%>/dwr/interface/StockOutAction.js'></script>
		<script type='text/javascript'
			src='<%=request.getContextPath()%>/dwr/engine.js'></script>
		<script type='text/javascript'
			src='<%=request.getContextPath()%>/dwr/util.js'></script>
		<script type='text/javascript'
			src='<%=request.getContextPath()%>/script/json.js'></script>
	<script type="text/javascript" src="<%=base%>/javascript/innerText.js"></script>
				<script type='text/javascript'>

	  function trim(s){
	  	var str = s||"";
	   	str = str.replace(/(^\s*)|(\s*$)/g,'');
	   	return str;
	}

	  function showMateriels(){
		var a = document.getElementById("addMatail");

		var materielIds ="";

		for(var row = 1;  row < a.rows.length; row++){
			materielIds = materielIds + trim(a.rows.item(row).cells.item(1).innerHTML);

			if(row != a.rows.length-1){
			materielIds = materielIds + ","
			}
		}


	  	var materiels = window.showModalDialog("<%=base%>/stockOut/showMateriel.action?materielIds=" + materielIds + "&tempid="+Math.random(),"","dialogHeight:400px;dialogWidth:500px");

	  	if(materiels==null||materiels.length<1){
	  		return;
	  	}
		var a = document.getElementById("addMatail");
 		for(var i = 0; i < materiels.length; i++){

 			var rownum = a.rows.length;
		  	var newTr = a.insertRow(rownum);
		  	newTr.id = "row"+rownum;
		  	var newTd0 = newTr.insertCell(0);
			var newTd1 = newTr.insertCell(1);
			var newTd2 = newTr.insertCell(2);
			var newTd3 = newTr.insertCell(3);
			var newTd4 = newTr.insertCell(4);
			var newTd5 = newTr.insertCell(5);
			var newTd6 = newTr.insertCell(6);
			var newTd7 = newTr.insertCell(7);
			var newTd8 = newTr.insertCell(8);
			var newTd9 = newTr.insertCell(9);
			var newTd10 = newTr.insertCell(10);
			var newTd11 = newTr.insertCell(11);

			newTd0.bgColor = "white";
			newTd1.bgColor = "white";
			newTd2.bgColor = "white";
			newTd3.bgColor = "white";
			newTd4.bgColor = "white";
			newTd5.bgColor = "white";
			newTd6.bgColor = "white";
			newTd7.bgColor = "white";
			newTd8.bgColor = "white";
			newTd9.bgColor = "white";
			newTd10.bgColor = "white";
			newTd11.bgColor = "white";
			//设置列内容和属性

			newTd0.innerHTML = rownum;
			newTd1.innerHTML = materiels[i].materielCode||'';
			newTd2.innerHTML= materiels[i].materielName||'';
			newTd3.innerHTML= materiels[i].meterielSize||'';
			newTd4.innerHTML= materiels[i].meterielABC||'';
			newTd5.innerHTML= materiels[i].stockAmount||'';
			newTd6.innerHTML=materiels[i].stockPrice||'';
			newTd7.innerHTML=materiels[i].cargoSpaceCode||'';
			newTd8.innerHTML= '<input type="text" id="stockOutAmount_"'+rownum+' name="stockOutAmount" onchange="getPrice(this);">';
			newTd9.innerHTML= '<input type="text" id="stockOutPrice_"'+rownum+' name="stockOutPrice" onchange="getPrice(this);">';
			newTd10.innerHTML= '';
			newTd11.innerHTML= '<input type="button" value="删除" onclick = "deleteRow(this)">';

 		}
	  }

	  function getPrice(tab){
	  	var a = document.getElementById("addMatail");
		var rownum = tab.parentNode.parentNode.rowIndex;
		var stockOutPriceId = "stockOutPrice_"+rownum;
		var stockOutPrice;
  		if(document.getElementById(stockOutPriceId)==null){
			stockOutPrice = document.getElementById("addMatail").rows[rownum].cells[9].firstChild.value;
		}else{
 			stockOutPrice = document.getElementById(stockOutPriceId).value;
 		}
 		if(isNaN(stockOutPrice)){
	  			alert("单价填写错误，请输入正确的数字！！！");
	  			return;
	  		}
	  	var stockOutAmountId = "stockOutAmount_"+rownum;
 		var stockOutAmount;
		  	if(document.getElementById(stockOutAmountId)==null){
		  		stockOutAmount = document.getElementById("addMatail").rows[rownum].cells[8].firstChild.value;
		  	}else{
	 			stockOutAmount = document.getElementById(stockOutAmountId).value;
	 		}
		if(isNaN(stockOutAmount)){
	  			alert("数量填写错误，请输入正确的数字！！！");
	  			return;
	  		}
 		if(stockOutPrice !='' && stockOutAmount != ''){
 			a.rows.item(rownum).cells.item(10).innerHTML=stockOutPrice*stockOutAmount;
 			getSumPrice();
 		}


	  }

	  function getSumPrice(){
	  	var a = document.getElementById("addMatail");

	  	var sumPrice=0;
	  	for(var row = 1; row < a.rows.length; row++){
	  		var price = a.rows.item(row).cells.item(10).innerText
	  		if(price != ''){
	  			sumPrice = parseFloat(sumPrice)+parseFloat(price);
	  		}
	  	}
		var otherPrice = document.getElementById("otherPrice").value;
		if(otherPrice!=null && otherPrice!=''){
			sumPrice = parseFloat(sumPrice) + parseFloat(otherPrice);
		}
	  	var sum = document.getElementById("sumPrice");
	  	sum.innerHTML=sumPrice;
	  }

	  function deleteRow(tab){
	  	var a = document.getElementById("addMatail");
	  	var rowIndex = tab.parentNode.parentNode.rowIndex;
	  	for(var row =  rowIndex ;row < a.rows.length;row++){
	  		a.rows.item(row).cells.item(0).innerHTML = row-1;
	  	}

	  	a.deleteRow(rowIndex);
	  }


	  function saveStockOut(){

		var stockOutOrderCode = trim(document.getElementById('stockOutOrderCode').value);

		var stockOrtherMessage = document.getElementById('stockOrtherMessage').value;
		var otherPrice = document.getElementById('otherPrice').value;
		if(otherPrice!=null && otherPrice!=''&&isNaN(otherPrice)){
	  			alert("其它费用填写错误，请输入正确的数字！！！");
	  			return;
	  	}
		var stockOrtherMessage = document.getElementById('stockOrtherMessage').value;
		var stockOutWith = document.getElementById('stockOutWith').value;
	  	var stockOut = new StockOut(stockOutOrderCode,
									'',
									'',
									'',
									'',
									'',
									'',
									'',
									'',
									'',
									'',
									'',
									'',
									'',
									'',
									otherPrice,
									stockOrtherMessage,
									'',
									stockOutWith,
									'');
	  	var array = new Array();
	  	var a = document.getElementById("addMatail");
	  	for(var row = 1; row < a.rows.length; row++){
	  		var materielCode = trim(a.rows.item(row).cells.item(1).innerText);
	  		var stockOutPriceId = "stockOutPrice_"+row;
			var stockOutPrice;
	  		if(document.getElementById(stockOutPriceId)==null){
				stockOutPrice = document.getElementById("addMatail").rows[row].cells[9].firstChild.value;
			}else{
	 			stockOutPrice = document.getElementById(stockOutPriceId).value;
	 		}
 			if(isNaN(stockOutPrice)){
	  			alert("单价填写错误，请输入正确的数字！！！");
	  			return;
	  		}
	  		var stockOutAmountId = "stockOutAmount_"+row;
 			var stockOutAmount;
		  	if(document.getElementById(stockOutAmountId)==null){
		  		stockOutAmount = document.getElementById("addMatail").rows[row].cells[8].firstChild.value;
		  	}else{
	 			stockOutAmount = document.getElementById(stockOutAmountId).value;
	 		}
			if(isNaN(stockOutAmount)){
	  			alert("数量填写错误，请输入正确的数字！！！");
	  			return;
	  		}
	  		var stockAmount = a.rows.item(row).cells.item(5).innerText;
	  		if(parseFloat(stockOutAmount) > parseFloat(stockAmount)){
	  			alert("数量不能大于库存数，请重新输入！");
	  			return;
	  		}


	  		var cargoSpaceCode = trim(a.rows.item(row).cells.item(7).innerText);
			if(cargoSpaceCode == null || cargoSpaceCode==''){
				alert("货位不能为空");
				return;
			}

	  		var stockOutHasMaterielBean = new StockOutHasMaterielBean(cargoSpaceCode,materielCode,stockOutOrderCode, stockOutAmount,stockOutPrice,'', '','');
	  		array.push(JSON.stringify(stockOutHasMaterielBean));
	  	}

//		var parameter = new Array(stockIn,array);
		var stockOutJson = JSON.stringify(stockOut)
		//var arrayJson = JSON.stringify(array);
		StockOutAction.saveStockOut(stockOutJson,array,callBack);
	  }

	    function submitStockOut(){

		var stockOutOrderCode = trim(document.getElementById('stockOutOrderCode').value);

		var stockOrtherMessage = document.getElementById('stockOrtherMessage').value;
		var otherPrice = document.getElementById('otherPrice').value;
		if(otherPrice!=null && otherPrice!=''&&isNaN(otherPrice)){
	  			alert("其它费用填写错误，请输入正确的数字！！！");
	  			return;
	  	}
		var stockOutWith = document.getElementById('stockOutWith').value;
	  	var stockOut = new StockOut(stockOutOrderCode,
									'',
									'',
									'',
									'',
									'',
									'',
									'',
									'',
									'',
									'',
									'',
									'',
									'',
									'',
									otherPrice,
									stockOrtherMessage,
									'',
									stockOutWith,
									'');
	  	var array = new Array();
	  	var a = document.getElementById("addMatail");
	  	for(var row = 1; row < a.rows.length; row++){
	  		var materielCode = trim(a.rows.item(row).cells.item(1).innerText);
	  		var stockOutPriceId = "stockOutPrice_"+row;
		var stockOutPrice;
  		if(document.getElementById(stockOutPriceId)==null){
			stockOutPrice = document.getElementById("addMatail").rows[row].cells[9].firstChild.value;
		}else{
 			stockOutPrice = document.getElementById(stockOutPriceId).value;
 		}
 		if(isNaN(stockOutPrice)){
	  			alert("单价填写错误，请输入正确的数字！！！");
	  			return;
	  		}
	  	var stockOutAmountId = "stockOutAmount_"+row;
 		var stockOutAmount;
		  	if(document.getElementById(stockOutAmountId)==null){
		  		stockOutAmount = document.getElementById("addMatail").rows[row].cells[8].firstChild.value;
		  	}else{
	 			stockOutAmount = document.getElementById(stockOutAmountId).value;
	 		}
		if(isNaN(stockOutAmount)){
	  			alert("数量填写错误，请输入正确的数字！！！");
	  			return;
	  		}
	  		var stockAmount = a.rows.item(row).cells.item(5).innerText;
	  		if(parseFloat(stockOutAmount) > parseFloat(stockAmount)){
	  			alert("数量不能大于库存数，请重新输入！");
	  			return;
	  		}
	  		if(stockOutAmount == null && stockOutAmount ==''){
	  			alert("数量不能为空！！！");
	  			return;
	  		}

			if(stockOutPrice == null && stockOutPrice ==''){
	  			alert("单价不能为空！！！");
	  			return;
	  		}

	  		var cargoSpaceCode = trim(a.rows.item(row).cells.item(7).innerText);
			if(cargoSpaceCode == null || cargoSpaceCode==''){
				alert("货位不能为空");
				return;
			}

	  		var stockOutHasMaterielBean = new StockOutHasMaterielBean(cargoSpaceCode,materielCode,stockOutOrderCode, stockOutAmount,stockOutPrice,'', '','');
	  		array.push(JSON.stringify(stockOutHasMaterielBean));
	  	}

//		var parameter = new Array(stockIn,array);
		var stockOutJson = JSON.stringify(stockOut)
		//var arrayJson = JSON.stringify(array);
		StockOutAction.submitStockOut(stockOutJson,array,callBack);
	  }


	  function callBack(data){
		 if(data!=null && data=="success"){
		 	 window.location.href="searchStockOut.action?backurl="+window.location.href;
		 }
	  }

	  function StockOut(stockOutOrderCode,
	customerCode,
	stockOutState,
	stockOutDealWith,
	stockOutDealMessage,
	stockOutDealDate,
	stockOutDealState,
	stockOutManager,
	stockOutDate,
	stockOutDestination,
	stockOutChecker,
	stockOutCheckState,
	stockOutCheckDate,
	stockOutMessage,
	stockOutStateType,
	stockOrtherMoney,
	stockOrtherMessage,
	stockOutWillDate,
	stockOutWith,
	stockOutWithState
	  ){
	  	this.stockOutOrderCode=stockOutOrderCode;
		this.customerCode=customerCode;
		this.stockOutState=stockOutState;
		this.stockOutDealWith=stockOutDealWith;
		this.stockOutDealMessage=stockOutDealMessage;
		this.stockOutDealDate=stockOutDealDate;
		this.stockOutDealState=stockOutDealState;
		this.stockOutManager=stockOutManager;
		this.stockOutDate=stockOutDate;
		this.stockOutDestination=stockOutDestination;
		this.stockOutChecker=stockOutChecker;
		this.stockOutCheckState=stockOutCheckState;
		this.stockOutCheckDate=stockOutCheckDate;
		this.stockOutMessage=stockOutMessage;
		this.stockOutStateType=stockOutStateType;
		this.stockOrtherMoney=stockOrtherMoney;
		this.stockOrtherMessage=stockOrtherMessage;
		this.stockOutWillDate=stockOutWillDate;
		this.stockOutWith=stockOutWith;
		this.stockOutWithState=stockOutWithState;
	  }

	  function StockOutHasMaterielBean(cargoSpaceCode,materielCode,stockOutOrderCode, stockOutAmount,stockOutPrice,typeIsOk, amountIsOk,specificationIsOk){
	  	this.cargoSpaceCode=cargoSpaceCode;
		this.materielCode=materielCode;
		this.stockOutOrderCode=stockOutOrderCode;
		this.stockOutAmount=stockOutAmount;
		this.stockOutPrice=stockOutPrice;
		this.typeIsOk=typeIsOk;
		this.amountIsOk=amountIsOk;
		this.specificationIsOk=specificationIsOk;
	  }

	  function deleteMateriel(tab){
	  	var a = document.getElementById("addMatail");
	  	var rownum = tab.parentNode.parentNode.rowIndex;
	  	var materielCode = trim(a.rows.item(rownum).cells.item(1).innerText);
	  	var stockOutCode = trim(document.getElementById('stockOutOrderCode').value);
	  	var tab = tab;
	  	StockOutAction.deleteStockOutMateriel(materielCode,stockOutCode, function(data){deleteMaterielBack(data,tab);});
	  }

	  function deleteMaterielBack(data,tab){
	  alert(data)
	  	if(data !=null && data == "success"){
	  		deleteRow(tab);
	  	}else{
	  		alert("删除失败！");
	  	}
	  }

	  function saveCheckStockOut(){

		var stockOutOrderCode = trim(document.getElementById('stockOutOrderCode').value);

		var stockOutDealMessage = document.getElementById('stockOutDealMessage').value;
		var stockOutDealWith = document.getElementById('stockOutDealWith').value;
	  	var stockOut = new StockOut(stockOutOrderCode,
									'',
									'',
									stockOutDealWith,
									stockOutDealMessage,
									'',
									'',
									'',
									'',
									'',
									'',
									'',
									'',
									'',
									'',
									'',
									'',
									'',
									'',
									'');
	  	var array = new Array();
	  	var a = document.getElementById("addMatail");
	  	for(var row = 1; row < a.rows.length; row++){
	  		var materielCode = trim(a.rows.item(row).cells.item(1).innerText);
	  		var typeIsOkId="typeIsOk_"+row;
	  		var typeIsOk = trim(document.getElementById(typeIsOkId).options[document.getElementById(typeIsOkId).options.selectedIndex].value);
	  		var amountIsOkId="amountIsOk_"+row;
	  		var amountIsOk = trim(document.getElementById(amountIsOkId).options[document.getElementById(amountIsOkId).options.selectedIndex].value);
	  		var specificationIsOkId="specificationIsOk_"+row;
	  		var specificationIsOk = trim(document.getElementById(specificationIsOkId).options[document.getElementById(specificationIsOkId).options.selectedIndex].value);
			var cargoSpaceCode = trim(a.rows.item(row).cells.item(7).innerText);
	  		var stockOutHasMaterielBean = new StockOutHasMaterielBean(cargoSpaceCode,materielCode,stockOutOrderCode, '','',typeIsOk, amountIsOk,specificationIsOk);
	  		array.push(JSON.stringify(stockOutHasMaterielBean));
	  	}

//		var parameter = new Array(stockIn,array);
		var stockOutJson = JSON.stringify(stockOut);
		StockOutAction.saveCheckStockOut(stockOutJson,array,callBack);
	  }

	  function submitCheckStockOut(stockOutDealState){

		var stockOutOrderCode = trim(document.getElementById('stockOutOrderCode').value);

		var stockOutDealMessage = document.getElementById('stockOutDealMessage').value;
		var stockOutDealWith = document.getElementById('stockOutDealWith').value;
	  	var stockOut = new StockOut(stockOutOrderCode,
									'',
									'',
									stockOutDealWith,
									stockOutDealMessage,
									'',
									stockOutDealState,
									'',
									'',
									'',
									'',
									'',
									'',
									'',
									'',
									'',
									'',
									'',
									'',
									'');
	  	var array = new Array();
	  	var a = document.getElementById("addMatail");
	  	for(var row = 1; row < a.rows.length; row++){
	  		var stockOutAmountId="stockOutAmount_"+row;
	  		var stockOutAmount = document.getElementById(stockOutAmountId).value;
	  		var stockOutPriceId = "stockOutPrice_"+row;
	  		var stockOutPrice = document.getElementById(stockOutPriceId).value;
	  		var materielCode = trim(a.rows.item(row).cells.item(1).innerText);
	  		var typeIsOkId="typeIsOk_"+row;
	  		var typeIsOk = trim(document.getElementById(typeIsOkId).options[document.getElementById(typeIsOkId).options.selectedIndex].value);
	  		var amountIsOkId="amountIsOk_"+row;
	  		var amountIsOk = trim(document.getElementById(amountIsOkId).options[document.getElementById(amountIsOkId).options.selectedIndex].value);
	  		var specificationIsOkId="specificationIsOk_"+row;
	  		var specificationIsOk = trim(document.getElementById(specificationIsOkId).options[document.getElementById(specificationIsOkId).options.selectedIndex].value);
			var cargoSpaceCode = trim(a.rows.item(row).cells.item(7).innerText);
	  		var stockOutHasMaterielBean = new StockOutHasMaterielBean(cargoSpaceCode,materielCode,stockOutOrderCode, stockOutAmount,stockOutPrice,typeIsOk, amountIsOk,specificationIsOk);
	  		array.push(JSON.stringify(stockOutHasMaterielBean));
	  	}

//		var parameter = new Array(stockIn,array);
		var stockOutJson = JSON.stringify(stockOut)
		StockOutAction.submitCheckStockOut(stockOutJson,array,callBack);
	  }

	   function approvalStockOut(stockOutCheckState){
			var stockOutOrderCode = trim(document.getElementById('stockOutOrderCode').value);
			var stockOutMessage = trim(document.getElementById("stockOutMessage").value);
			var stockOutChecker = trim(document.getElementById("stockOutChecker").value);
	  		var stockOut = new StockOut(stockOutOrderCode,
										'',
										'',
										'',
										'',
										'',
										'',
										'',
										'',
										'',
										stockOutChecker,
										stockOutCheckState,
										'',
										stockOutMessage,
										'',
										'',
										'',
										'',
										'',
										'');
	  		StockOutAction.approvalStockOut(JSON.stringify(stockOut),callBack);
	   }

	    function complStockOut(stockOutStateType){
	  	  	var stockOutOrderCode = trim(document.getElementById('stockOutOrderCode').value);
			var stockOutMessage = trim(document.getElementById("stockOutMessage").value);
			var stockOutChecker = trim(document.getElementById("stockOutChecker").value);
			var stockOutDestination = trim(document.getElementById("stockOutDestination").value);
	  		var stockOut = new StockOut(stockOutOrderCode,
										'',
										'',
										'',
										'',
										'',
										'',
										'',
										'',
										stockOutDestination,
										stockOutChecker,
										'',
										'',
										stockOutMessage,
										stockOutStateType,
										'',
										'',
										'',
										'',
										'');

		var array = new Array();
	  	var a = document.getElementById("addMatail");
	  	for(var row = 1; row < a.rows.length; row++){
	  		var stockOutAmountId="stockOutAmount_"+row;
	  		var stockOutAmount = document.getElementById(stockOutAmountId).value;
	  		var stockOutPriceId = "stockOutPrice_"+row;
	  		var stockOutPrice = document.getElementById(stockOutPriceId).value;
	  		var materielCode = trim(a.rows.item(row).cells.item(1).innerText);
	  		var typeIsOkId="typeIsOk_"+row;
	  		var typeIsOk = trim(document.getElementById(typeIsOkId).options[document.getElementById(typeIsOkId).options.selectedIndex].value);
	  		var amountIsOkId="amountIsOk_"+row;
	  		var amountIsOk = trim(document.getElementById(amountIsOkId).options[document.getElementById(amountIsOkId).options.selectedIndex].value);
	  		var specificationIsOkId="specificationIsOk_"+row;
	  		var specificationIsOk = trim(document.getElementById(specificationIsOkId).options[document.getElementById(specificationIsOkId).options.selectedIndex].value);
			var cargoSpaceCode = trim(a.rows.item(row).cells.item(7).innerText);
	  		var stockOutHasMaterielBean = new StockOutHasMaterielBean(cargoSpaceCode,materielCode,stockOutOrderCode, stockOutAmount,stockOutPrice,typeIsOk, amountIsOk,specificationIsOk);
	  		array.push(JSON.stringify(stockOutHasMaterielBean));
	  	}

	  	var stockOutJson = JSON.stringify(stockOut)
	  	StockOutAction.comStockOut(stockOutJson,array,callBack);

	   }

	</script>
	
	<body class="stock_body">
		<div class="stock_title"><img src="<%=base%>/images/img01.gif">出库单审核</div>
		<div class="stock_con">
			
		<s:form action="saveStockIn.action" theme="simple" namespace="/stockIn">
		<div>
		<table class="stock_table" cellpadding="0" cellspacing="0" width="100%" border="0">
			<tr class="stock_tr">
				<td>
					出库编号：
					<s:textfield id="stockOutOrderCode" name="stock.stockOutOrderCode"
						disabled="true" cssClass="stock_border"/>
				</td>
				<s:if test="stock.stockOutStateType==1">
					<td>
						出库申请时间
					</td>
					<td>
						<s:property value="stock.stockOutWillDate" />
					</td>
				</s:if>
			</tr>
		</table>
		</div>
		<div style="margin-top: 8px;margin-left:10px;">
		<s:if test="stock.stockOutStateType!=1||stock.stockOutCheckState==-1||stock.stockOutDealState==-1">
		<a href="#" onclick="showMateriels();" class="a_top"><img src="<%=base%>/images/img06.gif" border="0" class="a_top">选择物料</a>
		</s:if>
		</div>
		<div style="width: 800px;margin-top: 8px;">
		<table id="addMatail"  class="stock_table" width="850">
			<tr class="table_tr__even">
				<th>序号</th><th>编号</th><th>品名</th><th>规格</th><th>单位</th><th>库存量</th>
				<th>进价</th><th>货位编号</th><th>数量</th><th>单价</th><th>金额</th>
			</tr>
			<s:if test="stockOutHasMaterielList.size()>0">
				<s:iterator value="stockOutHasMaterielList"
					status="stockOutMateriel">
					<tr 
			       		<s:if test="#stockOutMateriel.even">
			       			class="table_tr_odd"
				       	</s:if>
				       	<s:else>
			       			class="table_tr__even"
			       		</s:else>
			       	>
						<td><%=index++%></td>
						<td><s:property value="materielCode"/></td>
						<td><s:property value="materielName"/></td>
						<td><s:property value="materielSize"/></td>
						<td><s:property value="materielABC"/></td>
						<td><s:property value="stockAmount"/></td>
						<td><s:property value="stockPrice"/></td>
						<td><s:property value="cargoSpaceCode"/></td>
						<td>
							<s:if test="stock.stockOutStateType != 1||stock.stockOutCheckState==-1||stock.stockOutDealState==-1">
								<s:textfield cssClass="stock_small_border" id="stockOutAmount_%{#stockOutMateriel.index+1}" name="stockOutAmount" cssStyle="stock_small_border" onchange="getPrice(this);"  />
							</s:if>
							<s:else>
								<s:textfield id="stockOutAmount_%{#stockOutMateriel.index+1}" name="stockOutAmount" cssClass="stock_small_border" disabled="true" />
							</s:else>
						</td>
						<td>
							<s:if test="stock.stockOutStateType!= 1||stock.stockOutCheckState==-1||stock.stockOutDealState==-1">
								<s:textfield cssClass="stock_small_border" id="stockOutPrice_%{#stockOutMateriel.index+1}" name="stockOutPrice" cssStyle="stock_small_border" onchange="getPrice(this);"/>
							</s:if>
							<s:else>
								<s:textfield cssClass="stock_small_border" id="stockOutPrice_%{#stockOutMateriel.index+1}"  name="stockOutPrice" cssStyle="stock_small_border" disabled="true"/>
							</s:else>
						</td>
						<td>
							<s:property value="(stockOutAmount*stockOutPrice)" />
						</td>
					</tr>
				</s:iterator>
			</s:if>
			</table>
			<table class="stock_table" width="850">
			<tr>
				<td class="stock_tr" colspan="10">
					其它费用:
					<s:if test="stock.stockOutStateType!=1|| stock.stockOutDealState==-1||stock.stockOutCheckState==-1">
						<s:textfield id="otherPrice" name="stock.stockOrtherMoney" cssClass="stock_border" onchange="getSumPrice();" />
					</s:if>
					<s:else>
						<s:textfield id="otherPrice" name="stock.stockOrtherMoney" cssClass="stock_border" onchange="getSumPrice();" disabled="true" />
					</s:else>
				</td>
				<td class="stock_right">
					金额合计:
				</td>
				<td  align="right" id="sumPrice" class="stock_tr">&nbsp;&nbsp;&nbsp;&nbsp;</td>
			</tr>
			<tr class="stock_tr" >
				<td colspan="12">
					费用说明:<br/>
					<s:if test="stock.stockOutStateType!=1 || stock.stockOutDealState==-1||stock.stockOutCheckState==-1">
						<s:textarea  id="stockOrtherMessage" cssClass="stock_textarea" name="stock.stockOrtherMessage" cols="100%" />
					</s:if>
					<s:else>
						<s:textarea id="stockOrtherMessage" cssClass="stock_textarea"  name="stock.stockOrtherMessage"
							cols="100%" disabled="true" />
					</s:else>
				</td>
			</tr>
			<tr class="stock_tr" >
				<td colspan="12">
					审批意见：<br/>
					<s:if test="stock.stockOutCheckState == 1||stock.stockOutCheckState ==-1">
						<s:textarea id="stockOutMessage" name="stock.stockOutMessage" cssClass="stock_textarea"  cols="100%" disabled="true" />
					</s:if>
					<s:else>
						<s:textarea id="stockOutMessage" name="stock.stockOutMessage" cssClass="stock_textarea"  cols="100%" />
					</s:else>
				</td>
			</tr>
			<tr class="stock_tr">
				<td colspan="4">
					申请人:
					<s:if test="stock.stockOutStateType != 1|| stock.stockOutCheckState == -1||stock.stockOutDealState == -1">
						<s:textfield id="stockOutWith" name="stock.stockOutWith" cssClass="stock_border"/>
					</s:if>
					<s:else>
						<s:textfield id="stockOutWith" name="stock.stockOutWith" cssClass="stock_border" disabled="true" />
					</s:else>
				</td>
				<td colspan="4">
					检查人:
					<s:if test="stock.stockOutDealState != 1 && stock.stockOutCheckState == 1">
						<s:textfield id="stockOutDealWith" cssClass="stock_border" name="stock.stockOutDealWith" />
					</s:if>
					<s:else>
						<s:textfield id="stockOutDealWith" cssClass="stock_border" name="stock.stockOutDealWith" disabled="true"/>
					</s:else>
				</td>
				<td colspan="4">
					审批人:
					<s:if test="stock.stockOutStateType== 1 && stock.stockOutCheckState==0">
						<s:textfield id="stockOutChecker" cssClass="stock_border" name="stock.stockOutChecker" />
					</s:if>
					<s:else>
						<s:textfield id="stockOutChecker" cssClass="stock_border" name="stock.stockOutChecker" disabled="true" />
					</s:else>
				</td>

			</tr>
			</table>
			</div>
			<div style="margin-top: 8px;margin-left:10px;">
			<s:if
				test="stock.stockOutStateType == 1 && stock.stockOutCheckState != 1 && stock.stockOutCheckState !=-1">
				<a href="#" onclick="approvalStockOut(1)"><img src="<%=base%>/images/pass.jpg" border="0" alt="通过"></a>
				<a href="#" onclick="approvalStockOut(-1)"><img src="<%=base%>/images/no.jpg" border="0" alt="未通过"></a>
			
			</s:if>
			</div>
		</s:form>
		</div>
		<SCRIPT type="text/javascript">
			getSumPrice();
		</SCRIPT>
    </body>
</html>