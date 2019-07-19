<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" "http://www.w3.org/TR/REC-html40/loose.dtd">
<!-- saved from url=(0041)http://www.nbhmyq.com/7853-473/16167.html -->
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>

		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>商洛学院餐厅服务系统</title>
		<link rel="stylesheet" type="text/css"
			href="<%=path%>/qiantai/css/style.css" />
		<link rel="stylesheet" type="text/css"
			href="<%=path%>/qiantai/css/shopping-mall-index.css" />
		<script type="text/javascript" src="<%=path%>/qiantai/js/jquery.js"></script>
		<script type="text/javascript" src="<%=path%>/qiantai/js/zhonglin.js"></script>
        
        <script type="text/javascript">
         function buy1(goodid)
	        {
	        
	            <c:if test="${sessionScope.user==null}">
	                alert("请先登录");
	            </c:if>
	            <c:if test="${sessionScope.user!=null}">
		            document.getElementById("goodsId").value = goodid;
		            document.buy.submit();
	            </c:if>
	        }
	        
	       
	        function selectSearch(searchid){
	        
	              document.getElementById("searchid").value = searchid;
	        }
	          
        </script>

	</head>
	<body  >

		<header>
		<!--top 开始-->
		<div class="top" >
			<div class="top-con w1200">
				<p class="t-con-l f-l">
        	    <a href="<%=path%>/index.action">欢迎来到商洛学院餐厅服务系统 </a>  
                 
        	                  </p>
				
				  <s:if test="#session.user!=null">
				<ul class="t-con-r f-r">
            	<li><a href="<%=path %>/qiantai/userinfo/userXinxi.jsp">${sessionScope.user.userRealname}</a></li>
            	<li><a href="<%=path %>/myCart.action">我的购物车</a></li>
            	<li><a href="<%=path%>/myOrder.action">我的订单</a></li>
            	</ul>
            	 </s:if>
            	 
            	 
            	  <s:if test="#session.user==null">
				<ul class="t-con-r f-r">
            	<li><a href="<%=path%>/qiantai/userinfo/userReg.jsp">注册</a></li>
            	<li><a href="<%=path%>/qiantai/userlogin/userlogin.jsp">登录</a></li>
            	 
            	</ul>
            	 </s:if>
            	 
            	 
                <div style="clear:both;"></div>
             
				<div style="clear: both;"></div>
			</div>
		</div>

		<!--logo search 开始-->
		<div class="hd-info1 w1200">
			<div class="logo f-l">
				<h1>
					<a href="<%=path%>/index.action"  ><img   src="<%=path%>/qiantai/images/logo.jpg" />
					</a>
				</h1>
			</div>
			 
			<div class="search f-r">
				<ul class="sp">
					<li class="current" ss-search="sp">
						<a href="JavaScript:selectSearch(1);">菜品</a>
					</li>
					<li ss-search="dp">
						<a href="JavaScript:selectSearch(2);">餐厅</a>
					</li>
					<div style="clear: both;"></div>
				</ul>
				<div class="srh">
				<form action="<%=path%>/goodSearch.action" method="post">
					<div class="ipt f-l">
					
					
					     <input type="hidden" name="searchid" id="searchid" value="1"  />
						<input type="text" name="goodsName" placeholder="搜索菜品..." ss-search-show="sp" />
						<input type="text" name="shName"  placeholder="搜索餐厅..." ss-search-show="dp"
							style="display: none;" />
					</div>
					<button class="f-r">
						搜 索
					</button>
					
					 
					</form>
					<div style="clear: both;"></div>
				</div>

			</div>

			<div style="clear: both;"></div>
		</div>


		<!--nav 开始-->
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
				 
				<div style="clear: both;"></div>
			</ul>
			<div style="clear: both;"></div>
		</div>
		</header>


		<!--banner 开始-->
		<div class="banner-box">
			<div class="banner w1200">
				<ul>
					<li>
						<a href="JavaScript:;"><img
								src="<%=path%>/qiantai/images/3333.jpg" />
						</a>
					</li>
					<li>
						<a href="JavaScript:;"><img
								src="<%=path%>/qiantai/images/2222.jpg" />
						</a>
					</li>
					<li>
						<a href="JavaScript:;"><img
								src="<%=path%>/qiantai/images/4444.jpg" />
						</a>
					</li>
					<li>
						<a href="JavaScript:;"><img
								src="<%=path%>/qiantai/images/3333.jpg" />
						</a>
					</li>
					<li>
						<a href="JavaScript:;"><img
								src="<%=path%>/qiantai/images/2222.jpg" />
						</a>
					</li>
					<li>
						<a href="JavaScript:;"><img
								src="<%=path%>/qiantai/images/4444.jpg" />
						</a>
					</li>
					<div style="clear: both;"></div>
				</ul>
			 
			</div>
		</div>


		<!--菜品内容页面-->
		<div class="shopping-content w1200">
			<div class="sp-con-info">
				<h3 class="sp-info-tit">
					<span></span><font size="5px">热门餐厅</font>
				</h3>

				<ul class="sp-info-r f-r">
				
				
				<s:iterator value="#request.shlist" id="shanghu">
					<li>
						<div class="li-top">
							<a target="_blank" href="<%=path%>/shindex.action?store=${shanghu.id}" class="li-top-tu"><img
								style="width: 310px;height: 200px;"	src="<%=path%>/${shanghu.logo}" />
							</a>
							 
						</div>
						<p class="miaoshu">
						<a target="_blank" href="<%=path%>/shindex.action?store=${shanghu.id}" class="li-top-tu">
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${shanghu.name}
						</a>
						</p>
				 
						<!--p class="pingjia">
							88888评价
						</p-->
						<p class="weike">
							 
						</p>
					</li>
				</s:iterator>
					 


				</ul>
				<div style="clear: both;"></div>
			</div>




			 
		</div>
		
 
              
		
		 <jsp:include flush="true" page="/qiantai/inc/incFoot.jsp"></jsp:include>

	</body>

</html>