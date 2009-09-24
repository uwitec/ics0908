<%@ page contentType="text/html; charset=UTF-8"%>
<%@page import="com.mydomain.bean.storage.Page"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<title>入库管理</title>
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
			src='<%=request.getContextPath()%>/dwr/interface/StockInAction.js'></script>
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

			function deleteStockIn(tab){
				var stockInTable = document.getElementById("stockInTable");
				var rownum = tab.parentNode.parentNode.rowIndex
				var stockInCode = trim(stockInTable.rows.item(rownum).cells.item(1).innerText);
				StockInAction.deleteStockIn(stockInCode,function(data){deleteStockInBack(data,rownum);});
			}

			function deleteStockInBack(data,rownum){

				if(data != null && data == "success"){
					var stockInTable = document.getElementById("stockInTable");
					for(var row =  rownum ;row < stockInTable.rows.length;row++){
			  			stockInTable.rows.item(row).cells.item(0).innerHTML = row-1;
				  	}

			  		stockInTable.deleteRow(rownum);
				}else{
					alert("删除失败");
				}


			}

			function deleteRow(tab){
			  	var a = document.getElementById("stockInTable");
			  	var rowIndex = tab.parentNode.parentNode.rowIndex;
			  	for(var row =  rowIndex ;row < a.rows.length;row++){
			  		a.rows.item(row).cells.item(0).innerHTML = row-1;
			  	}

		  		a.deleteRow(rowIndex);
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
			 	var start = document.getElementById('stock.stockInStartDate').value;
            	var end = document.getElementById('stock.stockInEndDate').value;
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

			 function stockInStateChange(){
				var stockInStateSelect = document.getElementById("stockInStateSelect");
				if(document.getElementById("checkResultTab")==null){
					return;
				}

				if(stockInStateSelect.options[stockInStateSelect.selectedIndex].value == 3){
					document.getElementById("stockInCheckStateSelect").value="1";
					document.getElementById("checkResultSelect").value="1";
					document.getElementById("stockInCheckStateTab").style.display="none";
					document.getElementById("checkResultTab").style.display="none";

				}else if(stockInStateSelect.options[stockInStateSelect.selectedIndex].value != 2){
					document.getElementById("stockInCheckStateTab").style.display="";
					checkStateChange()
				}else{
					document.getElementById("stockInCheckStateTab").style.display="none";
					if(document.getElementById("checkResultTab")==null){
						return;
					}
					document.getElementById("checkResultTab").style.display="none";
				}
			 }

			 function checkStateChange(){
			 	var checkResultSelect  = document.getElementById("stockInCheckStateSelect");
				if(document.getElementById("stockInCheckStateTab")==null){
					return;
				}
			 	if(checkResultSelect.options[checkResultSelect.selectedIndex].value == "0" || checkResultSelect.options[checkResultSelect.selectedIndex].value == "-1"){
			 		document.getElementById("checkResultTab").style.display="none";
			 	}else{
			 		document.getElementById("checkResultTab").style.display="";
			 	}
			 }
		</script>
	</head>
	<%
		int idtitle = 1;
		String base = request.getContextPath();
	%>
	<script type="text/javascript" src="<%=base%>/javascript/innerText.js"></script>
	<body>
		<s:form id="searchForm" theme="simple" action="searchCheckStockIn.action"
			namespace="/stockIn">
			<table width="90%" align="center">
				<tr>
					<td>
						<s:textfield name="stock.stockInCode">入库单编号</s:textfield>
					</td>

					<td>
						<s:textfield id="stock.stockInStartDate" size="10"
							name="stock.stockInStartDate">开始时间</s:textfield>
					</td>

					<td>
						<s:textfield id="stock.stockInEndDate" name="stock.stockInEndDate"
							size="10">结束时间</s:textfield>
					</td>

					<script type="text/javascript">
                            Calendar.setup({
                                inputField : "stock.stockInStartDate",
                                ifFormat   : "%Y-%m-%d",
                                align      : "Tl"
                            });
                            Calendar.setup({
                                inputField : "stock.stockInEndDate",
                                ifFormat   : "%Y-%m-%d",
                                align      : "Tl"
                            });
                        </script>

					<td id="checkResultTab">
						<s:select id="checkResultSelect" name="stock.checkResult"
							list="#{'0':'未检查','1':'检查通过','-1':'检查未通过'}" value="2"
							value="stock.checkResult" headerKey="" headerValue="全部"
							 label="检测状态">检查状态</s:select>
					</td>

					<td>
						<input type="button" value="查询" onclick="javascript:check();" />
					</td>
				</tr>

			</table>

			<p />
				<s:if test="stockInList.items.size()>0">
					<table id="stockInTable" bgcolor="black" cellpadding="0"
						cellspacing="1" width="90%" align="center">
						<tr>
							<th bgcolor="white">
								选择
							</th>
							<th bgcolor="white">
								入库申请编号
							</th>
							<th bgcolor="white">
								入库申请时间
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
								操作
							</th>
						</tr>
						<s:iterator value="stockInList.items" status="stat">
							<tr>
								<td align="center" bgcolor="white">
									<%=idtitle++%>
								</td>
								<td bgcolor="white">
									<s:property value="stockInCode"></s:property>
								</td>
								<td bgcolor="white">
									<s:property value="stockInDate"></s:property>
								</td>
								<td bgcolor="white">
									<s:if test="stockInCheckState == 0 ">未审核</s:if>
									<s:if test="stockInCheckState == 1 ">审核通过</s:if>
									<s:if test="stockInCheckState == -1 ">未通过</s:if>
								</td>
								<td bgcolor="white">
									<s:if test="checkResult == 0 ">未检查</s:if>
									<s:if test="checkResult == 1 ">检查通过</s:if>
									<s:if test="checkResult == -1 ">检查未通过</s:if>
								</td>
								<td bgcolor="white">
									<s:if test="stockInStateType == 1 ">完成</s:if>
									<s:if test="stockInStateType == 2 ">未完成</s:if>
									<s:if test="stockInStateType == 3 ">已入库</s:if>
								</td>
								<td bgcolor="white">

									<s:if
										test="stockInStateType==1 && stockInCheckState==1 && checkResult==0 ">
										<input type='button'
											onclick='window.location.href="goCheckStockIn.action?stock.stockInCode=<%=request.getAttribute("stockInCode")%>"'
											value="检查" />
									</s:if>

								</td>
							</tr>
						</s:iterator>
						<tr>
							<td colspan="7" align="right" bgcolor="white">
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