<%@ page contentType="text/html; charset=UTF-8"%>
<%@page import="com.mydomain.bean.storage.Page"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%
	String base = request.getContextPath();
%>
<html>
	<head>
		<title>入库检查</title>
		<link href="<%=base%>/css/left_css.css" type="text/css"
			rel="stylesheet">
		<link href="<%=base%>/css/body_css.css" type="text/css"
			rel="stylesheet">
		<link href="<%=base%>/css/center_css.css" type="text/css"
			rel="stylesheet">
		<link href="<%=base%>/css/form_css.css" type="text/css" rel="stylesheet">
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7" />
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
		<script type="text/javascript" src="<%=base%>/javascript/WebCalendar.js"></script>
		
		<script type="text/javascript">
				function showSearch(){
					document.getElementById("seachDIV").style.display="block";
				}
				function closeDIV(){
					document.getElementById("seachDIV").style.display="none";
				}
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
function nextPage(){
				var tag = document.getElementById("currentPage");
				var currentPage = parseInt(tag.value) + 1;
				tag.value=currentPage;
				document.getElementById("searchForm").submit();
			}

			function goPage(){
				var toPageTab = document.getElementById("toPage");
				var toPage = toPageTab.value;
				if(!isNumber(toPage)){
					alert("请输入数字！");
					toPageTab.focus();
					return;
				}
				var tag = document.getElementById("currentPage");
				tag.value = toPage;
				document.getElementById("searchForm").submit();
			}

			function goFirstPage(){
				var tag = document.getElementById("currentPage");
				tag.value = 1;
				document.getElementById("searchForm").submit();
			}

			function goFinalPage(){

				var tag = document.getElementById("currentPage");
				var totalPage = "<%=((Page) request.getAttribute("page")).getTotalPage()%>";
				tag.value = totalPage;
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
	%>
	<script type="text/javascript" src="<%=base%>/javascript/innerText.js"></script>
	<body>
		<s:form id="searchForm" theme="simple"
			action="searchCheckStockIn.action" namespace="/stockIn">
			<div class="body_div">
				<div id="seachDIV" class="searche_DIV" style="display: none">
<table width="100%" border="0" cellpadding="0" cellspacing="0">
	<tr>
		<td style="background:url(<%=base%>/images/menu_top_left.gif);" width="88" height="35">&nbsp;</td>
		<td style="background:url(<%=base%>/images/menu_top_con.jpg); background-repeat:repeat-x;color:#E0F2F9;font-size:13px;font-weight:bold;">信息查询</td>
		<td style="background:url(<%=base%>/images/menu_top_con.jpg); background-repeat:repeat-x;color:#E0F2F9;font-size:13px;font-weight:bold;" align="right">
		<a href="#" onclick="closeDIV()" ><img src="<%=base%>/images/quit.gif" alt="关闭" border="0"></a>
		</td>
		<td style="background:url(<%=base%>/images/menu_top_right.gif);" width="8" height="35" align="left">
		</td>
	</tr>
</table>
<table width="100%" border="0" cellpadding="0" cellspacing="0" style='background-color:#E2F3FB;border-left:#0C6A9D 1 solid;border-right:#0C6A9D 1px solid;'>
	<tr style="margin-top: 5px;"><td align="right" style="font-size:12px;color:#636B6D;"></td>
		<td style="font-size:12px;color:#636B6D;">
			&nbsp;&nbsp;&nbsp;&nbsp;入库单号:<s:textfield cssClass="sub3_border" name="stock.stockInCode" cssStyle="margin-top:5px;"/><br/>	
		</td>
	</tr>
	<tr style="margin-top: 5px;"><td align="right" style="font-size:12px;color:#636B6D;"></td>
		<td style="font-size:12px;color:#636B6D;">
		&nbsp;&nbsp;&nbsp;&nbsp;开始时间:<s:textfield cssClass="sub3_border" onclick="SelectDate(this,'yyyy-MM-dd')" id="stock.stockInStartDate" name="stock.stockInStartDate" readonly="true" cssStyle="margin-top:5px;"/>
		</td>
	</tr>
	<tr style="margin-top: 5px;"><td align="right" style="font-size:12px;color:#636B6D;"></td>
		<td style="font-size:12px;color:#636B6D;">
		&nbsp;&nbsp;&nbsp;&nbsp;结束时间:<s:textfield cssClass="sub3_border" onclick="SelectDate(this,'yyyy-MM-dd')" id="stock.stockInEndDate" name="stock.stockInEndDate" readonly="true" cssStyle="margin-top:5px;"/>
		</td>
	</tr>
	<tr style="margin-top: 8px;"><td align="right" style="font-size:12px;color:#636B6D;"></td>
		<td style="font-size:12px;color:#636B6D;">
		&nbsp;&nbsp;&nbsp;&nbsp;单据状态:<s:select id="stockInStateSelect" cssClass="sub3_border"
						name="stock.stockInStateType"
						list="#{'1':'完成','2':'未完成'}"
						value="stock.stockInStateType" headerKey="" headerValue="全部"
						label="单据状态"></s:select>
					<a href="#" onclick="javascript:check();"><img
							src="<%=base%>/images/img09.gif" border="0"
							style="margin-bottom: -4px;" alt="查询" title="查询"> </a>
		</td>
	</tr>
</table>
<table width="100%" border="0" cellpadding="0" cellspacing="0">
	<tr>
		<td style="background:url(<%=base%>/images/menu_bottom_left.jpg);background-repeat:no-repeat;" width="13" height="13">&nbsp;</td>
		<td style="background:url(<%=base%>/images/menu_bottom_con.jpg); background-repeat:repeat-x; text-align:center;">&nbsp;</td>
		<td style="background:url(<%=base%>/images/menu_bottom_con.jpg); background-repeat:repeat-x; text-align:center;">&nbsp;</td>
		<td style="background:url(<%=base%>/images/menu_bottom_right.jpg);background-repeat:no-repeat;" width="13" height="13">&nbsp;</td>
	</tr>
</table>
</div>
					<jsp:include flush="true" page="/pagecom/head.jsp"></jsp:include>
					<div class="left_body">
					<jsp:include flush="true" page="/main/left_.jsp"></jsp:include>
					<div class="center_body">
						<div class="center_head_text">
							入库检查
						</div>
						<div class="center_tools">
							<a href="#" onclick="showSearch()">高级查询</a>
						</div>
					</div>

					<div class="center_boder">
						<table id="stockInTable" class="center_table" cellpadding="0"
							cellspacing="1">
							<s:if test="stockInList.items.size()>0">
								<tr>
									<th  class="table_head">
										选择
									</th>
									<th class="table_head">
										入库申请编号
									</th>
									<th class="table_head">
										入库申请时间
									</th>
									<th class="table_head">
										审批状态
									</th>
									<th class="table_head">
										检查状态
									</th>
									<th class="table_head">
										完成状态
									</th>
									<th class="table_head">
										操作
									</th>
								</tr>
							</s:if>
							<s:else>
								<tr>
									<td class="table_tr_no" colspan="4">
										没有未完成的工作
									</td>
								</tr>
							</s:else>
							<s:iterator value="stockInList.items" status="stat">
								<tr
									<s:if test="#stat.even">
					       			class="table_tr_odd"
						       	</s:if>
									<s:else>
					       			class="table_tr__even"
					       		</s:else>>
									<td align="center">
										<%=idtitle++%>
									</td>
									<td>
										<s:property value="stockInCode"></s:property>
									</td>
									<td>
										<s:property value="stockInDate"></s:property>
									</td>
									<td>
										<s:if test="stockInCheckState == 0 ">未审核</s:if>
										<s:if test="stockInCheckState == 1 ">审核通过</s:if>
										<s:if test="stockInCheckState == -1 ">未通过</s:if>
									</td>
									<td>
										<s:if test="checkResult == 0 ">未检查</s:if>
										<s:if test="checkResult == 1 ">检查通过</s:if>
										<s:if test="checkResult == -1 ">检查未通过</s:if>
									</td>
									<td>
										<s:if test="stockInStateType == 1 ">完成</s:if>
										<s:if test="stockInStateType == 2 ">未完成</s:if>
										<s:if test="stockInStateType == 3 ">已入库</s:if>
									</td>
									<td>

										<s:if
											test="stockInStateType==1 && stockInCheckState==1 && checkResult==0 ">
												<a href="#" onclick='window.location.href="goCheckStockIn.action?stock.stockInCode=<%=request.getAttribute("stockInCode")%>"'><img src="<%=base%>/images/img01.gif" title="检查" alt="检查" border="0"></a>
										</s:if>

									</td>
								</tr>
							</s:iterator>
						</table>
						<div class="pages">
							<input type="image"  class="img_size" src="<%=base%>/images/btn_first.gif" title="首页" alt="首页"  onclick="goFirstPage();"/>
						<s:if test="page.hasPrevious">
							<input class="img_size" type="image"
								src="<%=base%>/images/btn1_pre.gif" title="上一页" alt="上一页" onclick="previousPage();" />
						</s:if>
						<s:else>
							<font color="gray">上一页</font>
						</s:else>
						<s:property value="page.currentPage" />
						/
						<s:property id="totalPage" value="page.totalPage" />


						<s:if test="page.hasNext">
							<input type="image" class="img_size"
								src="<%=base%>/images/btn_next.gif" title="下一页" alt="下一页" onclick="nextPage();" />
						</s:if>
						<s:else>
							<font color="gray">下一页</font>
						</s:else>
						<input type="image" class="img_size" align="bottom"
							src="<%=base%>/images/btn1_end.gif" title="末页" alt="末页"  onclick="goFinalPage();" />
						<font color="gray">跳转到：<input type="text" size="2"
								id="toPage" name="toPage" value="<%=((Page)request.getAttribute("page")).getCurrentPage()%>" cssClass="pages_border" onblur="goPage();" />页</font>
						<!--
								 &nbsp; 每页
						<input type="text" size="4" id="pageSize" name="page.pageSize"
							value="<%=((Page) request.getAttribute("page")).getPageSize()%>"
							onchange="pageSizeChange();" />
						条 &nbsp;总共
						<s:property value="page.totalRowsAmount" />
						条记录-->
						<input type="hidden" id="currentPage" name="page.currentPage"
							value="<%=((Page) request.getAttribute("page"))
								.getCurrentPage()%>" />
						 
						</div>
					</div>
					<div class="center_boder_foot"></div>
					<jsp:include flush="true" page="/main/bottom_.jsp"></jsp:include>
					</div>
				</div>
		</s:form>
	</body>
</html>