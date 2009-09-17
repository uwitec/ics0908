<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN"
"http://www.w3.org/TR/html4/strict.dtd">
<html>
	<head>
		<title>新增出库单</title>
		<script type='text/javascript'
			src='<%=request.getContextPath()%>/dwr/interface/StockOutAction.js'></script>
		<script type='text/javascript'
			src='<%=request.getContextPath()%>/dwr/engine.js'></script>
		<script type='text/javascript'
			src='<%=request.getContextPath()%>/dwr/util.js'></script>
		<script type='text/javascript'
			src='<%=request.getContextPath()%>/script/json.js'></script>

		<%
			String base = request.getContextPath();
			int index = 1;
		%>
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

	  	if(!materiels){
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
			newTd8.innerHTML= '<input type="text" name="stockInCheckstockInAmount" onchange="getPrice(this);">';
			newTd9.innerHTML= '<input type="text" name="onPrice" onchange="getPrice(this);">';
			newTd10.innerHTML= '';
			newTd11.innerHTML= '<input type="button" value="删除" onclick = "deleteRow(this)">';

 		}
	  }

	  function getPrice(tab){
	  	var a = document.getElementById("addMatail");
		var rownum = tab.parentNode.parentNode.rowIndex;

 		var onPrice = a.rows.item(rownum).cells.item(9).firstChild.value;
 		if(isNaN(onPrice)){
	  			alert("单价填写错误，请输入正确的数字！！！");
	  			return;
	  		}
 		var stockInAmount = a.rows.item(rownum).cells.item(8).firstChild.value;
		if(isNaN(stockInAmount)){
	  			alert("数量填写错误，请输入正确的数字！！！");
	  			return;
	  		}
 		if(onPrice!='' && stockInAmount != ''){
 			a.rows.item(rownum).cells.item(10).innerHTML=onPrice*stockInAmount;
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
	  		var stockOutAmount = a.rows.item(row).cells.item(8).firstChild.value;
	  		var stockAmount = a.rows.item(row).cells.item(5).innerText;
	  		if(parseFloat(stockOutAmount) > parseFloat(stockAmount)){
	  			alert("数量不能大于库存数，请重新输入！");
	  			return;
	  		}
	  		if(isNaN(stockOutAmount)){
	  			alert("数量填写错误，请输入正确的数字！！！");
	  			return;
	  		}
	  		var stockOutPrice = a.rows.item(row).cells.item(9).firstChild.value;
	  		if(isNaN(stockOutPrice)){
	  			alert("单价填写错误，请输入正确的数字！！！");
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
	  		var stockOutAmount = a.rows.item(row).cells.item(8).firstChild.value;
	  		var stockAmount = a.rows.item(row).cells.item(5).innerText;
	  		if(parseFloat(stockOutAmount) > parseFloat(stockAmount)){
	  			alert("数量不能大于库存数，请重新输入！");
	  			return;
	  		}
	  		if(stockOutAmount == null && stockOutAmount ==''){
	  			alert("数量不能为空！！！");
	  			return;
	  		}
	  		if(isNaN(stockOutAmount)){
	  			alert("数量填写错误，请输入正确的数字！！！");
	  			return;
	  		}
	  		var stockOutPrice = a.rows.item(row).cells.item(9).firstChild.value;
	  		if(isNaN(stockOutPrice)){
	  			alert("单价填写错误，请输入正确的数字！！！");
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
	  		var typeIsOk = trim(a.rows.item(row).cells.item(11).firstChild.options[a.rows.item(row).cells.item(11).firstChild.options.selectedIndex].value);
	  		var amountIsOk = trim(a.rows.item(row).cells.item(12).firstChild.options[a.rows.item(row).cells.item(12).firstChild.options.selectedIndex].value);
	  		var specificationIsOk = trim(a.rows.item(row).cells.item(13).firstChild.options[a.rows.item(row).cells.item(13).firstChild.options.selectedIndex].value);
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
	  		var stockOutAmount = a.rows.item(row).cells.item(8).firstChild.value;
	  		var stockOutPrice = a.rows.item(row).cells.item(9).firstChild.value;
	  		var materielCode = trim(a.rows.item(row).cells.item(1).innerText);
	  		var typeIsOk = trim(a.rows.item(row).cells.item(11).firstChild.options[a.rows.item(row).cells.item(11).firstChild.options.selectedIndex].value);
	  		var amountIsOk = trim(a.rows.item(row).cells.item(12).firstChild.options[a.rows.item(row).cells.item(12).firstChild.options.selectedIndex].value);
	  		var specificationIsOk = trim(a.rows.item(row).cells.item(13).firstChild.options[a.rows.item(row).cells.item(13).firstChild.options.selectedIndex].value);
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
	  		var stockOutAmount = a.rows.item(row).cells.item(8).firstChild.value;
	  		var stockOutPrice = a.rows.item(row).cells.item(9).firstChild.value;
	  		var materielCode = trim(a.rows.item(row).cells.item(1).innerText);
	  		var typeIsOk = trim(a.rows.item(row).cells.item(11).firstChild.options[a.rows.item(row).cells.item(11).firstChild.options.selectedIndex].value);
	  		var amountIsOk = trim(a.rows.item(row).cells.item(12).firstChild.options[a.rows.item(row).cells.item(12).firstChild.options.selectedIndex].value);
	  		var specificationIsOk = trim(a.rows.item(row).cells.item(13).firstChild.options[a.rows.item(row).cells.item(13).firstChild.options.selectedIndex].value);
			var cargoSpaceCode = trim(a.rows.item(row).cells.item(7).innerText);
	  		var stockOutHasMaterielBean = new StockOutHasMaterielBean(cargoSpaceCode,materielCode,stockOutOrderCode, stockOutAmount,stockOutPrice,typeIsOk, amountIsOk,specificationIsOk);
	  		array.push(JSON.stringify(stockOutHasMaterielBean));
	  	}

	  	var stockOutJson = JSON.stringify(stockOut)
	  	StockOutAction.comStockOut(stockOutJson,array,callBack);

	   }

	</script>


		<script type="text/javascript" src="<%=base%>/javascript/innerText.js"></script>

	</head>
	<body>
		<s:form action="saveStockIn.action" theme="simple"
			namespace="/stockIn">

			<table cellpadding="0" cellspacing="0" width="100%" border="0">
				<tr>
					<td>
						出库编号：
						<s:textfield id="stockOutOrderCode" name="stock.stockOutOrderCode"
							disabled="true" />
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
			<s:if test="stock.stockOutStateType!=1||stock.stockOutCheckState==-1||stock.stockOutDealState==-1">
				<input value="添加物料" type="button" onclick="showMateriels();" />
			</s:if>
			<table cellpadding="0" cellspacing="1" width="100%" border="0">
				<tr>
					<td colspan="6">
						<table id="addMatail" bgcolor="black" cellspacing="1" width="100%">
							<tr>
								<th bgcolor="white">
									序号
								</th>
								<th bgcolor="white">
									编号
								</th>
								<th bgcolor="white">
									品名
								</th>
								<th bgcolor="white">
									规格
								</th>
								<th bgcolor="white">
									单位
								</th>
								<th bgcolor="white">
									库存量
								</th>
								<th bgcolor="white">
									进价
								</th>
								<th bgcolor="white">
									货位编号
								</th>
								<th bgcolor="white">
									数量
								</th>
								<th bgcolor="white">
									单价
								</th>
								<th bgcolor="white">
									金额
								</th>
								<s:if
									test="stock.stockOutCheckState==1 && stock.stockOutStateType ==1&&stock.stockOutDealState!=-1">
									<th bgcolor="white">
										型号是否符合
									</th>
									<th bgcolor="white">
										数量是否符合
									</th>
									<th bgcolor="white">
										规格是否符合
									</th>
								</s:if>
								<s:if test="stock.stockOutStateType!=1||stock.stockOutDealState==-1||stock.stockOutCheckState==-1">
									<th bgcolor="white">
										操作
									</th>
								</s:if>
							</tr>
							<s:if test="stockOutHasMaterielList.size()>0">
								<s:iterator value="stockOutHasMaterielList"
									status="stockOutMateriel">
									<tr>
										<td align="center" bgcolor="white">
											<%=index++%>
										</td>
										<td bgcolor="white">
											<s:property value="materielCode"></s:property>
										</td>
										<td bgcolor="white">
											<s:property value="materielName"></s:property>
										</td>
										<td bgcolor="white">
											<s:property value="materielSize"></s:property>
										</td>
										<td bgcolor="white">
											<s:property value="materielABC"></s:property>
										</td>
										<td bgcolor="white">
											<s:property value="stockAmount" />
										</td>
										<td bgcolor="white">
											<s:property value="stockPrice" />
										</td>
										<td bgcolor="white">
											<s:property value="cargoSpaceCode" />
										</td>
										<td bgcolor="white">
											<s:if test="stock.stockOutStateType != 1||stock.stockOutCheckState==-1||stock.stockOutDealState==-1">
												<s:textfield name="stockOutAmount" size="5" />
											</s:if>
											<s:else>
												<s:textfield name="stockOutAmount"
													onchange="getPrice(this);" size="5" disabled="true" />
											</s:else>
										</td>
										<td bgcolor="white">
											<s:if test="stock.stockOutStateType!= 1||stock.stockOutCheckState==-1||stock.stockOutDealState==-1">
												<s:textfield name="stockOutPrice" size="5" />
											</s:if>
											<s:else>
												<s:textfield name="stockOutPrice" onchange="getPrice(this);"
													size="5"  disabled="true"/>
											</s:else>
										</td>
										<td bgcolor="white">
											<s:property value="(stockOutAmount*stockOutPrice)" />
										</td>
										<s:if
											test="stock.stockOutCheckState==1 && stock.stockOutStateType==1&&stock.stockOutDealState!=-1">
											<td bgcolor="white">
												<s:if test="stock.stockOutDealState!=1">
													<s:select id="typeIsOk" list="#{1:'符合',2:'不符合'}" headerKey="" headerValue="请选择"
														name="typeIsOk"></s:select>
												</s:if>
												<s:else>
													<s:select id="typeIsOk" list="#{1:'符合',2:'不符合'}"
														name="typeIsOk" disabled="true"></s:select>
												</s:else>
											</td>
											<td bgcolor="white">
												<s:if test="stock.stockOutDealState!=1">
													<s:select id="amountIsOk" list="#{1:'符合',2:'不符合'}" headerKey="" headerValue="请选择"
														name="amountIsOk"></s:select>
												</s:if>
												<s:else>
													<s:select id="amountIsOk" list="#{1:'符合',2:'不符合'}"
														name="amountIsOk" disabled="true"></s:select>
												</s:else>
											</td>
											<td bgcolor="white">
												<s:if test="stock.stockOutDealState!=1">
														<s:select id="specificationIsOk" list="#{1:'符合',2:'不符合'}" headerKey="" headerValue="请选择" name="specificationIsOk"></s:select>
												</s:if>
												<s:else>
													<s:select id="specificationIsOk" list="#{1:'符合',2:'不符合'}"name="specificationIsOk" disabled="true"></s:select>
												</s:else>
											</td>
										</s:if>

										<s:if test="stock.stockOutStateType!=1">
											<td bgcolor="white">

												<input type="button" value="删除"
													onclick="deleteMateriel(this);">

											</td>
										</s:if>
									</tr>
								</s:iterator>
							</s:if>
						</table>
					</td>
				</tr>
				<tr>
					<td colspan="6">
						<table bgcolor="black" cellspacing="1" border="0" width="100%">
							<tr>
								<td bgColor="white">
									其它费用
								</td>
								<td colspan="2" align="right" bgColor="white">
									<s:if test="stock.stockOutStateType!=1|| stock.stockOutDealState==-1||stock.stockOutCheckState==-1">
										<s:textfield id="otherPrice" name="stock.stockOrtherMoney"
											onchange="getSumPrice();" />
									</s:if>
									<s:else>
										<s:textfield id="otherPrice" name="stock.stockOrtherMoney"
											onchange="getSumPrice();" disabled="true" />
									</s:else>
								</td>
								<td bgColor="white">
									金额合计
								</td>
								<td colspan="2" align="right" id="sumPrice" bgColor="white"></td>
							</tr>
							<tr>
								<td bgcolor="white">
									费用说明
								</td>
								<td colspan="5" bgcolor="white">
									<s:if test="stock.stockOutStateType!=1 || stock.stockOutDealState==-1||stock.stockOutCheckState==-1">
										<s:textarea id="stockOrtherMessage"
											name="stock.stockOrtherMessage" cols="100%" />
									</s:if>
									<s:else>
										<s:textarea id="stockOrtherMessage" name="stock.stockOrtherMessage"
											cols="100%" disabled="true" />
									</s:else>
								</td>
							</tr>
							<s:if test="stock.stockOutStateType == 1">
								<tr>
									<td bgcolor="white">
										审批意见
									</td>
									<td colspan="5" bgcolor="white">
										<s:if test="stock.stockOutCheckState == 1||stock.stockOutCheckState ==-1">
											<s:textarea id="stockOutMessage" name="stock.stockOutMessage"
												cols="100%" disabled="true" />
										</s:if>
										<s:else>
											<s:textarea id="stockOutMessage" name="stock.stockOutMessage"
												cols="100%" />
										</s:else>
									</td>
								</tr>
							</s:if>

							<s:if
								test="stock.stockOutStateType == 1 && stock.stockOutCheckState==1">
								<tr>
									<td bgcolor="white">
										检测意见
									</td>
									<td colspan="5" bgcolor="white">
										<s:if test="stock.stockOutDealState == 1||stock.stockOutCheckState!=-1">
											<s:textarea id="stockOutDealMessage" name="stock.stockOutDealMessage"
												cols="100%" disabled="true" />
										</s:if>
										<s:else>
											<s:textarea id="stockOutDealMessage" name="stock.stockOutDealMessage"
												cols="100%" />
										</s:else>
									</td>
								</tr>
							</s:if>

							<s:if
								test="stock.stockOutDealState == 1 ">
								<tr>
									<td bgcolor="white">
										到货地址
									</td>
									<td colspan="5" bgcolor="white">
											<s:textarea id="stockOutDestination" name="stock.stockOutDestination"
												cols="100%" />
									</td>
								</tr>
							</s:if>

							<tr>
								<td bgcolor="white" width="10%">
									申请人
								</td>
								<td bgcolor="white" width="20%">
									<s:if test="stock.stockOutStateType != 1|| stock.stockOutCheckState == -1||stock.stockOutDealState == -1">
										<s:textfield id="stockOutWith" name="stock.stockOutWith" />
									</s:if>
									<s:else>
										<s:textfield id="stockOutWith" name="stock.stockOutWith"
											disabled="true" />
									</s:else>
								</td>
								<td bgcolor="white" width="10%">
									检查人
								</td>
								<td bgcolor="white" width="20%">
									<s:if test="stock.stockOutDealState != 1 && stock.stockOutCheckState == 1">
										<s:textfield id="stockOutDealWith" name="stock.stockOutDealWith" />
									</s:if>
									<s:else>
										<s:textfield id="stockOutDealWith" name="stock.stockOutDealWith" disabled="true"/>
									</s:else>
								</td>
								<td bgcolor="white" width="10%">
									审批人
								</td>
								<td bgcolor="white">
									<s:if
										test="stock.stockOutStateType== 1 && stock.stockOutCheckState==0">
										<s:textfield id="stockOutChecker" name="stock.stockOutChecker" />
									</s:if>
									<s:else>
										<s:textfield id="stockOutChecker" name="stock.stockOutChecker"
											disabled="true" />
									</s:else>
								</td>

							</tr>
						</table>
					</td>
				</tr>
			</table>
			<s:if test="stock.stockOutStateType!=1||stock.stockOutDealState==-1||stock.stockOutCheckState==-1">
				<input type="button" value="保存" onclick="saveStockOut();" />
				<input type="button" value="提交" onclick="submitStockOut();" />
			</s:if>
			<s:if
				test="stock.stockOutStateType == 1 && stock.stockOutCheckState != 1 && stock.stockOutCheckState !=-1">
				<input type="button" value="通过" onclick="approvalStockOut(1)" />
				<input type="button" value="不通过" onclick="approvalStockOut(-1)" />
			</s:if>
			<s:if
				test="stock.stockOutStateType == 1 && stock.stockOutCheckState == 1 && stock.stockOutDealState ==0">
				<input type="button" value="保存" onclick="saveCheckStockOut();" />
				<input type="button" value="通过" onclick="submitCheckStockOut(1);" />
				<input type="button" value="不通过" onclick="submitCheckStockOut(-1);" />
			</s:if>

			<s:if test="stock.stockOutDealState == 1">
				<input type="button" value="保存" onclick="complStockOut(1)" />
				<input type="button" value="完成" onclick="complStockOut(3)" />
			</s:if>
		</s:form>
	</body>
	<SCRIPT type="text/javascript">
		getSumPrice();
	</SCRIPT>
</html>