<%@ page language="java" contentType="text/html; charset=GB18030"
	pageEncoding="GB18030"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%
    String base = request.getContextPath();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GB18030">
  <link href="<%=base%>/css/left_css.css" type="text/css" rel="stylesheet">
    <link href="<%=base%>/css/body_css.css" type="text/css" rel="stylesheet">
    <link href="<%=base%>/css/center_css.css" type="text/css" rel="stylesheet">
<title>�����б�</title>
</head>
<body topmargin="0" style="margin-top: 0px; padding-top: 0px">
<div class="body_div" style="border:1px solid green;top: 0px;height: 800px;"><jsp:include flush="true"
	page="/pagecom/head.jsp"></jsp:include>
	<div class="left_body">
<div class="left_menu">
<div class="left_menu_head">����</div>
<table class="left_menu_table" border="0">
    <tr height="40">
        <td class="left_menu_table_td"><s:url action="CheckStockList"
            id="ShowReportList"></s:url><s:a href="%{ShowReportList}">�鿴����</s:a></td>
    </tr>
    
</table>
</div>
</div>
<div class="center_body">
<div class="center_head_text">������Ϣ</div>
<div class="center_tools"> <input type="text" class="search_border" /><input type="image"
	src="<%=base%>/images/img09.gif" alt="��ѯ" /></div>
</div>
<div class="center_boder"><s:if test="csList.size>0">
	<table class="center_table">
		<tr class="table_head">
			<td>�̵��</td>
			<td>�ֿ���</td>
			<td>�̵�����</td>
			<td>������</td>
			<td>�������</td>
			<td>����״̬</td>
			<td>������</td>
			<td>����Ա</td>
			<td>����״̬</td>
			<td>�Ƿ���ڿ��</td>
		</tr>
		<s:iterator value="csList" status="stat">
			<tr
				<s:if test="#stat.even">
                    class="table_tr_odd"
                </s:if>
				<s:else>
                    class="table_tr__even"
                </s:else>
                >
				<td><s:url id="showReportList" action="ShowReportList">
					<s:param name="abcReportBean.oldCsCode" value="oldCsCode"></s:param>
					<s:param name="abcReportBean.csCode" value="csCode"></s:param>
					<s:param name="abcReportBean.beginDate" value="beginDate"></s:param>
					<s:param name="abcReportBean.endDate" value="csDate"></s:param>
				</s:url> <s:a href="%{showReportList}">
					<s:property value="csCode"></s:property>
				</s:a></td>
				<td><s:property value="storehouseCode"></s:property></td>
				<td><s:property value="csDate"></s:property></td>
				<td><s:property value="csApprove"></s:property></td>
				<td><s:property value="csApproveMessage"></s:property></td>
				<td><s:property value="csApproveState"></s:property></td>
				<td><s:property value="csCheckPerson"></s:property></td>
				<td><s:property value="csOptionor"></s:property></td>
				<td><s:property value="csState"></s:property></td>
				<td><s:property value="csStartStock"></s:property></td>
			</tr>
			<s:set name="oldCsCode" value="csCode"></s:set>
			<s:set name="beginDate" value="csDate"></s:set>
		</s:iterator>
	</table>
</s:if>
<div class="pages">��ҳ��Ϣ</div>
</div>
<div class="center_boder_foot"></div>
<jsp:include flush="true" page="/main/bottom_.jsp"></jsp:include></div>

</body>
</html>