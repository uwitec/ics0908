<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
    <head>
        <title>初期库存信息</title>
    </head>
    <body>
  	<SCRIPT type="text/javascript">
  	function createTable(){
  		var num=document.getElementById("rowcount").value;
  		var allValue="";
  		for(var i=0;i<num;i++){
  			allValue+="<tr><td><input type='text' name='stock.materielName["+i+"]'/>";
  			allValue+="<input type='hidden' name='stock.matereilCode["+i+"]'/></td>";
  			allValue+="<td><input type='text' name='stock.cargoSpaceName["+i+"]'/>";
  			allValue+="<input type='hidden' name='stock.cargoSpaceCode["+i+"]'/></td>";
  			allValue+="<td><input type='text' name='stock.stockPrice["+i+"]'/></td>";
			allValue+="<td><input type='text' name='stock.stockAmount["+i+"]'/></td></tr>";
  		}
  		document.getElementById("inputTable").innerHTML=allValue;
  	}
  	
  	</SCRIPT>
	需要添加的物料数：<input type="text" id="rowcount" value="1"/>
	<input type="button" onclick="createTable()" value="生成">
    <table border="1">
    	<tr>
    	<th>物料名称</th>
    	<th>库位名称</th>
    	<th>单价</th>
    	<th>数量</th>
    	</tr>
         <s:div id="inputTable">
         </s:div>
     </table>
    </body>
</html>