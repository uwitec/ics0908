<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="com.mydomain.bean.storage.Page"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%
String base = request.getContextPath();
 %>
<html>
    <head>
        <title>出库管理</title>
	<link href="<%=base%>/css/left_css.css" type="text/css" rel="stylesheet">
    <link href="<%=base%>/css/body_css.css" type="text/css" rel="stylesheet">
    <link href="<%=base%>/css/center_css.css" type="text/css" rel="stylesheet">
    <link href="<%=base%>/css/sub.css" type="text/css" rel="stylesheet">
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
	</head>
<body>
<script type="text/javascript" src="<%=base%>/javascript/innerText.js"></script>
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
<body topmargin="0">
<s:form id="searchForm" theme="simple" action="searchApprovalStockOut.action" namespace="/stockOut">
	<div class="body_div">
	<div id="seachDIV" class="searche_DIV" style="display: none;height:150px;">
	<div align="right">
	<a href="#" onclick="closeDIV()"><img src="<%=base%>/images/quit.gif" alt="关闭" border="0"></a>
	</div>
			
						入库单号:<s:textfield cssClass="sub3_border" name="stock.stockOutCode" cssStyle="margin-top:5px;"/><br/>
						开始时间:<s:textfield cssClass="sub3_border" id="stock.stockOutStartDate" name="stock.stockOutStartDate" cssStyle="margin-top:5px;"/><br/>
						结束时间:<s:textfield cssClass="sub3_border" id="stock.stockOutEndDate" name="stock.stockOutEndDate" cssStyle="margin-top:5px;"/><br/>
					<script type="text/javascript">
                            Calendar.setup({
                                inputField : "stock.stockOutStartDate",
                                ifFormat   : "%Y-%m-%d",
                                align      : "Tl",
                   
                            });
                            Calendar.setup({
                                inputField : "stock.stockOutEndDate",
                                ifFormat   : "%Y-%m-%d",
                                align      : "Tl",
                             
                            });
                        </script>
						单据状态:<s:select cssClass="sub3_border" id="stockOutStateSelect" name="stock.stockOutStateType"
							list="#{'1':'完成','2':'未完成'}" value="2"
							value="stock.stockInStateType" headerKey="" headerValue="全部"/>
						<a href="#" onclick="javascript:check();"><img src="<%=base%>/images/img09.gif" border="0" style="margin-bottom:-4px;"></a><br/>
			
		</div>
		<jsp:include flush="true" page="/pagecom/head.jsp"></jsp:include>
		<jsp:include flush="true" page="/main/left_.jsp"></jsp:include>
		<div class="center_body">
			<div class="center_head_text">出库审核</div>
			<div class="center_tools">
				<a href="#" onclick="window.location.href='goAddStockOut.action'" class="a_top"><img src="<%=base%>/images/img06.gif" border="0" class="a_top">添加出库单</a>
				<a href="#" onclick="showSearch()">高级查询</a>
			</div>	
		</div>
		<div class="center_boder">
		<table class="center_table"  id="stockOutTable" cellspacing="1" cellpadding="0">
	    <s:if test="stockOutList.items.size>0">
	    	<tr class="table_head">
			    <th>申请单号</th>
				<th>申请时间</th>
				<th>审批状态</th>
				<th>检查状态</th>
				<th>完成状态</th>
				<th>是否出库</th>
				<th>操作</th>
	    	</tr>
	    </s:if>
	    <s:else>
	    	<tr>
	    	<td class="table_tr_no" colspan="4">
	    		没有未完成的工作
	    	</td>
	    	</tr>
	    </s:else>
	       <s:iterator value="stockOutList.items" status="stat">
	      	<tr 
	       		<s:if test="#stat.even">
	       			class="table_tr_odd"
		       	</s:if>
		       	<s:else>
	       			class="table_tr__even"
	       		</s:else>
	       	>
			<td>
				<s:property value="stockOutOrderCode"/>
			</td>
			<td>
				<s:property value="stockOutDate"/>
			</td>
			<td>
				<s:if test="stockOutCheckState == 0 ">未审核</s:if>
				<s:if test="stockOutCheckState == 1 ">审核通过</s:if>
				<s:if test="stockOutCheckState == -1 ">未通过</s:if>
			</td>
			<td>
				<s:if test="stockOutDealState == 0 ">未检查</s:if>
				<s:if test="stockOutDealState == 1 ">检查通过</s:if>
				<s:if test="stockOutDealState == -1 ">检查未通过</s:if>
			</td>
			<td>
				<s:if test="stockOutStateType == 1 ">完成</s:if>
				<s:elseif test="stockOutStateType == 3 ">已出库</s:elseif>
				<s:else>未完成</s:else>
			</td>
			<td>
				<s:if test="stockOutWithState == 1 ">已经出库</s:if>
				<s:else>未出库</s:else>
			</td>
			<td>
				<s:if test="stockOutStateType == 1 && stockOutCheckState==0">
				<a href="#" onclick='window.location.href="goApprovalStockOut.action?stock.stockOutOrderCode=<%=request.getAttribute("stockOutOrderCode")%>"'><img src="<%=base%>/images/img01.gif" border="0"></a>
				</s:if>
			</td>
		</tr>
		</s:iterator>
	     </table>
	     <div class="pages">
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
				<input type="hidden" id="currentPage" name="page.currentPage"
					value="<%=((Page) request.getAttribute("page"))
								.getCurrentPage()%>" />
		</div>
		</div>
		
		<div class="center_boder_foot"></div>
		<jsp:include flush="true" page="/main/bottom_.jsp"></jsp:include>
	</div>
		</s:form>
</body>
</html>