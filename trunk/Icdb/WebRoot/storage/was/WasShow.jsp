<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html>
    <head>
        <title>报损单</title>
    </head>
<% 
String base=request.getContextPath();
%>  
    <script type="text/javascript" src="<%=base%>/javascript/innerText.js"></script>
     <SCRIPT type="text/javascript">
     
     
    	function addWas(){
    		var tab_dis=document.getElementById("addWas").style.display="block";
    		tab_dis.style.display="block";
    	}
    	
    
    	
    	function removeTable(){
    			tblObj = document.getElementById("addMaterTab"); 
			  var length= tblObj.rows.length ;      
			  for( var i=1; i<length; i++ ){
			      tblObj.deleteRow(1);    
			  } 
			
    	}
    	  
	  function getPrice(tab){
 		var a = document.getElementById("addMaterTab");
		var rownum = tab.parentNode.parentNode.rowIndex;
 		var stockInAmount = a.rows.item(rownum).cells.item(3).firstChild.value;
 		var stockPrice    = a.rows.item(rownum).cells.item(2).firstChild.value;
 		var maxAmount     = a.rows.item(rownum).cells.item(4).firstChild.value;
 	
	 		if(stockPrice !='' && stockInAmount != ''){
	 			a.rows.item(rownum).cells.item(5).innerHTML=stockPrice*stockInAmount;
	 		}else{
	 			a.rows.item(rownum).cells.item(3).firstChild.value=0;
	 		}
	 		getSumPrice();
 		}
 		
 		function getSumPrice(){
	  	var a = document.getElementById("addMaterTab");

	  	var sumPrice=0;
	  	for(var row = 1; row < a.rows.length; row++){
	  		var price = a.rows.item(row).cells.item(5).innerText;
	  		if(price != ''){
	  			sumPrice = parseFloat(sumPrice)+parseFloat(price);
	  		}
	  	}

	  	var sum = document.getElementById("sumTD");
	  	sum.innerHTML="总金额:"+sumPrice;
	  }
 		
 		
    	
    	function showMateriels(){
		var a = document.getElementById("addMaterTab");
		var materielIds ="";
	 	removeTable();
		for(var row = 1;  row < a.rows.length; row++){
			materielIds = materielIds + trim(a.rows.item(row).cells.item(1).innerHTML);
			if(row != a.rows.length-1){
			materielIds = materielIds + ","
			}
		}
	  	var materiels = window.showModalDialog("<%=base%>/storage/ShowMaterStore.action","","dialogHeight:400px;dialogWidth:500px");	
	  	if(!materiels){
	  		return;
	  	}
		var a = document.getElementById("addMaterTab");
 		for(var i = 0; i < materiels.length; i++){
 			var rownum = a.rows.length;
		  	var newTr = a.insertRow(rownum);
		  	newTr.id = "row"+rownum;
		  	
			var newTd1 = newTr.insertCell(0);
			var newTd2 = newTr.insertCell(1);
			var newTd3 = newTr.insertCell(2);
			var newTd4 = newTr.insertCell(3);
			var newTd5 = newTr.insertCell(4);
			var newTd6 = newTr.insertCell(5);
			var newTd7 = newTr.insertCell(6);
            
			newTd1.bgColor = "white";
			newTd2.bgColor = "white";
			newTd3.bgColor = "white";
			newTd4.bgColor = "white";
			newTd5.bgColor = "white";
			newTd6.bgColor = "white";
			newTd7.bgColor = "white";
			//设置列内容和属性
			newTd1.innerHTML ='<input type="text" name="materielCode" value="'+materiels[i].materielCode+'">';
			newTd2.innerHTML= '<input type="text" value="'+materiels[i].materielName+'">';
			newTd3.innerHTML= '<input type="text" name="stockPrice" value="'+materiels[i].stockPrice+'">';
			newTd4.innerHTML= '<input type="text" name="wasNumber" value="0" onchange="getPrice(this)">';
			newTd5.innerHTML= materiels[i].stockAmount||'';;
			newTd6.innerHTML= '';
			newTd7.innerHTML='<input type="text" name="wasCause" value="">'
 		}	
	  }	
    </SCRIPT>
    <body>
    <s:form theme="simple" action="AddWasTage" >
    <table id="addWas"  border="0">
    	<tr><td>报损单号<s:textfield name="wasTage.wasCode" readonly="true"></s:textfield></td></tr>
    	<tr><td>
    	报损单类型<s:select id="wasTypeM" list="wasTypeList" value="value" name="wasTage.wasType" key="key" >
    	</s:select></td></tr>
    	<tr><td>相关单据<s:textfield id="DocNum" name="wasTage.wasDoc" readonly="true"></s:textfield><input type="button" onclick="showMateriels()" value="添加物料"></td></tr>
    	<tr><td>
    	<Table border="1" id="addMaterTab">
    	<tr><td>物料编号</td><td>物料</td><td>单价</td><td>数量</td><td>报损最大值</td><td>报损总额</td><td>报损原因</td></tr>
    	</table>
    	<table border="1" width="100%">
    	<tr><td colspan="2" width="100%"  align="right" id="sumTD">总金额:0</td></tr>
    	<tr><td><input type="submit" value="确认"/><td><input type="button" value="清空物料" onclick="removeTable()"></td></tr>
    	</table>
    	</td></tr>
    </table>
    </s:form>
    <s:if test="lhp.size()!=0">
		 <table border="1">
	    	<tr>
	    	<th>报损单编号</th>
	    	<th>报损时间</th>
	    	<th>报损类型</th>
	    	<th>操作员</th>
	    	</tr>
	       <s:iterator value="lhp" status="stat">
	       	<tr>
	       	<td><s:property value="wasCode"></s:property></td>
	       	<td><s:property value="wasTime"></s:property></td>
	       	<td><s:iterator value="wasTypeList" status="inner">
	       			<s:if test="inner.wasType==stat.wasType">
	       				<s:property value="name"/>
	       			</s:if>
	       		</s:iterator>
	       	</td>
	       	<td><s:property value="personName"></s:property></td>
	        </tr>
	       </s:iterator>
	     </table>
	 </s:if>
	 <s:else>
	 	没有未完成的工作。
	 </s:else>
    </body>
</html>