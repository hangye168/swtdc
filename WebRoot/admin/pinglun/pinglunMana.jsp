<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%
String path = request.getContextPath();
%>
<!-- 评论管理 -->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="pragma" content="no-cache" />
		<meta http-equiv="cache-control" content="no-cache" />
		<meta http-equiv="expires" content="0" />
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3" />
		<meta http-equiv="description" content="This is my page" />

		<link rel="stylesheet" type="text/css" href="<%=path %>/css/base.css" />
		
		<script language="JavaScript" src="<%=path %>/js/public.js" type="text/javascript"></script>
		
        
	</head>

	<body leftmargin="2" topmargin="2" background='<%=path %>/images/allbg.gif'>
			<table width="98%" border="0" cellpadding="2" cellspacing="1" bgcolor="#D1DDAA" align="center" style="margin-top:8px">
				<tr bgcolor="#E7E7E7">
					<td height="14" colspan="5" background="<%=path %>/images/tbg.gif">&nbsp;评论留言管理&nbsp;</td>
				</tr>
				<tr align="center" bgcolor="#FAFAF1" height="22">
					<td width="25%">菜品名称</td>
					<td width="15%">留言内容</td>
					<td width="15%">留言人</td>
					<td width="15%">留言时间</td>
					<td width="10%">操作</td>
		        </tr>	
				<s:iterator value="#request.pinglunList" id="pinglun">
				<tr align='center' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='red';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
					<td bgcolor="#FFFFFF" align="center">
						 <s:property value="#pinglun.gname"/>
					</td>
					<td bgcolor="#FFFFFF" align="center">
						<s:property value="#pinglun.plnr"/>
					</td>
					<td bgcolor="#FFFFFF" align="center">
						<s:property value="#pinglun.plr"/>
					</td>
					<td bgcolor="#FFFFFF" align="center">
						<s:property value="#pinglun.plsj"/>
					</td>
					<td bgcolor="#FFFFFF" align="center">
						<a class="pn-loperator" href="<%=path %>/pinglunDel.action?id=<s:property value="#pinglun.id"/>">删除</a>
					</td>
				</tr>
				</s:iterator>
			</table>
			
			 
	</body>
</html>
