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
    <body>
    <script type="text/javascript" src="<%=base%>/javascript/innerText.js"></script>
    <s:if test="lhp!=null">
		 <table border="1">
	    	<tr>
	    	<th>报损单编号</th>
	    	<th>报损时间</th>
	    	<th>报损类型</th>
	    	<th>操作员</th>
	    	</tr>
	       <s:iterator value="lhp" status="stat">
	       	<tr>
	       	<td>
		       	<s:url id="getOneUrl" action="GetOneWas">
				<s:param name="wasTage.wasCode" value="wasCode"></s:param>       
	        	</s:url> 
	       		<s:a href="%{getOneUrl}"><s:property value="wasCode"/></s:a>
	       	</td>
	       	<td><s:property value="wasTime"></s:property></td>
	       <td><s:iterator value="wasTypeList" status="inner">
	       			<s:if test="key==wasType">
	       				<s:property value="value"/>
	       			</s:if>
	       		</s:iterator>
	       	</td>
	       	<td><s:property value="personName"></s:property></td>
	        </tr>
	       </s:iterator>
	    <tr><td colspan="4">
	   <s:form action="ShowWasHistroy" namespace="/storage" theme="simple" name="pageform">
       <s:push value="wasTage">
       <s:hidden name="wasTage.s_value" value="%{wasTage.s_value}"></s:hidden>
       <s:hidden id="countsize" name="wasTage.countSize" value="%{wasTage.countSize}"></s:hidden>
        <input size="10" type="button" onclick="pageSet(0)" value="首页"/>
       <s:if test="wasTage.startSize-1<1">
       		<font color="gray">上一页</font>
       </s:if>
       <s:else>
      	   <input size="10" type="button" onclick="pageSet(-1)" value="上一页"/>
       </s:else>
       <s:if test="wasTage.startSize+1>wasTage.countSize">
       		<font color="gray">下一页</font>
       </s:if>
       <s:else>
      	 	<input size="10" type="button" onclick="pageSet(1)" value="下一页"/>
       </s:else>
       		<input size="10" type="button" onclick="pageSet(2)" value="末页"/>
        第<s:textfield id="size" size="2" name="wasTage.startSize"></s:textfield>页
       <font><s:property value="wasTage.startSize"/>/<s:property value="wasTage.countSize"/>页数</font>
	   </s:push> 
       </s:form>
       </td></tr>
	     </table>
	 
	 </s:if>
	 <s:else>
	 	没有未完成的工作。
	 </s:else>
    </body>
</html>