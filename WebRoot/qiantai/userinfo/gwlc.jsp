<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!-- 订餐流程 -->
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
		
	

   <!--内容开始-->
	<div class="gowulc w1200">
    	<h2>订餐流程</h2>
        <div class="gwlc-kuai1">
        	<P class="p1"><span>一</span>先注册商洛学院餐厅服务系统账号（有账号的亲可直接点击登录）。</P>
        </div>
        <div class="gwlc-kuai1">
        	<P class="p1"><span>二</span>填写注册信息，点击提交。</P>
            <ul class="k1-box">
            	<li>
                	<p class="p1-1">* 用户名</p>
                	<p class="p2-1">（必填）</p>
                    <div style="clear:both;"></div>
                </li>
            	<li>
                	<p class="p1-1">* 密码</p>
                	<p class="p2-1">（必填）</p>
                    <div style="clear:both;"></div>
                </li>
            	<li>
                	<p class="p1-1">* 确认密码</p>
                	<p class="p2-1">（必填）</p>
                    <div style="clear:both;"></div>
                </li>
            	<li>
                	<p class="p1-1">* email</p>
                	<p class="p2-1"></p>
                    <div style="clear:both;"></div>
                </li>
            	<li>
                	<p class="p1-1">* 手机</p>
                	<p class="p2-1">（必填）</p>
                    <div style="clear:both;"></div>
                </li>
            	<li>
                	<p class="p3-1">我已看过并接受《用户协议》</p>
                </li>
            	<li>
                	<p class="p3-1">点击<span>《提交》</span></p>
                </li>
            </ul>
        </div>
        <div class="gwlc-kuai1">
        	<P class="p1"><span>三</span>注册完成后点击“查看我的个人信息”</P>
            <p class="p2">1 . 用户名qwert注册成功　　→　　返回上一页　　→　　点击<span>《查看我的个人信息》</span></p>
        </div>
        <div class="gwlc-kuai1">
        	<P class="p1"><span>四</span>添加收货地址</P>
            <p class="p2">1 . 点击<span>《收货地址》</span></p>
        </div>
        <div class="gwlc-kuai1">
        	<P class="p1"><span>五</span>收货地址填写好后点击“新增收货地址”</P>
            <p class="p2">地址列表</p>
            <p class="p2">操作提示：</p>
            <p class="p2">1.您可对已有的地址进行编辑及删除，亦可新增收货地址</p>
            <ul class="k1-box2">
            	<li>
                	<p class="p1-2">* 配送区域</p>
                	<p class="p2-2">商洛学院</p>
                    <div style="clear:both;"></div>
                </li>
            	<li>
                	<p class="p1-2">* 收货人姓名</p>
                	<p class="p2-2">（必填）</p>
                    <div style="clear:both;"></div>
                </li>
            	<li>
                	<p class="p1-2">* 详细地址</p>
                	<p class="p2-2">（必填）</p>
                    <div style="clear:both;"></div>
                </li>
            	<li>
                	<p class="p1-2">* 联系方式</p>
                	<p class="p2-2">（必填）</p>
                    <div style="clear:both;"></div>
                </li>
            	<li>
                	<p class="p1-2">标志建筑</p>
                	<p class="p2-2"></p>
                    <div style="clear:both;"></div>
                </li>
            	<li>
                	<p class="p1-2">* 电子邮件地址</p>
                	<p class="p2-2">（必填）</p>
                    <div style="clear:both;"></div>
                </li>
            	<li>
                	<p class="p1-2">* 手机号</p>
                	<p class="p2-2">（必填）</p>
                    <div style="clear:both;"></div>
                </li>
            	<li>
                	<p class="p1-2">* 最佳送货时间</p>
                	<p class="p2-2">（必填）</p>
                    <div style="clear:both;"></div>
                </li>
            </ul>
        </div>
        <div class="gwlc-kuai1">
        	<P class="p1"><span>六</span>点击“首页”</P>
            <p class="p2">全部菜品分类……<span>首页</span></p>
        </div>
        <div class="gwlc-kuai1">
        	<P class="p1"><span>七</span>在搜索和菜品分类栏找到需要的菜品</P>
            <p class="p2">1、选择<span>全部菜品分类</span>寻找需要的菜品</p>
            <p class="p2">2、选择<span>宝贝标题</span>或<span>餐厅标题</span>输入关键词搜索</p>
        </div>
        <div class="gwlc-kuai1">
        	<P class="p1"><span>八</span>点击“首页”</P>
        </div>
        <div class="gwlc-kuai1">
        	<P class="p1"><span>九</span>加入购物车</P>
            <p class="p2">点击<span>加入购物车</span></p>
        </div>
        <div class="gwlc-kuai1">
        	<P class="p1"><span>十</span>去购物车结算</P>
            <p class="p2">点击<span>去购物车结算</span></p>
        </div>
        <div class="gwlc-kuai1">
        	<P class="p1"><span>十一</span>点击去结算</P>
            <p class="p2">点击<span>去结算</span></p>
        </div>
        <div class="gwlc-kuai1">
        	<P class="p1"><span>十二</span>选择配送时间</P>
            <p class="p2">1、地址选择</p>
            <p class="p2">2、送货时间</p>
            <p class="p2">仅工作日送货  ， 仅周末送货   ，工作日/周末/假日均可，指定送货时间</p>
        </div>
        <div class="gwlc-kuai1">
        	<P class="p1"><span>十三</span>选择支付方式，点击确认订单</P>
            <p class="p2">1、货到付款（仅限商洛学院部门区域内，）</p>
            <p class="p2">2、<span>在线付款</span>（微信扫码支付，支付宝，余额支付）</p>
            <p class="p2">3、点击<span>确认订单</span></p>
        </div>
        <div class="gwlc-kuai1">
        	<P class="p1"><span>十四</span>点击用户中心</P>
            <p class="p2">点击<span>用户中心</span></p>
        </div>
        <div class="gwlc-kuai1">
        	<P class="p1"><span>十五</span>查看购买到的菜品</P>
            <p class="p2">点击<span>查看</span></p>
        </div>
        <div class="gwlc-kuai1">
        	<P class="p1"><span>十六</span>查看购买到的菜品</P>
            <p class="p2">点击<span>立即使用微信支付</span>，付款状态显示<span>支付宝收银台</span>，我的收银台栏出现<span>菜品价和二维码</span>直接进行扫码，手机不在身边点击<span><登录账户付款></span></p>
        </div>
        
    </div>
    
    
		
		<jsp:include flush="true" page="/qiantai/inc/incFoot.jsp"></jsp:include>
	  
	</body>
</html>
