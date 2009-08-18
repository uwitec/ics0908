<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
    <head>
        <title>欢迎</title>
    </head>
    <body>
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
   <a href="<s:url action="baseset/ShowStorehouse"/>">仓库信息</a>
    </body>
</html>