<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
			String webpath = path + "/qiantai";
			String orderId = request.getParameter("orderId");
			 
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
		<script language="JavaScript" src="<%=path %>/js/public.js" type="text/javascript"></script>
		<script type="text/javascript">
          
    </script>
    
    
    <style type="text/css">
    
     /*页面留白*/
  .blank{height:8px; line-height:8px; clear:both; visibility:hidden;}
  .blank5{height:5px; line-height:5px;/* _margin:-3px 0;e c m o b a n*/ clear:both; visibility:hidden;}
  /*布局*/
  .AreaL{width:205px; float:left;overflow:hidden}
  .AreaR{width:980px; float:right; overflow:hidden}
  
  .AreaL h3{ }
.AreaL h3 span{  }
    /*用户中心*/
.userMenu a.curs{color: #5715C9;}
.userCenterBox{
	height:auto;
	border: 1px solid #ddd;
	border-top: 2px solid #999;
	background: #F7F7F7;
	overflow:hidden;
}
.tit_center{
border-bottom: 1px solid #ddd;
height: 40px;
line-height: 40px;
font-size: 16px;
font-weight: bold;
padding-left: 15px;
color: #000;	
}
.userMenu a{
	display:block;
	height: 40px;
	line-height: 40px;
	font-size: 14px;
	border-bottom: 1px solid #ddd;
	color:#444;
}
.userMenu a img{
	margin-left:10px;
	margin-right:3px;
}
.box_right{
	height:492px;
	border: 1px solid #ddd;
	border-top: 2px solid #999;
	background: #F7F7F7;
	overflow:hidden;	
}
.my_center{
	display:block;
	width:100%;
	font-size:14px;
	color:#444;
	height:30px;
	line-height:30px;
	padding:5px 0;
	border-bottom:1px dotted #999;
	text-align:left;
	font-size:20px;
	 margin-bottom:10px;
}
    
    
    </style>
	</head>

	<body>
		<jsp:include flush="true" page="/qiantai/inc/incTop.jsp"></jsp:include>
		
	

  <!--内容开始-->
    <div class="personal w1200">
   <div class="blank"></div>
<div class="block clearfix">
  
     <div class="payment-interface w1200">
    	<div class="pay-info">
        	<div class="info-tit">
            	<h3>选择银行</h3>
            </div>
            <ul class="pay-yh">
            	<li>
                	<input type="checkbox" value="" name="hobby"></input>
                    <img src="<%=webpath%>/images/jiangheng.gif" />
                	<div style="clear:both;"></div>
                </li>
                <li>
                	<input type="checkbox" value="" name="hobby"></input>
                    <img src="<%=webpath%>/images/jiangheng.gif" />
                	<div style="clear:both;"></div>
                </li>
                <li>
                	<input type="checkbox" value="" name="hobby"></input>
                    <img src="<%=webpath%>/images/jiangheng.gif" />
                	<div style="clear:both;"></div>
                </li>
                <li style="border-right:0; width:298px;">
                	<input type="checkbox" value="" name="hobby"></input>
                    <img src="<%=webpath%>/images/jiangheng.gif" />
                	<div style="clear:both;"></div>
                </li>
            	<li>
                	<input type="checkbox" value="" name="hobby"></input>
                    <img src="<%=webpath%>/images/jiangheng.gif" />
                	<div style="clear:both;"></div>
                </li>
                <li>
                	<input type="checkbox" value="" name="hobby"></input>
                    <img src="<%=webpath%>/images/jiangheng.gif" />
                	<div style="clear:both;"></div>
                </li>
                <li>
                	<input type="checkbox" value="" name="hobby"></input>
                    <img src="<%=webpath%>/images/jiangheng.gif" />
                	<div style="clear:both;"></div>
                </li>
                <li style="border-right:0; width:298px;">
                	<input type="checkbox" value="" name="hobby"></input>
                    <img src="<%=webpath%>/images/jiangheng.gif" />
                	<div style="clear:both;"></div>
                </li>
            	<li style="border-bottom:0;">
                	<input type="checkbox" value="" name="hobby"></input>
                    <img src="<%=webpath%>/images/jiangheng.gif" />
                	<div style="clear:both;"></div>
                </li>
                <li style="border-bottom:0;">
                	<input type="checkbox" value="" name="hobby"></input>
                    <img src="<%=webpath%>/images/jiangheng.gif" />
                	<div style="clear:both;"></div>
                </li>
                <li style="border-bottom:0;">
                	<input type="checkbox" value="" name="hobby"></input>
                    <img src="<%=webpath%>/images/jiangheng.gif" />
                	<div style="clear:both;"></div>
                </li>
                <li style="border-right:0;border-bottom:0; width:298px;">
                	<input type="checkbox" value="" name="hobby"></input>
                    <img src="<%=webpath%>/images/jiangheng.gif" />
                	<div style="clear:both;"></div>
                </li>
                <div style="clear:both;"></div>
            </ul>
        </div>
    	<div class="pay-info">
        	<div class="info-tit">
            	<h3>输入卡号</h3>
            </div>
            <div class="pay-kahao">
            	<input type="text" placeholder="请输入银行卡号或支付宝账号"/>
                <p>输入正确</p>
            </div>
        </div>
    	<div class="pay-info">
        	<div class="info-tit">
            	<h3>输入密码</h3>
            </div>
            <div class="pay-mima">
            	<p class="mima-p1">你在安全的环境中，请放心使用！</p>
                <div class="mima-ipt">
                	<p>支付宝或银行卡密码：</p>
                    <input type="text" style="border-left:1px solid #E5E5E5;" /><input type="text" /><input type="text" /><input type="text" /><input type="text" /><input type="text" />
                    <span>请输入6位数字支付密码</span>
                </div>
                
                <form action="<%=path%>/orderShouli.action" method="post">
                       <input type="hidden" name="orderId" value="<%=orderId%>"/>
                         <input type="hidden" name="state" value="2"/>
                      <input class="mima-btn" type="submit"   value="立即支付"/>
                </form>
               
              
            </div>
        </div>
    </div>
  
</div>

		<div class="blank"></div> 
		
		<jsp:include flush="true" page="/qiantai/inc/incFoot.jsp"></jsp:include>
	  
	</body>
</html>
