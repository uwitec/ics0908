<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html>
    <head>
        <title>岗位信息维护</title>
    </head>
    <body>
    <s:push value="job">
      <s:form action="UpdateJob" namespace="/baseset">
	  <s:textfield name="job.jobCode" value="%{jobCode}" label="岗位编号" readonly="true"></s:textfield>
	  <s:textfield name="job.jobName" value="%{jobName}" label="岗位名称"></s:textfield>
	  <s:select list="ldb" listKey="departmentCode" listValue="departmentName" name="job.departmentCode" label="所属机构"></s:select>
	  <s:submit value="修改"></s:submit>
     </s:form>
     </s:push>
    </body>
</html>