<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
    <head>
        <title>物料信息</title>
    </head>
    <base/>
<% 
String base=request.getContextPath();
%>
<script type="text/javascript" src="<%=base%>/javascript/innerText.js"></script>
<SCRIPT type="text/javascript">
	
		 function sendTo()
		 {
		    returnValue = getValue();
		 	window.returnValue = returnValue
		 	window.close()
		 }

		 function getValue(){
		 	var table = document.getElementById("mat_tab");
		 	var isChecked = document.getElementsByName("p_check");

			var materiels = new Array();

		 	for(var i=0; i<isChecked.length;i++){
		 		if(isChecked[i].checked){

		 			var materiel = new Materiel(table.rows.item(i+1).cells.item(1).innerHTML,table.rows.item(i+1).cells.item(2).innerHTML
		 											,table.rows.item(i+1).cells.item(3).innerHTML,table.rows.item(i+1).cells.item(4).innerHTML);

					materiels.push(materiel);
		 		}

			}
			window.opener.document.getElementById("DocNum").value=document.getElementById("storeId").value;
			return materiels;
		 }

		 function Materiel(materielCode,materielName,stockPrice,stockAmount){
		 	this.materielCode = materielCode;
		 	this.materielName = materielName;
		 	this.stockPrice = stockPrice;
		 	this.stockAmount = stockAmount;
		 }

</SCRIPT>
    <body>
    <table>
    <tr><td>
    <s:form action="ShowMaterStore">
    	<s:select id="storeId" list="lsb"  listKey="storehouseCode" listValue="storehouseName" name="stock.storehouseCode">
    	</s:select>
    	<s:submit value="查询"></s:submit>
    </s:form>
    </td></tr>
    </table>
    <s:if test="lhp!=null">
    <table border="1" id="mat_tab">
    	<tr>
    	<th>选择</th>
    	<th>物料编号</th>
    	<th>物料名称</th>
		<th>物料价格</th>
		<th>物料数量</th>
		</tr>
       <s:iterator value="lhp" status="stat">
       	<tr>
       	<td align="center"><input type="checkbox" name="p_check"/></td>
 		<td><s:property value="materielCode"></s:property></td>
		<td><s:property value="materielName"></s:property></td>
		<td><s:property value="stockPrice"></s:property></td>
		<td><s:property value="stockAmount"></s:property></td>
        </tr>
       </s:iterator>
       <tr><td>
       <input type="button" onclick="sendTo()" value="确认"/>
       </td></tr>
     </table>
     </s:if>
     <s:elseif test="lhp==null">
     	未找到你需要的数据！
     </s:elseif>
    </body>
</html>