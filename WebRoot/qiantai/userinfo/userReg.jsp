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
		<script language="javascript">
  
		    function check1()
		    {
		    
		    
		      
		        if(document.form1.userName.value=="")
		        {
		            alert("请输入用户名");
		            return false;
		        }
		        if(document.form1.userPw.value=="")
		        {
		            alert("请输入密码");
		            return false;
		        }
		        if(document.form1.userPw.value!=document.form1.userPw1.value)
		        {
		            alert("两次密码不一致");
		            return false;
		        }
		        if(document.form1.userRealname.value=="")
		        {
		            alert("请输入姓名");
		            return false;
		        }
		        
		        document.form1.submit();
		    }
        </script>
       
       
	</head>
	<body >
	 
				<!--top 开始-->
    <div class="top">
    <div>
    	<div class="top-con w1200">
        	<a href = "<%=path%>/index.action" style="font-size:20px;"><p class="t-con-l f-l">欢迎来到商洛学院餐厅服务系统</p></a>
           <a href="<%=path%>/index.action" style="position: absolute;left: 1144px;top: 10px;font-size:20px;">返回首页</a> 
            <div style="clear:both;"></div>
        </div>
    </div>
    <div >

    <!--logo search 开始-->
    <div class="hd-info1 w1200">
    	
       
        <div style="clear:both;"></div>
    </div>
    
    <!--内容开始-->
    <form action="<%=path %>/userReg.action" name="form1" method="post">
    <div class="password-con registered">
       <img src="<%=path%>/qiantai/images/body.jpg" style="width: 1350px;height:850px;position:absolute;left:0px;top:44px;"/> 
      <div style="width: 445px;margin-left: 352px;position: absolute;left: 432px;top: 80px;">
      
    	<div class="psw" style="width: 445px;">
        	<p class="psw-p1">用户名</p>
            <input type="text"  name="userName" id="userName"  placeholder="用户名" />
            
        </div>
    	<div class="psw">
        	<p class="psw-p1">输入密码</p>
            <input type="password" name="userPw" placeholder="请输入密码" />
            
        </div>
    	<div class="psw">
        	<p class="psw-p1">确认密码</p>
            <input type="password"  name="userPw1"  placeholder="请再次确认密码" />
           
        </div>
    	 <div class="psw">
        	<p class="psw-p1">姓名</p>
            <input type="text"  name="userRealname"  placeholder="姓名" />
            
        </div>
         <div class="psw">
        	<p class="psw-p1">地址</p>
            <input type="text"  name="userAddress"  placeholder="地址" />
            
        </div>
          <div class="psw">
        	<p class="psw-p1">联系方式</p>
            <input type="text"  name="userTel"  placeholder="联系方式" />
            
        </div>
         <div class="psw">
        	<p class="psw-p1">E-mail</p>
            <input type="text"  name="userEmail"  placeholder="E-mail" />
            
        </div>
          <div class="psw">
        	<p class="psw-p1">QQ</p>
            <input type="text"  name="userQq"  placeholder="QQ" />
            
        </div>
        <input type="button"  onclick="check1();" class="psw-btn" value="立即注册"/>
        <p class="sign-in">已有账号？请<a href="<%=path%>/qiantai/userlogin/userlogin.jsp">登录</a></p>
    </div>
    </div>
    </div> 
    </form>
    <div style="position: absolute; left: 83px; top: 703px;">
       <jsp:include flush="true" page="/qiantai/inc/incFoot.jsp"></jsp:include>
  </div>
	</body>
</html>
