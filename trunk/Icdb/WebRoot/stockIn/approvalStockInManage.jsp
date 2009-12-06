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
		<link href="<%=base%>/css/sub.css" type="text/css" rel="stylesheet">
		<link href="<%=base%>/css/body_css.css" type="text/css"
			rel="stylesheet">
		<link href="<%=base%>/css/center_css.css" type="text/css"
			rel="stylesheet">
		<link href="<%=base%>/css/stock_css.css" type="text/css"
			rel="stylesheet">
		<title>入库审核单</title>
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

	 function goback(){	
			if(window.confirm("终止当前工作返回上一页？")){
				window.location.href="searchApprovalStockIn.action";
			}
	}

	  function callBack(data){
		 if(data!=null && data=="success"){
		 	 window.location.href="searchApprovalStockIn.action?backurl="+window.location.href;
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

	   function approvalStockIn(stockInCheckState){
		   if(window.confirm("是否进行该工作，该工作进行后将不能撤销！")){
				var stockInCode = trim(document.getElementById('stockInCode').value);
				var stockInExMessage = trim(document.getElementById("stockInExMessage").value);
		  		var stockIn = new StockIn(stockInCode,'','','','', '','','', '',  '', '',stockInExMessage,'',stockInCheckState);
		  		StockInAction.approvalStockIn(JSON.stringify(stockIn),callBack);
		  	}
	   }
	</script>


		<script type="text/javascript" src="<%=base%>/javascript/innerText.js"></script>

	</head>
	<body class="stock_body">
		<div class="stock_title">
			<img src="<%=base%>/images/img01.gif">
			审核入库单
		</div>
		<div class="stock_con">
			<s:form action="saveStockIn.action" theme="simple"
				namespace="/stockIn">
				<div>
					<table cellpadding="0" cellspacing="0" width="850" border="0"
						class="stock_table" cellpadding="0" cellspacing="0" border="0">
						<tr class="stock_tr">
							<td>
								入库类型：

								<s:select id='stockInType' name='stockInType'
									list="#{'1':'生产入库','2':'采购入库','3':'其他入库'}"
									value="stock.stockInType" headerKey="" headerValue="请选择"
									disabled="true" />



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
									disabled="true" cssClass="stock_border" />
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
				<div style="width: 800px; margin-top: 8px;">

					<table class="stock_table" id="addMatail" cellspacing="1"
						width="850">
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
							       		</s:else>>
									<td align="center">
										<%=++index%>
										<s:property value="#stockInMateriel.index" />
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
												name="stockInAmount" disabled="true" size="5"
												cssClass="stock_border" />
										</s:if>
										<s:else>
											<s:textfield id='stockInAmount_%{#stockInMateriel.index+1}'
												name="stockInAmount" onchange="getPrice(this);" size="5"
												cssClass="stock_border" />
										</s:else>
									</td>
									<td>
										<s:if
											test="stock.stockInStateType == 1&&stock.checkResult!=-1&&stock.stockInCheckState != -1">
											<s:textfield id="onePrice_%{#stockInMateriel.index+1}"
												name="onePrice" disabled="true" size="5"
												cssClass="stock_border" />
										</s:if>
										<s:else>
											<s:textfield id="onePrice_%{#stockInMateriel.index+1}"
												name="onePrice" onchange="getPrice(this);" size="5"
												cssClass="stock_border" />
										</s:else>
									</td>
									<td>
										<s:if
											test="stock.stockInStateType!=1||stock.stockInCheckState == -1||stock.checkResult==-1">
											<s:select name='supplierCode'
												id="supplierCode_%{#stockInMateriel.index+1}"
												list='#request.supplierList' listKey='supplierCode'
												listValue='supplierName' theme='simple' value="supplierCode"
												headerKey='' headerValue='请选择' />
										</s:if>
										<s:else>
											<s:select name='supplierCode'
												id="supplierCode_%{#stockInMateriel.index+1}"
												list='#request.supplierList' listKey='supplierCode'
												listValue='supplierName' theme='simple' value="supplierCode"
												disabled="true" />
										</s:else>
									</td>
									<td>
										<s:if test="stock.stockInStateType==1 && stock.checkResult==1">
											<s:textfield name="cargoSpaceCode"
												id="cargoSpaceCode_%{#stockInMateriel.index+1}"
												onclick="showCargoSpace(this);" />
										</s:if>
									</td>
									<td>
										<s:property value="(stockInAmount*onePrice)" />
									</td>

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


							<td colspan="4">
								备注:
								<br />
								<s:textarea id="checkRemark" name="stock.checkRemark"
									cols="100%" disabled="true" cssClass="stock_textarea" />
							</td>
						</tr>

						<tr class="stock_tr">
							<td colspan="4">
								审批意见:
								<br />
								<s:textarea id="stockInExMessage" name="stock.stockInExMessage"
									cols="100%" cssClass="stock_textarea" />

							</td>
						</tr>
						<tr class="stock_tr">
							<td>
								经手人
							</td>
							<td width="30%">
								<s:textfield id="employeeCode" name="stock.employeeCode"
									disabled="true" cssClass="stock_border" />
							</td>
							<td>
								库管员
							</td>
							<td>
								<s:textfield id="stock.stockInGM" name="stock.stockInGM"
									disabled="true" cssClass="stock_border" />
							</td>

						</tr>
					</table>
					<div style="margin-top: 8px; margin-left: 10px;">
						<s:if
							test="stock.stockInStateType == 1 && stock.stockInCheckState == 0">
							<a href="#" onclick="approvalStockIn(1);"><img
									src="<%=base%>/images/pass.jpg" border="0" title="通过" alt="通过">
							</a>
							<a href="#" onclick="approvalStockIn(-1);"><img
									src="<%=base%>/images/no.jpg" border="0" title="通过" alt="未通过">
							</a>
							<a href="#" onclick="goback();"><img src="<%=base%>/images/back.gif" border="0" alt="返回"></a>
						</s:if>
					</div>
			</s:form>
		</div>
	</body>
	<SCRIPT type="text/javascript">
		getSumPrice();
	</SCRIPT>
</html>