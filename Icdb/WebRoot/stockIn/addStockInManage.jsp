<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN"
"http://www.w3.org/TR/html4/strict.dtd">
		<%
			String base = request.getContextPath();
			int index = 0;
		%>
<html>
	<head>
		<link href="<%=base%>/css/body_css.css" type="text/css" rel="stylesheet">
		<link href="<%=base%>/css/center_css.css" type="text/css" rel="stylesheet">
		<link href="<%=base%>/css/stock_css.css" type="text/css" rel="stylesheet">
		<title>新增入库单</title>
		<script type='text/javascript'
			src='<%=request.getContextPath()%>/dwr/interface/StockInAction.js'></script>
		<script type='text/javascript'
			src='<%=request.getContextPath()%>/dwr/engine.js'></script>
		<script type='text/javascript'
			src='<%=request.getContextPath()%>/dwr/util.js'></script>
		<script type='text/javascript'
			src='<%=request.getContextPath()%>/script/json.js'></script>


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


	  	var materiels = window.showModalDialog("<%=base%>/stockIn/showMateriel.action?materielIds=" + materielIds + "&tempid="+Math.random(),"","dialogHeight:400px;dialogWidth:500px");

	  	if(materiels==null||materiels.length<1){
	  		return;
	  	}
		var a = document.getElementById("addMatail");
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
			//设置列内容和属性
			var cargoSpace = document.getElementById("cargoSpace").cloneNode(true);
			cargoSpace.style.display="";
			cargoSpace.id="cargoSpace"+rownum;

			var supplier = document.getElementById("supplier").cloneNode(true);
			supplier.style.display="";
			supplier.id="cargoSpace"+rownum;
			newTd0.innerHTML = rownum;

			newTd1.innerHTML = materiels[i].materielCode||'';
			newTd2.innerHTML= materiels[i].materielName||'';
			newTd3.innerHTML= materiels[i].meterielSize||'';
			newTd4.innerHTML= materiels[i].meterielABC||'';
			newTd5.innerHTML= '<input class="stock_small_border" type="text" id="stockInAmount_"'+rownum+' name="stockInAmount" onchange="getPrice(this);">';
			newTd6.innerHTML= '<input class="stock_small_border" type="text" id="onePrice_"'+rownum+' name="onePrice" onchange="getPrice(this);">'
			newTd7.appendChild(supplier);
			//newTd8.appendChild(cargoSpace);
			newTd9.innerHTML= '';
			newTd10.innerHTML= '<input type="button" value="删除" onclick = "deleteRow(this)">';

 		}
	  }

	  function getPrice(tab){
	  	var a = document.getElementById("addMatail");
		var rownum = tab.parentNode.parentNode.rowIndex;
		var onePriceId = "onePrice_"+rownum;
		var onePrice;
		if(document.getElementById(onePriceId)==null){
			onePrice = document.getElementById("addMatail").rows[rownum].cells[6].firstChild.value;
		}else{
 			onePrice = document.getElementById(onePriceId).value;
 		}
 		if(isNaN(onePrice)){
	  			alert("单价填写错误，请输入正确的数字！！！");
	  			return;
	  		}
	  	var stockInAmountId = "stockInAmount_"+rownum;
	  	var stockInAmount;
	  	if(document.getElementById(stockInAmountId)==null){
	  		stockInAmount = document.getElementById("addMatail").rows[rownum].cells[5].firstChild.value;
	  	}else{
 		stockInAmount = document.getElementById(stockInAmountId).value;
 		}
		if(isNaN(stockInAmount)){
	  			alert("数量填写错误，请输入正确的数字！！！");
	  			return;
	  		}
 		if(onePrice!='' && stockInAmount != ''){
 			a.rows.item(rownum).cells.item(9).innerHTML=onePrice*stockInAmount;
 			getSumPrice();
 		}


	  }

	  function getSumPrice(){
	  	var a = document.getElementById("addMatail");

	  	var sumPrice=0;
	  	for(var row = 1; row < a.rows.length; row++){
	  		var price = a.rows.item(row).cells.item(9).innerText
	  		if(price != ''){
	  			sumPrice = parseFloat(sumPrice)+parseFloat(price);
	  		}
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


	  function saveStockIn(){
		var stockInType = trim(document.getElementById('stockInType').value);
		if(stockInType == null || stockInType==''){
			alert("入库类型不能为空");
			return;
		}
		var stockInCode = trim(document.getElementById('stockInCode').value);

		var checkRemark = document.getElementById('checkRemark').value;
	  	var stockIn = new StockIn(stockInCode,'','','','',checkRemark,stockInType,'','','','','','','');
	  	var array = new Array();
	  	var a = document.getElementById("addMatail");
	  	for(var row = 1; row < a.rows.length; row++){
	  		var materielCode = trim(a.rows.item(row).cells.item(1).innerText);
	  		var stockInAmountId = "stockInAmount_"+row;
	  		var stockInAmount;
		  	if(document.getElementById(stockInAmountId)==null){
		  		stockInAmount = document.getElementById("addMatail").rows[row].cells[5].firstChild.value;
		  	}else{
	 		stockInAmount = document.getElementById(stockInAmountId).value;
	 		}

	  		if(isNaN(stockInAmount)){
	  			alert("数量填写错误，请输入正确的数字！！！");
	  			return;
	  		}
	  		var onePriceId = "onePrice_"+row;
	  		var onePrice;
	  		if(document.getElementById(onePriceId)==null){
			onePrice = document.getElementById("addMatail").rows[row].cells[6].firstChild.value;
			}else{
	 			onePrice = document.getElementById(onePriceId).value;
	 		}
	  		if(isNaN(onePrice)){
	  			alert("单价填写错误，请输入正确的数字！！！");
	  			return;
	  		}
	  		var supplierCodeId = "supplierCode_"+row;
	  		var supplierCode;
		  	if(document.getElementById(supplierCodeId)==null){
		  		supplierCode = document.getElementById("addMatail").rows[row].cells[7].firstChild.options[document.getElementById("addMatail").rows[row].cells[7].firstChild.selectedIndex].value;
		  	}else{
	 			supplierCode = document.getElementById(supplierCodeId).value;
	 		}

	  		if(supplierCode == null || supplierCode==''){
				alert("供应商不能为空");
				return;
			}
			/**
	  		var cargoSpaceCode = trim(a.rows.item(row).cells.item(8).firstChild.options[a.rows.item(row).cells.item(8).firstChild.options.selectedIndex].value);
			if(cargoSpaceCode == null || cargoSpaceCode==''){
				alert("货位不能为空");
				return;
			}
			**/
	  		var stockInCheckMaterielBean = new StockInCheckMaterielBean(materielCode,supplierCode,'',
	  									stockInCode,'','','','',
	  									'','','',
	  									'',stockInAmount,onePrice,stockInType);
	  		array.push(JSON.stringify(stockInCheckMaterielBean));
	  	}

//		var parameter = new Array(stockIn,array);
		var stockInJson = JSON.stringify(stockIn)
		var arrayJson = JSON.stringify(array);
		StockInAction.saveStockIn(stockInJson,array,callBack);
	  }

	  function callBack(data){
		 if(data!=null && data=="success"){
		 	 window.location.href="searchStockIn.action?backurl="+window.location.href;
		 }
	  }

	  function StockIn(stockInCode, checkMessage, checkResult,employeeCode, orderNumber,
                checkRemark,stockInType,  stockInState, stockInStateType,  stockInGM,
                stockInExGM,
                stockInExMessage,
                stockInWill,
             stockInCheckState
	  ){
	  	         this.stockInCode = stockInCode;
   				this.checkMessage=checkMessage;
				this.checkResult = checkResult;
				this.employeeCode = employeeCode;
   				this.orderNumber = orderNumber;
  			 	this.checkRemark = checkRemark;
   				this.stockInType= stockInType;
				this.stockInState = stockInState;
				this.stockInStateType = stockInStateType;
   				this.stockInGM =stockInGM;
   				this.stockInExGM = stockInExGM;
   				this.stockInExMessage = stockInExMessage;
   				this.stockInWill = stockInWill;
				this.stockInCheckState = stockInCheckState;


	  }

	  function StockInCheckMaterielBean(materielCode,supplierCode,cargoSpaceCode,
	  									stockInCode,amountPercent,qualityPercent,
	  									packagePercent,errorStockPercent,
	  									checkNote,checkAmount,checkRemark,
	  									lastAmount,stockInAmount,onePrice,stockInType){
	  	this. materielCode = materielCode;
		this.supplierCode = supplierCode;
		this.cargoSpaceCode = cargoSpaceCode;
		this.stockInCode = stockInCode;
		this.amountPercent=amountPercent;
		this.qualityPercent = qualityPercent;
		this.packagePercent = packagePercent;
		this.errorStockPercent = errorStockPercent;
		this.checkNote = checkNote;
		this.checkAmount = checkAmount;
		this.checkRemark = checkRemark;
		this.lastAmount = lastAmount;
		this.stockInAmount = stockInAmount;
		this.onePrice = onePrice;
		this.stockInType = stockInType;
	  }

	  function deleteMateriel(tab){
	  	var a = document.getElementById("addMatail");
	  	var rownum = tab.parentNode.parentNode.rowIndex;
	  	var materielCode = trim(a.rows.item(rownum).cells.item(1).innerText);
	  	var stockInCode = trim(document.getElementById('stockInCode').value);
	  	var tab = tab;
	  	StockInAction.deleteStockInMateriel(materielCode,stockInCode, function(data){deleteMaterielBack(data,tab);});
	  }

	  function deleteMaterielBack(data,tab){
	  alert(data)
	  	if(data !=null && data == "success"){
	  		deleteRow(tab);
	  	}else{
	  		alert("删除失败！");
	  	}
	  }

	  function submitStockIn(){
	  	var stockInType = trim(document.getElementById('stockInType').value);
		if(stockInType == null || stockInType==''){
			alert("入库类型不能为空");
			return;
		}
		var stockInCode = trim(document.getElementById('stockInCode').value);

		var checkRemark = document.getElementById('checkRemark').value;
	  	var stockIn = new StockIn(stockInCode,'','','','',checkRemark,stockInType,'','','','','','','');
	  	var array = new Array();
	  	var a = document.getElementById("addMatail");
	  	for(var row = 1; row < a.rows.length; row++){
	  		var materielCode = trim(a.rows.item(row).cells.item(1).innerText);
	  		var stockInAmountId = "stockInAmount_"+row;
	  		var stockInAmount;
		  	if(document.getElementById(stockInAmountId)==null){
		  		stockInAmount = document.getElementById("addMatail").rows[row].cells[5].firstChild.value;
		  	}else{
	 		stockInAmount = document.getElementById(stockInAmountId).value;
	 		}

	  		if(isNaN(stockInAmount)){
	  			alert("数量填写错误，请输入正确的数字！！！");
	  			return;
	  		}
	  		var onePriceId = "onePrice_"+row;
	  		var onePrice;
	  		if(document.getElementById(onePriceId)==null){
			onePrice = document.getElementById("addMatail").rows[row].cells[6].firstChild.value;
			}else{
	 			onePrice = document.getElementById(onePriceId).value;
	 		}

	  		if(isNaN(onePrice)){
	  			alert("单价填写错误，请输入正确的数字！！！");
	  			return;
	  		}
	  		var supplierCodeId = "supplierCode_"+row;
	  		var supplierCode;
		  	if(document.getElementById(supplierCodeId)==null){
		  		supplierCode = document.getElementById("addMatail").rows[row].cells[7].firstChild.options[document.getElementById("addMatail").rows[row].cells[7].firstChild.selectedIndex].value;
		  	}else{
	 			supplierCode = document.getElementById(supplierCodeId).value;
	 		}

	  		if(supplierCode == null || supplierCode==''){
				alert("供应商不能为空");
				return;
			}
			/**
	  		var cargoSpaceCode = trim(a.rows.item(row).cells.item(8).firstChild.options[a.rows.item(row).cells.item(8).firstChild.options.selectedIndex].value);
			if(cargoSpaceCode == null || cargoSpaceCode==''){
				alert("货位不能为空");
				return;
			}
			**/
	  		var stockInCheckMaterielBean = new StockInCheckMaterielBean(materielCode,supplierCode,'',
	  									stockInCode,'','','','',
	  									'','','',
	  									'',stockInAmount,onePrice,stockInType);
	  		array.push(JSON.stringify(stockInCheckMaterielBean));
	  	}

//		var parameter = new Array(stockIn,array);
		var stockInJson = JSON.stringify(stockIn)
		var arrayJson = JSON.stringify(array);
		StockInAction.submitStockIn(stockInJson,array,callBack);
	  }

	  function saveCheckStockIn(){
	  	var stockInType = trim(document.getElementById('stockInType').value);
		if(stockInType == null || stockInType==''){
			alert("入库类型不能为空");
			return;
		}
		var stockInCode = trim(document.getElementById('stockInCode').value);

		var checkRemark = document.getElementById('checkRemark').value;
		var checkMessage = document.getElementById('checkMessage').value;
		var employeeCode = document.getElementById('employeeCode').value;
	  	var stockIn = new StockIn(stockInCode,checkMessage,'',employeeCode,'',checkRemark,stockInType,'','','','','','','');
	  	var array = new Array();
	  	var a = document.getElementById("addMatail");
	  	for(var row = 1; row < a.rows.length; row++){
	  		var materielCode = trim(a.rows.item(row).cells.item(1).innerText);
	  		var stockInAmountId = "stockInAmount_"+row;
	  		var stockInAmount = document.getElementById(stockInAmountId).value;
	  		if(isNaN(stockInAmount)){
	  			alert("数量填写错误，请输入正确的数字！！！");
	  			return;
	  		}
	  		var onePriceId = "onePrice_"+row;
	  		var onePrice =document.getElementById(onePriceId).value;
	  		if(isNaN(onePrice)){
	  			alert("单价填写错误，请输入正确的数字！！！");
	  			return;
	  		}
	  		var supplierCodeId = "supplierCode_"+row;
	  		var supplierCode = trim(document.getElementById(supplierCodeId).value);
	  		if(supplierCode == null || supplierCode==''){
				alert("供应商不能为空");
				return;
			}
			/**
	  		var cargoSpaceCode = trim(a.rows.item(row).cells.item(8).firstChild.options[a.rows.item(row).cells.item(8).firstChild.options.selectedIndex].value);
			if(cargoSpaceCode == null || cargoSpaceCode==''){
				alert("货位不能为空");
				return;
			}
			**/
			var checkAmountId = "checkAmount_"+row;
			var checkAmount = document.getElementById(checkAmountId).value;
	  		if(isNaN(checkAmount)){
	  			alert("抽查数量填写错误，请输入正确的数字！！！");
	  			return;
	  		}

			var amountPercentId = "amountPercent_"+row;
	  		var amountPercent = document.getElementById(amountPercentId).value;
	  		if(isNaN(amountPercent)){
	  			alert("数量合格率填写错误，请输入正确的数字！！！");
	  			return;
	  		}
	  		var qualityPercentId = "qualityPercent_"+row;
	  		var qualityPercent = document.getElementById(qualityPercentId).value;
	  		if(isNaN(qualityPercent)){
	  			alert("质量合格率填写错误，请输入正确的数字！！！");
	  			return;
	  		}
	  		var packagePercentId = "packagePercent_"+row;
	  		var packagePercent = document.getElementById(packagePercentId).value;
	  		if(isNaN(packagePercent)){
	  			alert("包装合格率填写错误，请输入正确的数字！！！");
	  			return;
	  		}

			var errorStockPercentId = "errorStockPercent_"+row;
			var errorStockPercent = document.getElementById(errorStockPercentId).value;
	  		if(isNaN(errorStockPercent)){
	  			alert("商品串库率填写错误，请输入正确的数字！！！");
	  			return;
	  		}
	  		var stockInCheckMaterielBean = new StockInCheckMaterielBean(materielCode,supplierCode,'',
	  									stockInCode,amountPercent,qualityPercent,packagePercent,errorStockPercent,
	  									'',checkAmount,'',
	  									'',stockInAmount,onePrice,stockInType);
	  		array.push(JSON.stringify(stockInCheckMaterielBean));
	  	}

//		var parameter = new Array(stockIn,array);
		var stockInJson = JSON.stringify(stockIn)
		var arrayJson = JSON.stringify(array);
		StockInAction.saveCheckStockIn(stockInJson,array,callBack);
	  }

	  function submitCheckStockIn(checkResult){
	  	  	var stockInType = trim(document.getElementById('stockInType').value);
		if(stockInType == null || stockInType==''){
			alert("入库类型不能为空");
			return;
		}
		var stockInCode = trim(document.getElementById('stockInCode').value);

		var checkRemark = document.getElementById('checkRemark').value;
		var checkMessage = document.getElementById('checkMessage').value;
		var employeeCode = document.getElementById('employeeCode').value;

		if(employeeCode == null || employeeCode==''){
			alert("经手人不能为空");
			return;
		}
	  	var stockIn = new StockIn(stockInCode,checkMessage,checkResult,employeeCode,'',checkRemark,stockInType,'','','','','','','');
	  	var array = new Array();
	  	var a = document.getElementById("addMatail");
	  	for(var row = 1; row < a.rows.length; row++){
	  		var materielCode = trim(a.rows.item(row).cells.item(1).innerText);
	  		var stockInAmountId = "stockInAmount_"+row;
	  		var stockInAmount = document.getElementById(stockInAmountId).value;
	  		if(isNaN(stockInAmount)){
	  			alert("数量填写错误，请输入正确的数字！！！");
	  			return;
	  		}
	  		var onePriceId ="onePrice_"+row;
	  		var onePrice =document.getElementById(onePriceId).value;
	  		if(isNaN(onePrice)){
	  			alert("单价填写错误，请输入正确的数字！！！");
	  			return;
	  		}
	  		var supplierCodeId = "supplierCode_"+row
	  		var supplierCode = trim(document.getElementById(supplierCodeId).value);
	  		if(supplierCode == null || supplierCode==''){
				alert("供应商不能为空");
				return;
			}

			/**
	  		var cargoSpaceCode = trim(a.rows.item(row).cells.item(8).firstChild.options[a.rows.item(row).cells.item(8).firstChild.options.selectedIndex].value);
			if(cargoSpaceCode == null || cargoSpaceCode==''){
				alert("货位不能为空");
				return;
			}
			**/
			var checkAmountId = "checkAmount_"+row;
			var checkAmount = document.getElementById(checkAmountId).value;
	  		if(isNaN(checkAmount)){
	  			alert("抽查数量填写错误，请输入正确的数字！！！");
	  			return;
	  		}

			var amountPercentId = "amountPercent_"+row;
	  		var amountPercent = document.getElementById(amountPercentId).value;
	  		if(isNaN(amountPercent)){
	  			alert("数量合格率填写错误，请输入正确的数字！！！");
	  			return;
	  		}
	  		var qualityPercentId = "qualityPercent_"+row;
	  		var qualityPercent = document.getElementById(qualityPercentId).value;
	  		if(isNaN(qualityPercent)){
	  			alert("质量合格率填写错误，请输入正确的数字！！！");
	  			return;
	  		}
	  		var packagePercentId = "packagePercent_"+row;
	  		var packagePercent = document.getElementById(packagePercentId).value;
	  		if(isNaN(packagePercent)){
	  			alert("包装合格率填写错误，请输入正确的数字！！！");
	  			return;
	  		}

			var errorStockPercentId = "errorStockPercent_"+row;
			var errorStockPercent = document.getElementById(errorStockPercentId).value;
	  		if(isNaN(errorStockPercent)){
	  			alert("商品串库率填写错误，请输入正确的数字！！！");
	  			return;
	  		}
	  		var stockInCheckMaterielBean = new StockInCheckMaterielBean(materielCode,supplierCode,'',
	  									stockInCode,amountPercent,qualityPercent,packagePercent,errorStockPercent,
	  									'',checkAmount,'',
	  									'',stockInAmount,onePrice,stockInType);
	  		array.push(JSON.stringify(stockInCheckMaterielBean));
	  	}

//		var parameter = new Array(stockIn,array);
		var stockInJson = JSON.stringify(stockIn)
		var arrayJson = JSON.stringify(array);
		StockInAction.submitCheckStockIn(stockInJson,array,callBack);
	  }

	   function approvalStockIn(stockInCheckState){
			var stockInCode = trim(document.getElementById('stockInCode').value);
			var stockInExMessage = trim(document.getElementById("stockInExMessage").value);
	  		var stockIn = new StockIn(stockInCode,'','','','', '','','', '',  '', '',stockInExMessage,'',stockInCheckState);
	  		StockInAction.approvalStockIn(JSON.stringify(stockIn),callBack);
	   }

	    function complStockIn(stockInStateType){
	  	  	var stockInType = trim(document.getElementById('stockInType').value);
		if(stockInType == null || stockInType==''){
			alert("入库类型不能为空");
			return;
		}
		var stockInCode = trim(document.getElementById('stockInCode').value);

		var checkRemark = document.getElementById('checkRemark').value;
		var checkMessage = document.getElementById('checkMessage').value;
		var employeeCode = document.getElementById('employeeCode').value;
		var stockInGM = document.getElementById("stock.stockInGM").value;
	  	var stockIn = new StockIn(stockInCode,checkMessage,'',employeeCode,'',checkRemark,stockInType,'',stockInStateType,stockInGM,'','','','');
	  	var array = new Array();
	  	var a = document.getElementById("addMatail");
	  	for(var row = 1; row < a.rows.length; row++){
	  		var materielCode = trim(a.rows.item(row).cells.item(1).innerText);
	  		var stockInAmountId = "stockInAmount_"+row;
	  		var stockInAmount = document.getElementById(stockInAmountId).value;
	  		if(isNaN(stockInAmount)){
	  			alert("数量填写错误，请输入正确的数字！！！");
	  			return;
	  		}
	  		var onePriceId ="onePrice_"+row;
	  		var onePrice =document.getElementById(onePriceId).value;
	  		if(isNaN(onePrice)){
	  			alert("单价填写错误，请输入正确的数字！！！");
	  			return;
	  		}
	  		var supplierCodeId = "supplierCode_"+row
	  		var supplierCode = trim(document.getElementById(supplierCodeId).value);
	  		if(supplierCode == null || supplierCode==''){
				alert("供应商不能为空");
				return;
			}
			var cargoSpaceCodeId = "cargoSpaceCode_"+row;
	  		var cargoSpaceCode = trim(document.getElementById(cargoSpaceCodeId).value);
			if(cargoSpaceCode == null || cargoSpaceCode==''){
				alert("货位不能为空");
				return;
			}

			var checkAmountId = "checkAmount_"+row;
			var checkAmount = document.getElementById(checkAmountId).value;
	  		if(isNaN(checkAmount)){
	  			alert("抽查数量填写错误，请输入正确的数字！！！");
	  			return;
	  		}

			var amountPercentId = "amountPercent_"+row;
	  		var amountPercent = document.getElementById(amountPercentId).value;
	  		if(isNaN(amountPercent)){
	  			alert("数量合格率填写错误，请输入正确的数字！！！");
	  			return;
	  		}
	  		var qualityPercentId = "qualityPercent_"+row;
	  		var qualityPercent = document.getElementById(qualityPercentId).value;
	  		if(isNaN(qualityPercent)){
	  			alert("质量合格率填写错误，请输入正确的数字！！！");
	  			return;
	  		}
	  		var packagePercentId = "packagePercent_"+row;
	  		var packagePercent = document.getElementById(packagePercentId).value;
	  		if(isNaN(packagePercent)){
	  			alert("包装合格率填写错误，请输入正确的数字！！！");
	  			return;
	  		}

			var errorStockPercentId = "errorStockPercent_"+row;
			var errorStockPercent = document.getElementById(errorStockPercentId).value;
	  		if(isNaN(errorStockPercent)){
	  			alert("商品串库率填写错误，请输入正确的数字！！！");
	  			return;
	  		}
	  		var stockInCheckMaterielBean = new StockInCheckMaterielBean(materielCode,supplierCode,cargoSpaceCode,
	  									stockInCode,amountPercent,qualityPercent,packagePercent,errorStockPercent,
	  									'',checkAmount,'',
	  									'',stockInAmount,onePrice,stockInType);
	  		array.push(JSON.stringify(stockInCheckMaterielBean));
	  	}

//		var parameter = new Array(stockIn,array);
		var stockInJson = JSON.stringify(stockIn)
		var arrayJson = JSON.stringify(array);
		StockInAction.complStockIn(stockInJson,array,callBack);
	  }

	   function showCargoSpace(tab){

	  	  var returnValue = window.showModalDialog("showCargoSpace.action?tempid="+Math.random(),"","dialogHeight:400px;dialogWidth:500px");

		  if(returnValue==null){
		  	return;
		  }
	  	  tab.value=returnValue;
	  	}

	</script>


		<script type="text/javascript" src="<%=base%>/javascript/innerText.js"></script>

	</head>
	<body class="stock_body">
		<div class="stock_title"><img src="<%=base%>/images/img01.gif">新增入库单</div>
		<div class="stock_con">
		<s:form action="saveStockIn.action" theme="simple"
			namespace="/stockIn">
			<div>
			<table class="stock_table" cellpadding="0" cellspacing="0" width="850" border="0">
				<tr  class="stock_tr">
					<td>
						入库类型：
						<s:if test="stock.stockInStateType!=1">
							<s:select id='stockInType' name='stockInType'
								list="#{'1':'生产入库','2':'采购入库','3':'其他入库'}"
								value="stock.stockInType" headerKey="" headerValue="请选择" />
						</s:if>

						<s:else>
							<s:select id='stockInType' name='stockInType'
								list="#{'1':'生产入库','2':'采购入库','3':'其他入库'}"
								value="stock.stockInType" headerKey="" headerValue="请选择"
								disabled="true" />
						</s:else>


						<s:select id='cargoSpace' cssStyle="display:none"
							name='cargoSpaceCode' list='#request.cargoSpaceList'
							listKey='cargoSpaceCode' listValue='cargoSpaceName'
							theme='simple' headerKey='' headerValue='请选择' />
						<s:select id='supplier' cssStyle="display:none"
							name='supplierCode' list='#request.supplierList'
							listKey='supplierCode' listValue='supplierName' theme='simple'
							headerKey='' headerValue='请选择' />
					</td>
					<td>
						入库编号：
						<s:textfield id="stockInCode" name="stock.stockInCode"
							disabled="true" cssClass="stock_border"/>
					</td>
					<s:if test="stock.stockInStateType==1">
						<td>
							入库申请时间
						</td>
						<td>
							<s:property value="stock.stockInDate" />
						</td>
					</s:if>
				</tr>
			</table>
			</div>
			<div style="margin-top: 8px;margin-left:10px;">
			<s:if test="stock.stockInStateType!=1">
				<a href="#" onclick="showMateriels();" class="a_top"><img src="<%=base%>/images/img06.gif" border="0" class="a_top">选择物料</a>
			</s:if>
			</div>
			<div style="width: 800px;margin-top: 8px;">
						<table class="stock_table"  id="addMatail" cellspacing="1" width="850">
							<tr class="table_tr__even">
								<th>
									序号
								</th>
								<th>
									编号
								</th>
								<th>
									品名
								</th>
								<th>
									规格
								</th>
								<th>
									单位
								</th>
								<th>
									数量
								</th>
								<th>
									单价
								</th>
								<th>
									供应商
								</th>
								<th>
									货位编号
								</th>
								<th>
									金额
								</th>
								<s:if
									test="stock.checkResult!=-1&& stock.stockInStateType==1 && stock.stockInCheckState ==1">
									<th>
										抽查数量
									</th>
									<th>
										数量合格率
									</th>
									<th>
										质量合格率
									</th>
									<th>
										包装合格率
									</th>
									<th>
										商品串库率
									</th>
								</s:if>
								<s:if
									test="stock.stockInStateType!=1||stock.checkResult==-1||stock.stockInCheckState==-1">
									<th>
										操作
									</th>
								</s:if>
							</tr>
							<s:if test="StockInCheckMaterielBeanList.size()>0">
								<s:iterator value="StockInCheckMaterielBeanList"
									status="stockInMateriel">
									<tr
										<s:if test="#stockInMateriel.even">
											class="table_tr_odd"
										</s:if>
								       	<s:else>
							       			class="table_tr__even"
							       		</s:else>
									>
										<td align="center">
											<%=++index%>
										</td>
										<td>
											<s:property value="materielCode"></s:property>
										</td>
										<td>
											<s:property value="materielName"></s:property>
										</td>
										<td>
											<s:property value="materielSize"></s:property>
										</td>
										<td>
											<s:property value="materielABC"></s:property>
										</td>
										<td>
											<s:if
												test="stock.stockInStateType == 1&&stock.checkResult!=-1&&stock.stockInCheckState != -1">
												<s:textfield id='stockInAmount_%{#stockInMateriel.index+1}'
													name="stockInAmount" disabled="true" size="5" />
											</s:if>
											<s:else>
												<s:textfield id='stockInAmount_%{#stockInMateriel.index+1}'
													name="stockInAmount" onchange="getPrice(this);" size="5" />
											</s:else>
										</td>
										<td>
											<s:if
												test="stock.stockInStateType == 1&&stock.checkResult!=-1&&stock.stockInCheckState != -1">
												<s:textfield id="onePrice_%{#stockInMateriel.index+1}"
													name="onePrice" disabled="true" size="5" />
											</s:if>
											<s:else>
												<s:textfield id="onePrice_%{#stockInMateriel.index+1}"
													name="onePrice" onchange="getPrice(this);" size="5" />
											</s:else>
										</td>
										<td>
											<s:if
												test="stock.stockInStateType!=1||stock.stockInCheckState == -1||stock.checkResult==-1">
												<s:select name='supplierCode'
													id="supplierCode_%{#stockInMateriel.index+1}"
													list='#request.supplierList' listKey='supplierCode'
													listValue='supplierName' theme='simple'
													value="supplierCode" headerKey='' headerValue='请选择' />
											</s:if>
											<s:else>
												<s:select name='supplierCode'
													id="supplierCode_%{#stockInMateriel.index+1}"
													list='#request.supplierList' listKey='supplierCode'
													listValue='supplierName' theme='simple'
													value="supplierCode" disabled="true" />
											</s:else>
										</td>
										<td>
											<s:if
												test="stock.stockInStateType==1 && stock.checkResult==1">
												<s:textfield name="cargoSpaceCode"
													id="cargoSpaceCode_%{#stockInMateriel.index+1}"
													onclick="showCargoSpace(this);" />
											</s:if>
										</td>
										<td>
											<s:property value="(stockInAmount*onePrice)" />
										</td>
										<s:if
											test="stock.checkResult!=-1 && stock.stockInStateType==1 && stock.stockInCheckState==1">
											<td>
												<s:if test="stock.checkResult!=1">
													<s:textfield name="checkAmount"
														id="checkAmount_%{#stockInMateriel.index+1}" size="10"></s:textfield>
												</s:if>
												<s:else>
													<s:textfield name="checkAmount"
														id="checkAmount_%{#stockInMateriel.index+1}" size="10"
														disabled="true"></s:textfield>
												</s:else>
											</td>
											<td>
												<s:if test="stock.checkResult!=1">
													<s:textfield name="amountPercent"
														id="amountPercent_%{#stockInMateriel.index+1}" size="10"></s:textfield>
												</s:if>
												<s:else>
													<s:textfield name="amountPercent"
														id="amountPercent_%{#stockInMateriel.index+1}" size="10"
														disabled="true"></s:textfield>
												</s:else>
											</td>
											<td  >
												<s:if test="stock.checkResult!=1">
													<s:textfield name="qualityPercent"
														id="qualityPercent_%{#stockInMateriel.index+1}" size="10"></s:textfield>
												</s:if>
												<s:else>
													<s:textfield name="qualityPercent"
														id="qualityPercent_%{#stockInMateriel.index+1}" size="10"
														disabled="true"></s:textfield>
												</s:else>
											</td>
											<td>
												<s:if test="stock.checkResult!=1">
													<s:textfield name="packagePercent"
														id="packagePercent_%{#stockInMateriel.index+1}" size="10"></s:textfield>
												</s:if>
												<s:else>
													<s:textfield name="packagePercent"
														id="packagePercent_%{#stockInMateriel.index+1}" size="10"
														disabled="true"></s:textfield>
												</s:else>
											</td>
											<td>
												<s:if test="stock.checkResult!=1">
													<s:textfield name="errorStockPercent"
														id="errorStockPercent_%{#stockInMateriel.index+1}"
														size="10"></s:textfield>
												</s:if>
												<s:else>
													<s:textfield name="errorStockPercent"
														id="errorStockPercent_%{#stockInMateriel.index+1}"
														size="10" disabled="true"></s:textfield>
												</s:else>
											</td>
										</s:if>

										<s:if
											test="stock.stockInStateType!=1||stock.checkResult==-1||stock.stockInCheckState==-1">
											<td>

												<input type="button" value="删除"
													onclick="deleteMateriel(this);">

											</td>
										</s:if>
									</tr>
								</s:iterator>
							</s:if>
						</table>

						<table class="stock_table" cellspacing="1" border="0" width="850">
							<tr class="stock_tr">

								<td class="stock_right">
									金额合计:
									</td>
								<td colspan="3" align="right" id="sumPrice"></td>
							</tr>
							<tr class="stock_tr">


								<td colspan="4" >
									备注:<br/>
									<s:if
										test="stock.stockInStateType!=1||stock.checkResult==-1||stock.stockInCheckState == -1">
										<s:textarea id="checkRemark" name="stock.checkRemark"
											cols="100%" cssClass="stock_textarea"/>
									</s:if>
									<s:else>
										<s:textarea id="checkRemark" name="stock.checkRemark"
											cols="100%" disabled="true" cssClass="stock_textarea"/>
									</s:else>
								</td>
							</tr>
							<s:if test="stock.stockInStateType == 1">
								<tr class="stock_tr">


									<td colspan="4" >
										审批意见:<br/>
										<s:if test="stock.stockInCheckState == 1">
											<s:textarea id="stockInExMessage"
												name="stock.stockInExMessage" cols="100%" disabled="true" cssClass="stock_textarea"/>
										</s:if>
										<s:else>
											<s:textarea id="stockInExMessage"
												name="stock.stockInExMessage" cols="100%" cssClass="stock_textarea"/>
										</s:else>
									</td>
								</tr>
							</s:if>

							<s:if
								test="stock.stockInStateType == 1 && stock.stockInCheckState==1 ">
								<tr class="stock_tr">
									<td colspan="4" >
										检测意见:<br/>
										<s:if test="stock.checkResult==0">
											<s:textarea id="checkMessage" name="stock.checkMessage" cssClass="stock_textarea"
												cols="100%" />
										</s:if>
										<s:else>
											<s:textarea id="checkMessage" name="stock.checkMessage"
												cols="100%" disabled="true" cssClass="stock_textarea"/>
										</s:else>
									</td>
								</tr>
							</s:if>


							<tr class="stock_tr">
								<td>
									经手人
								</td>
								<td>
									<s:if
										test="stock.stockInStateType == 1 && stock.stockInCheckState==1 && stock.checkResult ==0">
										<s:textfield id="employeeCode" cssClass="stock_border" name="stock.employeeCode" />
									</s:if>
									<s:else>
										<s:textfield id="employeeCode" name="stock.employeeCode"
											disabled="true" cssClass="stock_border" />
									</s:else>
								</td>
								<td>
									库管员
								</td>
								<td>
									<s:if test="stock.checkResult == 1">
										<s:textfield id="stock.stockInGM" cssClass="stock_border" name="stock.stockInGM" />
									</s:if>
									<s:else>
										<s:textfield id="stock.stockInGM" name="stock.stock.stockInGM"
											disabled="true" cssClass="stock_border"/>
									</s:else>
								</td>

							</tr>
						</table>
			<div style="margin-top: 8px;margin-left:10px;">
			<s:if
				test="stock.stockInStateType!=1||stock.checkResult==-1||stock.stockInCheckState==-1">
				<a href="#" onclick="saveStockIn();"><img src="<%=base%>/images/sub1_btn_save.jpg" border="0" alt="保存"></a>
				<a href="#" onclick="submitStockIn();"><img src="<%=base%>/images/finish.jpg" border="0" alt="完成"></a>
			</s:if>
			<s:if
				test="stock.stockInStateType == 1 && stock.stockInCheckState == 0">
				<input type="button" value="通过" onclick="approvalStockIn(1)" />
				<input type="button" value="不通过" onclick="approvalStockIn(-1)" />
			</s:if>
			<s:if
				test="stock.stockInStateType == 1 && stock.stockInCheckState == 1 && stock.checkResult == 0">
				<input type="button" value="保存" onclick="saveCheckStockIn();" />
				<input type="button" value="通过" onclick="submitCheckStockIn(1);" />
				<input type="button" value="不通过" onclick="submitCheckStockIn(-1);" />
			</s:if>

			<s:if test="stock.checkResult == 1">
				<input type="button" value="保存" onclick="complStockIn(1)" />
				<input type="button" value="完成" onclick="complStockIn(3)" />
			</s:if>
			</div>
		</s:form>
		</div>
	</body>
	<SCRIPT type="text/javascript">
		getSumPrice();
	</SCRIPT>
</html>