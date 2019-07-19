<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
	    <base target="_self"/>
		<meta http-equiv="pragma" content="no-cache" />
		<title>商洛学院餐厅服务系统</title>
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
		<script type="text/javascript">
	        
	        function login()
	        {
	           if(document.userLogin.userName.value=="")
	           {
	               alert("请输入用户名");
	               return;
	           }
	           if(document.userLogin.userPw.value=="")
	           {
	               alert("请输入密码");
	               return;
	           }
	           document.userLogin.submit();
	        }
	        
	</script>
	</head>
	<body>
				<div class="sign-logo w1200">
	<h1><a href="<%=path%>/index.action" title="商洛学院餐厅服务系统"><img src="<%=path%>/qiantai/images/logo.jpg" /></a></h1>
	 <a href="<%=path%>/index.action" style="position: absolute;left: 1194px;top: 142px;font-size:20px;">返回首页</a> 
</div>

	<div class="sign-con w1200" style="background-color: #00C36A;">
	<img src="<%=path%>/qiantai/images/logn-tu.gif" class="sign-contu f-l" />
	
	<form action="<%=path %>/userLogin.action" name="userLogin" method="post">
    <div class="sign-ipt f-l">
    	<p>用户名</p>
        <input type="text" name="userName"  placeholder="用户名" />
        <p>密码</p>
        <input type="password" placeholder="密码"  name="userPw"/><br />
        <input type="button"  onclick="login()" value="登录" class="slig-btn"/> <font color="red"><s:property value="#request.error"/></font>
        <p>没有账号？请<a href="<%=path%>/qiantai/userinfo/userReg.jsp">注册</a> </p>
    </div>
    </form>
    <div style="clear:both;"></div>
</div>
    <jsp:include flush="true" page="/qiantai/inc/incFoot.jsp"></jsp:include>
	</body>
</html>
