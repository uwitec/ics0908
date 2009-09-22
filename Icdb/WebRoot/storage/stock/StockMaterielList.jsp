<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<% String base=request.getContextPath(); %>
    <head>
        <title>初期库存信息</title>
    </head>
    <SCRIPT type="text/javascript">
    	function addStock(){
    		var tab_dis=document.getElementById("inputValue");
    		tab_dis.style.display="block";
    	}
    	function showMateriel(){
		window.showModalDialog("<%=base%>/baseset/FindMateriel.action","","dialogHeight:400px;dialogWidth:650px");
		}
    </SCRIPT>
    <body>

	<s:push value="storehouse">
	所属仓库：<s:property value="storehouse.storehouseName"/><br/>
	仓库负责人:<s:property value="storehouse.personName"/>
	</s:push>
		<s:form action="AddStock">
		<table style="display:none" id="inputValue">
			<tr><td>
			<s:hidden id="materielCode" name="stock.materielCode"></s:hidden>
			<s:textfield id="materielName" name="stock.materielName" label="物料名称" onclick="showMateriel()"></s:textfield></td>
			<td>
			<s:select list="lcsb" listKey="cargoSpaceCode" listValue="cargoSpaceName" name="stock.cargoSpaceCode" label="库位"></s:select>
			</td></tr>
			<tr><td><s:textfield id="stockPrice" name="stock.stockPrice" label="单价"></s:textfield></td>
			<td><s:textfield name="stock.stockAmount" label="数量"></s:textfield></td></tr>
			<tr><td colspan="2"><s:submit value="确认"></s:submit></td></tr>
		</table>
		</s:form>
    <table border="1">
    	<tr>
    	<th>物料名称</th>
    	<th>库位名称</th>
    	<th>单价</th>
    	<th>数量</th>
    	</tr>
       <s:iterator value="lhp" status="stat">
       	<tr>
       	<td><s:property value="materielName"></s:property></td>
       	<td><s:property value="cargoSpaceName"></s:property></td>
       	<td><s:property value="stockPrice"></s:property></td>
       	<td><s:property value="stockAmount"></s:property></td>
        </tr>
       </s:iterator>
     </table>
     <input type="button" onclick="addStock()" value="录入初期库存">
     <input type="button" value="完成初期库存">
    </body>
</html>