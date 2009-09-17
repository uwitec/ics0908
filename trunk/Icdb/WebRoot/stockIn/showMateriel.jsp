
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<title>物料列表</title>
		<script  type='text/javascript'>
		 function sendTo()
		 {
		    returnValue = getValue();
		 	window.returnValue = returnValue
		 	window.close()
		 }

		 function getValue(){
		 	var table = document.getElementById("materielTable");
		 	var isChecked = document.getElementsByName("m_checked");

			var materiels = new Array();

		 	for(var i=0; i<isChecked.length;i++){
		 		if(isChecked[i].checked){

		 			var materiel = new Materiel(table.rows.item(i+1).cells.item(1).innerHTML,table.rows.item(i+1).cells.item(2).innerHTML
		 											,table.rows.item(i+1).cells.item(3).innerHTML,table.rows.item(i+1).cells.item(4).innerHTML);

					materiels.push(materiel);
		 		}

			}

			return materiels;
		 }

		 function Materiel(materielCode,materielName,materielSize,materielABC){
		 	this.materielCode = materielCode;
		 	this.materielName = materielName;
		 	this.materielSize = materielSize;
		 	this.materielABC = materielABC;
		 }
		</script>
	</head>

	<%
		String base = request.getContextPath();
	%>

	<body>

		<s:if test="materielList.size()>0">
			<table border="1" id="materielTable" bgcolor ="black">
				<tr>
					<td  bgcolor="white">
						选择
					</td>
					<th  bgcolor="white">
						编号
					</th>
					<th  bgcolor="white">
						品名
					</th>
					<th  bgcolor="white">
						规格
					</th>
					<th  bgcolor="white">
						单位
					</th>
				</tr>
				<tbody id="materielTbody">
				<s:iterator value="materielList" status="materiel">
					<tr>
						<td align="center" bgcolor="white">
							<input type="checkbox" name="m_checked" />
						</td>
						<td  bgcolor="white">
							<s:property value="materielCode" ></s:property>
						</td>
						<td  bgcolor="white">
							<s:property value="materielName"></s:property>
						</td>
						<td  bgcolor="white">
							<s:property value="materielSize"></s:property>
						</td>
						<td  bgcolor="white">
							<s:property value="materielABC"></s:property>
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
		<s:elseif test="lhp==null">
     	未找到你需要的数据！
    	 <input type="button" onclick="sendTo();" value="确认" />
		</s:elseif>
	</body>
</html>