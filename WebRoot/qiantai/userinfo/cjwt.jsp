<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!-- 常见问题 -->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="pragma" content="no-cache" />
		<title>商洛学院餐厅服务系统</title>
		<meta http-equiv="cache-control" content="no-cache" />
		<meta http-equiv="expires" content="0" />
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3" />
		<meta http-equiv="description" content="This is my page" />
				<link rel="stylesheet" type="text/css"
			href="<%=path%>/qiantai/css/style.css" />
			
			  <link rel="stylesheet" type="text/css" href="<%=path%>/qiantai/css/zhongling2.css" />
		<link rel="stylesheet" type="text/css"
			href="<%=path%>/qiantai/css/shopping-mall-index.css" />
		<script language="JavaScript" src="<%=path %>/js/public.js" type="text/javascript"></script>
	 
    
    
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
		
	

  <div class="changjian w1200">
    	<h2>购物常见问题</h2>
        <div class="cj-kuai1">
        	<p class="p1">Q：登录商洛学院餐厅服务系统总是无法链接，这是怎么回事？ </p>
        	<p class="p2">A：请您先刷新一下；或者检查一下网络是否正常，能否登录其它网站，如果以上两种方式都无效，还有一种情况是网页正在更新，可能会影响您的浏览，还望能谅解。 </p>
        </div>
        <div class="cj-kuai1">
        	<p class="p1">Q：网站上面显示菜品已售完请问什么时候可以在到货？ </p>
        	<p class="p2">A： 一般补货时间是1-3个工作日，具体还是以网站信息为准。</p>
        </div>
        <div class="cj-kuai1">
        	<p class="p1">Q：此类菜品的规格是什么？性能怎样？ </p>
        	<p class="p2">A： 具体菜品规格参数及性能问题请您关注菜品页面信息，也可以联系商洛学院餐厅服务系统客服电话咨询，或者在菜品页面下方发表菜品咨询，会有专业人员为您解答！ </p>
        </div>
        <div class="cj-kuai1">
        	<p class="p1">Q：如何取消订单？ </p>
        	<p class="p2">A： 您可以进入;我的信息;我的订单;自行操作订单取消或致电客服中心由客服为您取消订单；如订单已进入配送环节不确保能够拦截成功，配送上门时还请您拒收，感谢您的配合。
</p>
        </div>
        
        <p class="cj-kuai2">支付类常见问题<span>>></span></p>
        
        <div class="cj-kuai1">
        	<p class="p1">Q：我通过网上支付了，为什么订单显示未到款？ </p>
        	<p class="p2">A： 请您先查看您的网上银行交易记录（您可以电话联系银行客服、或是通过ATM、银行柜台、登陆个人网上银行等方式查询），确认款项是否成功划出：</p>
            <p class="p2">● 若款项未成功划出，请您在"我的信息;我的订单"中找到该订单重新支付即可</p>
            <p class="p2">● 若款项已成功划出，请您联系商洛学院餐厅服务系统客服处理</p>
        </div>
        <div class="cj-kuai1">
        	<p class="p1">Q：为什么我的订单不能选择货到付款？</p>
        	<p class="p2">A： 以下几种情况不支持货到付款的：</p>
            <p class="p2">（1）部分菜品属于第三方卖家发货的菜品，不支持货到付款；</p>
            <p class="p2">（2）您所在地区不在货到付款配送范围配送类常见问题。</p>
        </div>
        <div class="cj-kuai1">
        	<p class="p1">Q：网站上面显示菜品已售完请问什么时候可以在到货？ </p>
        	<p class="p2">A： 一般补货时间是1-3个工作日，具体还是以网站信息为准。</p>
        </div>
        <div class="cj-kuai1">
        	<p class="p1">Q：此类菜品的规格是什么？性能怎样？ </p>
        	<p class="p2">A： 具体菜品规格参数及性能问题请您关注菜品页面信息，也可以联系商洛学院餐厅服务系统客服电话咨询，或者在菜品页面下方发表菜品咨询，会有专业人员为您解答！ </p>
        </div>
        
    </div>
    
    
		
		<jsp:include flush="true" page="/qiantai/inc/incFoot.jsp"></jsp:include>
	  
	</body>
</html>
