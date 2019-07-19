<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="pragma" content="no-cache" />
		<meta http-equiv="cache-control" content="no-cache" />
		<meta http-equiv="expires" content="0" />
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3" />
		<meta http-equiv="description" content="This is my page" />
		
		<link rel="stylesheet" type="text/css"
			href="<%=path%>/qiantai/css/style.css" />
		<link rel="stylesheet" type="text/css"
			href="<%=path%>/qiantai/css/shopping-mall-index.css" />
		<script type="text/javascript" src="<%=path%>/qiantai/js/jquery.js"></script>
		<script type="text/javascript" src="<%=path%>/qiantai/js/zhonglin.js"></script>
	 >
		<script language="JavaScript" src="<%=path %>/js/public.js" type="text/javascript"></script>
		<script type="text/javascript">
            function back1()
	        {
	           window.history.go(-1);
	        }
        </script>
        
        <style type="text/css">
  h2 span{float:left; height:40px; line-height:40px; text-align:left;
   font-weight:bold; color:#666;padding-left: 10px;}
   
  .inputBg{
padding: 0 10px;
color: #666;
height: 35px;
/*margin: 10px 0;*/
border: 1px solid #dedede;
background: #f7f7f7 !important;}
 
        </style>
	</head>

	<body>
		<jsp:include flush="true" page="/qiantai/inc/incTop.jsp"></jsp:include>
		 
		 
		 
		<div class="blank"></div>
		<div class="block">
		 	<form action="<%=path %>/orderSubmit.action" name="f" method="post">
				<div class="flowBox">
					<h2>
						<span>收货人信息</span>
					</h2>
					<table width="99%" align="center" border="0" cellpadding="5"
						cellspacing="1" bgcolor="#dddddd">

						<tbody>
							<tr style="height: 45px;">
								<td bgcolor="#ffffff" align="center">
									收货人姓名:
								</td>
								<td bgcolor="#ffffff">
									<input name="consignee" type="text" class="inputBg"  
										id="consignee_0" value="<s:property value="#session.user.userRealname"/>">
									 
								</td>
								<td bgcolor="#ffffff"  align="center">
									送货地址:
								</td>
								<td bgcolor="#ffffff">
									<input name="odderSonghuodizhi" type="text" class="inputBg"
										id="address_0"  value="">
									 
								</td>
							</tr>

							<tr>
								<td bgcolor="#ffffff"  align="center">
									电话:
								</td>
								<td bgcolor="#ffffff">
									<input  name="userTel"  type="text" class="inputBg" id="tel_0"
										value="<s:property value="#session.user.userTel"/>">
								 
								</td>
								<td bgcolor="#ffffff"  align="center">
									付款方式:
								</td>
								<td bgcolor="#ffffff">
									<select name="odderFukuangfangshi" style="width:155px;">
					   		                               <option value="货到付款">货到付款</option>
					   		                               <option value="银行付款">银行付款</option>
					   		                             </select>
								</td>
		 
							<tr>
								<td colspan="4" align="center" bgcolor="#ffffff">
								<input type="image" src="<%=path%>/qiantai/images/tijiao.png"  onclick="javascript:document.f.submit();">
								<input type="hidden" name="step" value="done"/>
								 


								</td>
							</tr>
						</tbody>
					</table>
				</div>
			</form>




		</div>
		<div class="blank5"></div>

		<div class="blank"></div>
		 
		<jsp:include flush="true" page="/qiantai/inc/incFoot.jsp"></jsp:include>
	    
	</body>
</html>
