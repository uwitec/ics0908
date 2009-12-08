
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<title>物料列表</title>
		<script type='text/javascript'
			src='<%=request.getContextPath()%>/dwr/interface/StockInAction.js'></script>
		<script type='text/javascript'
			src='<%=request.getContextPath()%>/dwr/engine.js'></script>
		<script type='text/javascript'
			src='<%=request.getContextPath()%>/dwr/util.js'></script>
		<script  type='text/javascript'>
		
		function cargoSpace(cargoSpaceCode,cargoSpaceName){
			this.cargoSpaceCode = cargoSpaceCode;
			this.cargoSpaceName = cargoSpaceName;
		}
		 function sendTo()
		 {
		    var cargoSpaceTab = document.getElementsByName("c_checked");
		    var returnValue;
		    for(var i=0;i < cargoSpaceTab.length; i++){
		    	if(cargoSpaceTab[i].checked){
		    		var cargoSpaceCode = document.getElementById("cargoSpaceTable").rows.item(i+1).cells.item(1).innerText;
		    		var cargoSpaceName = document.getElementById("cargoSpaceTable").rows.item(i+1).cells.item(2).innerText;
		    		var _cargoSpace = new cargoSpace(cargoSpaceCode,cargoSpaceName);
		    		returnValue = _cargoSpace;		    	}
		    }
		    if(returnValue==null||returnValue==''){
		    	alert("请选择货位！");
		    	return;
		    }
		 	window.returnValue = returnValue
		 	window.close()
		 }
		function getCargoSpaceList(){
			var storehouseCode = document.getElementById("storehouseCode").options[document.getElementById("storehouseCode").selectedIndex].value;
			StockInAction.findCargoSpaceList(storehouseCode,callback);
		}

		function callback(data){
			DWRUtil.removeAllRows("cargoSpace");
			var table = document.getElementById("cargoSpace");
			for(var i=0; i < data.length; i++){
				var rownum = table.rows.length;
				var newTr = table.insertRow(rownum);

				var newTd0 = newTr.insertCell(0);
				var newTd1 = newTr.insertCell(1);
				var newTd2 = newTr.insertCell(2);
				var newTd3 = newTr.insertCell(3);
				var newTd4 = newTr.insertCell(4);

				newTd0.bgColor = "white";
				newTd1.bgColor = "white";
				newTd2.bgColor = "white";
				newTd3.bgColor = "white";
				newTd4.bgColor = "white";

				newTd0.innerHTML= '<input type="radio" name="c_checked" />';
				newTd1.innerHTML= data[i].cargoSpaceCode||'';
				newTd2.innerHTML= data[i].cargoSpaceName||'';
				newTd3.innerHTML= data[i].cargoSpaceAddress||'';
				newTd4.innerHTML = data[i].storehouseCode||'';
			}

		}
		</script>
	</head>

	<%
		String base = request.getContextPath();
	%>

	<body>
		<table>
			<s:form name="searchForm" action="showCargoSpace.action" theme="simple">
				<s:label>仓库编号</s:label>
				<s:select id="storehouseCode" name="storehouseCode" list="storehouseList" listKey="storehouseCode" listValue="storehouseName" headerKey="" headerValue="全部"></s:select>
				<input type="button" onclick="getCargoSpaceList();" value="查询" />
			</s:form>
		</table>
		<s:if test="cargoSpaceList.size()>0">
			<table id="cargoSpaceTable" cellpadding="0" cellspacing="1" bgcolor ="black">
				<tr>

					<td  bgcolor="white">
						选择
					</td>

					<th  bgcolor="white">
						货位编号
					</th>
					<th  bgcolor="white">
						货位名称
					</th>
					<th  bgcolor="white">
						货位地址
					</th>
					<th  bgcolor="white">
						货位编码
					</th>
				</tr>
				<tbody id="cargoSpace">
				<s:iterator value="cargoSpaceList" status="cargoSpace">
					<tr>

						<td align="center" bgcolor="white">
							<input type="radio" name="c_checked" />
						</td>

						<td  bgcolor="white">
							<s:property value="cargoSpaceCode" ></s:property>
						</td>
						<td  bgcolor="white">
							<s:property value="cargoSpaceName" ></s:property>
						</td>
						<td  bgcolor="white">
							<s:property value="cargoSpaceAddress"></s:property>
						</td>
						<td  bgcolor="white">
							<s:property value="storehouseCode"></s:property>
						</td>
					</tr>
				</s:iterator>
				</tbody>
				<tr>
					<td colspan="5"  bgcolor="white">
						<input type="button" onclick="sendTo();" value="确认" />
					</td>
				</tr>
			</table>
		</s:if>
		<s:elseif test="cargoSpaceList==null">
     	未找到你需要的数据！
    	 <input type="button" onclick="sendTo();" value="确认" />
		</s:elseif>
	</body>
</html>