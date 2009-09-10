<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html>
    <head>
        <title>供应商信息</title>
    </head>
    <body>
    <s:form action="SelectSupplierDef">
    	<s:textfield name="supplier.s_value" label="内容"></s:textfield>
    	<s:hidden name="supplier.supplierCode"></s:hidden>
    	<s:submit value="查询"></s:submit>
    </s:form>
    <table border="1">
    <s:if test="lhp.size>0">
    	<tr>
    	<th>供应商编码</th>
    	<th>供应商名称</th>
    	<th>供应商地址</th>
    	<th>供应商电话</th>
    	<th>供应商传真</th>
    	<th>供应商邮编</th>
    	<th>税号</th>
    	<th>备注</th>
    	<th>联系人名称</th>
    	<th>银行帐号</th>
    	<th>所属银行</th>
    	<th>操作</th></tr>
    </s:if>
    <s:else>
    未找到相关数据！
    </s:else>
       <s:iterator value="lhp" status="stat">
       	<tr>
       	<td><s:property value="supplierCode"></s:property></td>
        <td><s:property value="supplierName"></s:property></td>
        <td><s:property value="supplierAddress"></s:property></td>
        <td><s:property value="supplierPhone"></s:property></td>
        <td><s:property value="supplierFax"></s:property></td>
        <td><s:property value="supplierZipCode"></s:property></td>
        <td><s:property value="supplierTaxFileNumber"></s:property></td>
        <td><s:property value="supplierRemark"></s:property></td>
        <td><s:property value="personName"></s:property></td>
        <td><s:property value="accountNumber"></s:property></td>
        <td><s:property value="bankName"></s:property></td>
        <td><s:url id="updateUrl" action="GetOneSupplier">
			<s:param name="supplier.supplierCode" value="supplierCode"></s:param>     
        	</s:url> 
        	<s:a href="%{updateUrl}">修改</s:a>
        </td>
        </tr>
       </s:iterator>
     </table>
     <s:a href="GoAddSupplier.action">添加</s:a>
    </body>
</html>