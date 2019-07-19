<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
		<script language="JavaScript" src="<%=path %>/js/public.js" type="text/javascript"></script>
		<script type="text/javascript">
	        function buy1()
	        {
	            <s:if test="#session.user==null">
	                  alert("请先登录");
	            </s:if>
	            <s:else>
	            if(document.buy.quantity.value=="")
	            {
	                alert("请输入购买数量");
	                return false;
	            }
	            document.buy.submit();
	            </s:else>
	        }
	        
	         function fav1(goodid)
	        {
	        
	            <c:if test="${sessionScope.user==null}">
	                alert("请先登录");
	            </c:if>
	            <c:if test="${sessionScope.user!=null}">
		            document.getElementById("goodsId1").value = goodid;
		            document.fav.submit();
	            </c:if>
	        }
	    </script>
	    
	    
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
        
        </script>
        
	</head>

	<body>
		<jsp:include flush="true" page="/qiantai/inc/incTop.jsp"></jsp:include>
		 
		<!--菜品内容页面-->
		<div class="shopping-content w1200">
			<div class="sp-con-info">
				<h3 class="sp-info-tit">
					 菜品列表
				</h3>

				<ul class="sp-info-r f-r">
				
				
				 <s:iterator value="#request.goodsByCatelogList" id="goods">
					<li >
						<div class="li-top">
							<a href="<%=path%>/goodsDetail.action?goodsId=<s:property value="#goods.goodsId"/>" class="li-top-tu"><img
								style="width: 140px;height: 140px;"	src="<%=path%>/${goods.goodsPic}" />
							</a>
							<p class="jiage">
								<span class="sp1">￥${goods.goodsShichangjia}</span> 
							</p>
						</div>
						<p class="miaoshu">
							${goods.goodsName}
						</p>
						<div class="li-md">
							<div class="md-r f-l" style="float: right;">
								 
							<input style=" width:78px; height:28px; background-color:#EF9D09;margin-right:7px; font-size:12px; color:#fff; border:none; float:left; cursor:pointer;"  type="button" class="md-l-btn2" value="加入购物车" onclick="buy1(${goods.goodsId });" />
							</div>
							<div style="clear: both;"></div>
						</div>
						<!--p class="pingjia">
							88888评价
						</p-->
						<p class="weike">
							${goods.shname}
						</p>
					</li>
				</s:iterator>
					 


				</ul>
				<div style="clear: both;"></div>
			</div>




		 
		</div>
		
		
		 <form action="<%=path %>/addToCart.action" method="post" name="buy">
              <input name="goodsId" type="hidden" id="goodsId"/>
               <input name="quantity" type="hidden" id="quantity" value="1"/>
              
              </form>
               <form action="<%=path %>/shoucangAdd.action" method="post" name="fav">
                 <input name="shoucang.goodsid" type="hidden" id="goodsId1"/>
                  <input name="shoucang.types" type="hidden" value="1"/>
              </form>
		
	   
	</body>
</html>
