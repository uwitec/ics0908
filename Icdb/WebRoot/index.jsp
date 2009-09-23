<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
    <head>
        <title>欢迎</title>
    </head>
    <body>
  --------------------基本信息-------------------------------<br/>
     <a href="<s:url action="baseset/ShowBank"/>">银行</a><br/>
     <a href="<s:url action="baseset/ShowStruct"/>">机构</a><br/>
     <a href="<s:url action="baseset/ShowUnitType"/>">类型信息</a><br/>
     <a href="<s:url action="baseset/ShowPerson"/>">人员信息</a><br/>
     <a href="<s:url action="baseset/ShowDepartment"/>">部门信息</a><br/>
     <a href="<s:url action="baseset/ShowUnit"/>">计量单位信息</a><br/>
     <a href="<s:url action="baseset/ShowJob"/>">岗位信息</a><br/>
    <a href="<s:url action="baseset/ShowAccount"/>">帐号信息</a><br/>
    <a href="<s:url action="baseset/ShowSupplier"/>">供应商信息</a><br/>
   <a href="<s:url action="baseset/ShowEmployee"/>">员工信息</a><br/>


   <a href="<s:url action="baseset/ShowStorehouse"/>">仓库信息</a><br/>
   <a href="<s:url action="baseset/ShowMateriel"/>">物料信息</a><br/>
   -------------------库存业务---------------------------------<br/>
   <a href="<s:url action="storage/ShowStockList"/>">初期库存</a><br/>
   <a href="<s:url action="storage/ShowCheck"/>">盘点</a><br/>
   <a href="<s:url action="storage/ShowWas"/>">物料报损</a><br/>
   <a href="<s:url action="storage/ShowWasHistroy"/>">物料历史清单</a><br/>
   <a href="<s:url action="storage/ShowCheckApprove"/>">盘点审批</a>
   <a href="<s:url action="stockIn/searchStockIn"/>">入库管理</a><br/>
   <a href="<s:url action="stockOut/searchStockOut"/>">出库管理</a><br/>
   -------------------库存管理---------------------------------<br/>
   
 	<a href="<s:url action="stockmanage/ShowMax"/>">呆滞物料</a><br/>
 	<a href="<s:url action="stockmanage/ShowMin"/>">物料不足</a><br/>
    </body>
</html>