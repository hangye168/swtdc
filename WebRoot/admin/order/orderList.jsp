<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%
String path = request.getContextPath();
%>

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
        <script language="javascript">
           function orderDel(orderId)
           {
               if(confirm('您确定删除吗？'))
               {
                   window.location.href="<%=path %>/orderDelByAd.action?orderId="+orderId;
               }
           }
           
           function orderShouli(orderId)
           {
               if(confirm('您确定发货吗？'))
               {
                   window.location.href="<%=path %>/toPeisong.action?orderId="+orderId+"&state=2";
               }
           }
           
           
           function orderDetail(orderId)
           {
                 var url="<%=path %>/orderDetail.action?orderId="+orderId;
                 var n="";
                 var w="700px";
                 var h="700px";
                 var s="resizable:no;help:no;status:no;scroll:yes";
			     openWin(url,n,w,h,s);
           }
           
           function userXinxi(userId)
           {
                 var url="<%=path %>/userXinxi.action?userId="+userId;
                 var n="";
                 var w="300px";
                 var h="400px";
                 var s="resizable:no;help:no;status:no;scroll:yes";
			     openWin(url,n,w,h,s);
           }
           
            function psyinfo(userId)
           {
                 var url="<%=path %>/psyinfoDetail.action?id="+userId;
                 var n="";
                 var w="300px";
                 var h="400px";
                 var s="resizable:no;help:no;status:no;scroll:yes";
			     openWin(url,n,w,h,s);
           }
           
       </script>
	</head>

	<body leftmargin="2" topmargin="2" background='<%=path %>/images/allbg.gif'>
			<table width="98%" border="0" cellpadding="2" cellspacing="1" bgcolor="#D1DDAA" align="center" style="margin-top:8px">
				<tr bgcolor="#E7E7E7">
					<td height="14" colspan="7" background="<%=path %>/images/tbg.gif">&nbsp;送货单管理&nbsp;</td>
				</tr>
				<tr align="center" bgcolor="#FAFAF1" height="22">
				
					<td width="10%">订单编号</td>
					<td width="10%">金额</td>
					<td width="16%">下单日期</td>
					<td width="18%">送货地址</td>
					<td width="16%">联系人</td>
					<td width="10%">联系电话</td>
					<td width="8%">订单状态</td>
					 
		        </tr>	
				<s:iterator value="#request.orderList" id="order">
				<tr align='center' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='red';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
					 
					<td bgcolor="#FFFFFF" align="center">
						<s:property value="#order.orderBianhao"/>
					</td>
					 
					<td bgcolor="#FFFFFF" align="center">
					   ￥<s:property value="#order.orderJine"/>
					</td>
					<td bgcolor="#FFFFFF" align="center">
					   <s:property value="#order.orderDate"/>
					</td>
					<td bgcolor="#FFFFFF" align="center">
					   <s:property value="#order.odderSonghuodizhi"/>
					</td>
				 
					
						<td bgcolor="#FFFFFF" align="center">
					   <s:property value="#order.user.userRealname"/>
					</td>
					
						<td bgcolor="#FFFFFF" align="center">
					   <s:property value="#order.user.userTel"/>
					</td>
					
						<td bgcolor="#FFFFFF" align="center">
					   <s:property value="#order.orderZhuangtai"/>
					</td>
					 
				</tr>
				</s:iterator>
			</table>
	</body>
</html>
