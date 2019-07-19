<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
  
	<script type="text/javascript" src="<%=path%>/qiantai/js/jquery.js"></script>
		<script type="text/javascript" src="<%=path%>/qiantai/js/zhonglin.js"></script>
      <script type="text/javascript">
	        function myXinxi()
	        {
	            <s:if test="#session.user==null">
	                  alert("请先登录");
	            </s:if>
	            
	            <s:else>
	                var url="<%=path %>/qiantai/userinfo/userXinxi.jsp";
	                var n="";
	                var w="480px";
	                var h="500px";
	                var s="resizable:no;help:no;status:no;scroll:yes";
				    openWin(url,n,w,h,s);
	            </s:else>
	        }
	        function myCart()
	        {
	            <s:if test="#session.user==null">
	                  alert("请先登录");
	            </s:if>
	            
	            <s:else>
	                 var s="<%=path %>/myCart.action";
	                 window.location.href=s;
	            </s:else>
	        }
	        
	        function myOrder()
	        {
	            <s:if test="#session.user==null">
	                  alert("请先登录");
	            </s:if>
	            
	            <s:else>
	                 var s="<%=path %>/myOrder.action";
	                 window.location.href=s;
	            </s:else>
	        }
	        
	       function selectSearch(searchid){
	        
	              document.getElementById("searchid").value = searchid;
	        }
      </script>
     
  </head>
  
  <body>
  
 <!--top 开始-->
    <div class="top">
    	<div class="top-con w1200">
        	    <p class="t-con-l f-l">
        	    您好，欢迎来到商洛学院餐厅服务系统
                 
        	                  </p>    	 
            <s:if test="#session.user!=null">
				<ul class="t-con-r f-r">
            	<li><a href="<%=path %>/qiantai/userinfo/userXinxi.jsp">${sessionScope.user.userRealname}</a></li>
            	<li><a href="<%=path %>/myCart.action">我的购物车</a></li>
            	<li><a href="<%=path%>/myOrder.action">我的订单</a></li>
            	<li><a href="<%=path%>/index.action">返回首页</a></li>
            	</ul>
            	 </s:if>
            	 
            	  <s:if test="#session.user==null">
				
            	 </s:if>
            <div style="clear:both;"></div>
        </div>
    </div>
    
    <!--logo search 开始-->
    <div class="hd-info1 w1200">
    	<div class="logo f-l">
        	<h1><a href="<%=path%>/index.action" ><img src="<%=path %>/qiantai/images/logo.jpg" /></a></h1>
        </div>
        <div class="search f-r">
        	<ul class="sp">
                   <li class="current" ss-search="sp">
						<a href="JavaScript:selectSearch(1);">菜品</a>
					</li>
					<li ss-search="dp">
						<a href="JavaScript:selectSearch(2);">餐厅</a>
					</li>
                <div style="clear:both;"></div>
            </ul>
            
              <form action="<%=path%>/goodSearch.action" method="post">
                <input type="hidden" name="searchid" id="searchid" value="1"  />
            <div class="srh">
            	<div class="ipt f-l">
                	<input type="text" name="goodsName" placeholder="搜索菜品..." ss-search-show="sp" />
                    <input type="text" name="shName"  placeholder="搜索餐厅..." ss-search-show="dp" style="display:none;" />
                </div>
              <button class="f-r">
						搜 索
					</button>
                <div style="clear:both;"></div>
            </div>
            </form>
            
        </div>
        
        <div style="clear:both;"></div>
    </div>
    
   
    <!--nav 开始-->
     <div style="border-bottom:2px solid #F09E0B;">
    	<div class="nav w1200">
    	<a href="JavaScript:;" class="sp-kj" kj="">
        	菜品分类
        </a>
        <div class="kj-show2 none" kj-sh="">
        
           <s:iterator value="#session.cateLogList" id="cateLog">
            <div class="kj-info1" mg="shiping">
            	<dl class="kj-dl1">
               		<dt><a href="<%=path %>/goodsByCatelog.action?catelogId=${cateLog.catelogId}">${cateLog.catelogName}</a></dt>
                    
                </dl>
            </div>
            </s:iterator>
             
            
             
        </div>
        <ul>
        <li>
					<a href="<%=path%>/index.action">首页</a>
				</li>
				<li>
					<a href="<%=path%>/qiantai/userinfo/gwlc.jsp">订餐流程</a>
				</li>
				<li>
					<a href="<%=path%>/qiantai/userinfo/cjwt.jsp">常见问题</a>
				</li>
				 
            <div style="clear:both;"></div>
        </ul>
        <div style="clear:both;"></div>
    </div>
    </div>
</html>
