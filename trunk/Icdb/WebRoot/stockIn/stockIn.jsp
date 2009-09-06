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
		</script>
	</head>
	<%
		int idtitle = 1;
		String base = request.getContextPath();
	%>
	<script type="text/javascript" src="<%=base%>/javascript/innerText.js"></script>
	<body>
		<s:form id="searchForm" theme="simple" action="searchStockIn.action"
			namespace="/stockIn">

			<s:textfield name="stock.stockInCode">入库单编号</s:textfield>

			<s:textfield name="stock.stockInStartDate">开始时间</s:textfield>

			<s:textfield name="stock.stockInEndDate">结束时间</s:textfield>

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
			<s:select name="stock.stockInStateType" list="#{'1':'完成','2':'未完成'}"
				value="2" value="stock.stockInStateType" headerKey=""
				headerValue="全部">单据状态</s:select>
			<s:select name="stock.stockInCheckState"
				list="#{'0':'未审核','-1':'审核未通过'}" value="stock.stockInCheckState"
				label="审核状态" headerKey="-2" headerValue="全部">审核状态</s:select>
			<s:submit value="查询"></s:submit>

			<input type="button" value="新建入库申请单"
				onclick="window.location.href='goAddStockIn.action'" />


			<p />

				<s:if test="stockInList.items.size()>0">
					<table id="stockInTable" bgcolor="black" cellpadding="0"
						cellspacing="1" width="90%">
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
									<s:property value="stockInCheckState"></s:property>
								</td>
								<td bgcolor="white">
									<s:property value="stockInStateType"></s:property>
								</td>
								<td bgcolor="white">
									<s:if test="stockInStateType=2">
										<input type='button'
											onclick='window.location.href="goEditStockIn.action?stock.stockInCode=<%=request.getAttribute("stockInCode")%>"'
											value="编辑" />
									</s:if>
									<input type="button" onclick="javasctipt:deleteStockIn(this);" value="删除" />
								</td>
							</tr>
						</s:iterator>
						<tr>
							<td colspan="6" align="right" bgcolor="white">
								<s:if test="page.hasPrevious">
									<input type="button" onclick="previousPage();" value="上一页" />
								</s:if>
								<s:property value="page.currentPage" />
								/
								<s:property value="page.totalPage" />
								<input type="hidden" id="currentPage" name="page.currentPage"
									value="<%=((Page) request.getAttribute("page"))
									.getCurrentPage()%>" />
								<s:if test="page.hasNext">
									<input type="button" onclick="nextPage();" value="下一页" />
								</s:if>
								&nbsp; 每页
								<input type="text" size="4" name="page.pageSize"
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
		</s:form>
	</body>
</html>