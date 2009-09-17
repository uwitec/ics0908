<%@ page contentType="text/html; charset=UTF-8"%>
<%@page import="com.mydomain.bean.storage.Page"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<title>出库管理</title>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7" />
		<script language="JavaScript" type="text/javascript"
			src="../javascript/calendar.js"></script>
		<script language="JavaScript" type="text/javascript"
			src="../javascript/calendar-chs.js"></script>
		<script language="JavaScript" type="text/javascript"
			src="../javascript/calendar-setup.js"></script>
		<link rel="stylesheet" type="text/css"
			href="../styles/calendar-blue.css" media="screen" />
		<script type='text/javascript'
			src='<%=request.getContextPath()%>/dwr/interface/StockOutAction.js'></script>
		<script type='text/javascript'
			src='<%=request.getContextPath()%>/dwr/engine.js'></script>
		<script type='text/javascript'
			src='<%=request.getContextPath()%>/dwr/util.js'></script>
		<script type='text/javascript'
			src='<%=request.getContextPath()%>/script/json.js'></script>

		<script type="text/javascript">

			function trim(s){
			  	var str = s||"";
			   	str = str.replace(/(^\s*)|(\s*$)/g,'');
			   	return str;
			}

			function previousPage(){
				var tag = document.getElementById("currentPage");
				var currentPage=tag.value - 1;
				tag.value = currentPage;
				document.getElementById("searchForm").submit();
			}

			function nextPage(){
				var tag = document.getElementById("currentPage");
				var currentPage = parseInt(tag.value) + 1;
				tag.value=currentPage;
				document.getElementById("searchForm").submit();
			}

			function pageSizeChange(){
				var pageSizeTab = document.getElementById("pageSize");
				var pageSize = pageSizeTab.value;
				if(!isNumber(pageSize)){
					alert("请输入数字！");
					pageSizeTab.focus();
					return;
				}
				var tag = document.getElementById("currentPage");
				tag.value=1;
				document.getElementById("searchForm").submit();
			}


	  		function isNumber( s ){
			   var regu = "^[0-9]+$";
			   var re = new RegExp(regu);
			   if (s.search(re) != -1) {
			   return true;
			   } else {
				  return false;
				 }
			 }

			 function check(){
			 	var start = document.getElementById('stock.stockOutStartDate').value;
            	var end = document.getElementById('stock.stockOutEndDate').value;
            	start = Date.parse(new  Date(start.replace(/-/g,"/")));
            	end =  Date.parse(new  Date(end.replace(/-/g,"/")));
            	if(start > end){
            		alert("起始日期不应大于结束日期");
            		return false;
            	}
            	if(document.getElementById("currentPage").value!=null && document.getElementById("currentPage")!=''){
            		document.getElementById("currentPage").value=1;
            	}
            	document.getElementById("searchForm").submit();
			 }

			 function deleteStockOut(tab){
				var stockOutTable = document.getElementById("stockOutTable");
				var rownum = tab.parentNode.parentNode.rowIndex
				var stockOutCode = trim(stockOutTable.rows.item(rownum).cells.item(1).innerText);
				StockOutAction.deleteStockOut(stockOutCode,function(data){deleteStockInBack(data,rownum);});
			}

			function deleteStockInBack(data,rownum){

				if(data != null && data == "success"){
					var stockInTable = document.getElementById("stockOutTable");
					for(var row =  rownum ;row < stockInTable.rows.length;row++){
			  			stockInTable.rows.item(row).cells.item(0).innerHTML = row-1;
				  	}

			  		stockInTable.deleteRow(rownum);
				}else{
					alert("删除失败");
				}


			}

			function deleteRow(tab){
			  	var a = document.getElementById("stockOutTable");
			  	var rowIndex = tab.parentNode.parentNode.rowIndex;
			  	for(var row =  rowIndex ;row < a.rows.length;row++){
			  		a.rows.item(row).cells.item(0).innerHTML = row-1;
			  	}

		  		a.deleteRow(rowIndex);
	  		}
		</script>
	</head>
	<%
		int idtitle = 1;
		String base = request.getContextPath();
	%>
	<script type="text/javascript" src="<%=base%>/javascript/innerText.js"></script>
	<body>
		<s:form id="searchForm" theme="simple" action="searchStockOut.action"
			namespace="/stockOut">
			<table width="90%" align="center">
				<tr>
					<td>
						<s:textfield name="stock.stockOutCode">入库单编号</s:textfield>
					</td>

					<td>
						<s:textfield id="stock.stockOutStartDate" size="10"
							name="stock.stockOutStartDate">开始时间</s:textfield>
					</td>

					<td>
						<s:textfield id="stock.stockOutEndDate" name="stock.stockOutEndDate"
							size="10">结束时间</s:textfield>
					</td>

					<script type="text/javascript">
                            Calendar.setup({
                                inputField : "stock.stockOutStartDate",
                                ifFormat   : "%Y-%m-%d",
                                align      : "Tl"
                            });
                            Calendar.setup({
                                inputField : "stock.stockOutEndDate",
                                ifFormat   : "%Y-%m-%d",
                                align      : "Tl"
                            });
                        </script>
					<td>
						<s:select id="stockOutStateSelect" name="stock.stockOutStateType"
							list="#{'1':'完成','2':'未完成','3':'已入库'}" value="2"
							value="stock.stockInStateType" headerKey="" headerValue="全部"
							onchange="stockInStateChange();" label="单据状态">单据状态</s:select>
					</td>
					<td id="stockInCheckStateTab">
						<s:select id="stockInCheckStateSelect"
							name="stock.stockInCheckState" list="#{'0':'未审核','-1':'审核未通过','1':'审核通过'}"
							value="stock.stockInCheckState" label="审核状态" headerKey=""
							headerValue="全部" onchange="checkStateChange();">审核状态</s:select>
					</td>
					<td id="checkResultTab">
						<s:select id="checkResultSelect" name="stock.checkResult"
							list="#{'0':'未检查','1':'检查通过','-1':'检查未通过'}" value="2"
							value="stock.checkResult" headerKey="" headerValue="全部"
							 label="检测状态">检查状态</s:select>
					</td>
					<script type="text/javascript">
					//	stockInStateChange();
					</script>
					<td>
						<input type="button" value="查询" onclick="javascript:check();" />
					</td>
				</tr>
				<tr>
					<td align="left" colspan="6">
						<input type="button" value="新建出库申请单"
							onclick="window.location.href='goAddStockOut.action'" />
					</td>

				</tr>
			</table>

			<p />
				<s:if test="stockOutList.items.size()>0">
					<table id="stockOutTable" bgcolor="black" cellpadding="0"
						cellspacing="1" width="90%" align="center">
						<tr>
							<th bgcolor="white">
								选择
							</th>
							<th bgcolor="white">
								出库申请编号
							</th>
							<th bgcolor="white">
								出库申请时间
							</th>
							<th bgcolor="white">
								审批状态
							</th>
							<th bgcolor="white">
								检查状态
							</th>
							<th bgcolor="white">
								完成状态
							</th>
							<th bgcolor="white">
								是否出库
							</th>
							<th bgcolor="white">
								操作
							</th>
						</tr>
						<s:iterator value="stockOutList.items" status="stat">
							<tr>
								<td align="center" bgcolor="white">
									<%=idtitle++%>
								</td>
								<td bgcolor="white">
									<s:property value="stockOutOrderCode"></s:property>
								</td>
								<td bgcolor="white">
									<s:property value="stockOutDate"></s:property>
								</td>
								<td bgcolor="white">
									<s:if test="stockOutCheckState == 0 ">未审核</s:if>
									<s:if test="stockOutCheckState == 1 ">审核通过</s:if>
									<s:if test="stockOutCheckState == -1 ">未通过</s:if>
								</td>
								<td bgcolor="white">
									<s:if test="stockOutDealState == 0 ">未检查</s:if>
									<s:if test="stockOutDealState == 1 ">检查通过</s:if>
									<s:if test="stockOutDealState == -1 ">检查未通过</s:if>
								</td>
								<td bgcolor="white">
									<s:if test="stockOutStateType == 1 ">完成</s:if>
									<s:elseif test="stockOutStateType == 3 ">已出库</s:elseif>
									<s:else>未完成</s:else>
								</td>
								<td bgcolor="white">
									<s:if test="stockOutWithState == 1 ">已经出库</s:if>
									<s:else>未出库</s:else>
								</td>
								<td bgcolor="white">
									<s:if
										test="stockOutDealState==-1||stockOutCheckState==-1||(stockOutStateType!=1 && stockOutStateType!=3 && stockOutCheckState != 1 && stockOutDealState!= 1)">
										<input type='button'
											onclick='window.location.href="goEditStockOut.action?stock.stockOutOrderCode=<%=request.getAttribute("stockOutOrderCode")%>"'
											value="编辑" />
									</s:if>
									<s:if
										test="stockOutStateType==1 && stockOutCheckState==1 && stockOutDealState==0 ">
										<input type='button'
											onclick='window.location.href="goCheckStockOut.action?stock.stockOutOrderCode=<%=request.getAttribute("stockOutOrderCode")%>"'
											value="检查" />
									</s:if>
									<s:if
										test="stockOutStateType == 1 && stockOutCheckState==0">
										<input type='button'
											onclick='window.location.href="goApprovalStockOut.action?stock.stockOutOrderCode=<%=request.getAttribute("stockOutOrderCode")%>"'
											value="审核">
									</s:if>
									<s:if
										test="stockOutStateType == 1 && stockOutCheckState==1 && stockOutDealState==1 && stockOutWithState!=1">
										<input type='button'
											onclick='window.location.href="goApprovalStockOut.action?stock.stockOutOrderCode=<%=request.getAttribute("stockOutOrderCode")%>"'
											value="出库">
									</s:if>
									<s:if test="stockOutDealState==-1||stockOutCheckState==-1||(stockOutStateType!=1 && stockOutStateType!=3)">
										<input type="button" onclick="javasctipt:deleteStockOut(this);"
											value="删除" />
									</s:if>
								</td>
							</tr>
						</s:iterator>
						<tr>
							<td colspan="8" align="right" bgcolor="white">
								<s:if test="page.hasPrevious">
									<input type="button" onclick="previousPage();" value="上一页" />
								</s:if>
								<s:property value="page.currentPage" />
								/
								<s:property value="page.totalPage" />


								<s:if test="page.hasNext">
									<input type="button" onclick="nextPage();" value="下一页" />
								</s:if>
								&nbsp; 每页
								<input type="text" size="4" id="pageSize" name="page.pageSize"
									value="<%=((Page) request.getAttribute("page"))
									.getPageSize()%>"
									onchange="pageSizeChange();" />
								条 &nbsp;总共
								<s:property value="page.totalRowsAmount" />
								条记录
							</td>
						</tr>
					</table>
				</s:if>
				<s:elseif test="lhp==null">
     	未找到你需要的数据！
     </s:elseif>
				<input type="hidden" id="currentPage" name="page.currentPage"
					value="<%=((Page) request.getAttribute("page"))
								.getCurrentPage()%>" />
		</s:form>
	</body>
</html>