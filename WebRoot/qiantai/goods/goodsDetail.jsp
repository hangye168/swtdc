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
		<link rel="stylesheet" type="text/css"
			href="<%=path%>/qiantai/css/style.css" />
		<link rel="stylesheet" type="text/css"
			href="<%=path%>/qiantai/css/shopping-mall-index.css" />
		<script type="text/javascript" src="<%=path%>/qiantai/js/jquery.js"></script>
		<script type="text/javascript" src="<%=path%>/qiantai/js/zhonglin.js"></script>
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
	        
	         function favgood(goodid)
	        {
	        
	            <c:if test="${sessionScope.user==null}">
	                alert("请先登录");
	            </c:if>
	            <c:if test="${sessionScope.user!=null}">
	               
	                document.getElementById("ftypes").value = '1';
		            document.getElementById("goodsId1").value = goodid;
		            document.fav.submit();
	            </c:if>
	        }
	        
	        
	        
	        function add_num2(){
	        console.log(document.getElementById("quantity").value);
             document.getElementById("quantity").value++;
 
}
function red_num2(){
  if (document.getElementById("quantity").value>1){
    document.getElementById("quantity").value--;
  }
 
}

 


	    </script>
	</head>

	<body style="position:relative;">
	
	
	
	<jsp:include flush="true" page="/qiantai/inc/incTop.jsp"></jsp:include>
	  <form action="<%=path %>/shoucangAdd.action" method="post" name="fav">
                 <input name="shoucang.goodsid" type="hidden" id="goodsId1"/>
                  <input name="shoucang.types" id="ftypes" type="hidden" value="2"/>
              </form>
    
    
 
              
              
    <!--内容开始-->
    <div class="details w1200">
    	<div class="deta-info1">
        	<div class="dt-if1-l f-l">
            	<div class="dt-if1-datu">
                	<ul qie-da="">
                       <li><a href="#"><img style="width: 359px;height: 351px;" src="<%=path %>/<s:property value="#request.goods.goodsPic"/>" /></a></li>
                      
                       <div style="clear:both;"></div>
                    </ul>
                </div>
                
                <div class="dt-if1-fx">
                	<span> </span>
                    
                </div>
            </div>
          
        	<div class="dt-if1-m f-l">
        	  <form action="<%=path %>/addToCart.action" method="post" name="buy">
        	  <input type="hidden" name="goodsId" value="<s:property value="#request.goods.goodsId"/>"/>
            	<div class="dt-ifm-hd">
                	<h3><a href="#"><s:property value="#request.goods.goodsName"/></a></h3>
                	 
                </div>
                <div class="dt-ifm-gojia">
                	<dl>
                    	<dt>价格</dt>
                        <dd>
                        	<p class="p1">
                               <span class="sp1">¥<s:property value="#request.goods.goodsShichangjia"/></span> 
                            </p>
                            
                        </dd>
                        <div style="clear:both;"></div>
                    </dl>
                </div>
                 
                
                <dl class="dt-ifm-box3">
                	<dt>数量</dt>
                    <dd>
                    	<a class="box3-left" href="JavaScript:red_num2();">-</a>
              <input type="text" id="quantity" name="quantity" value="1" size="8" onkeyup="this.value=this.value.replace(/\D/g,'')" onafterpaste="this.value=this.value.replace(/\D/g,'')"/>
                    	<a class="box3-right" href="JavaScript:add_num2();;">+</a>
                    </dd>
                    <div style="clear:both;"></div>
                </dl>
                <div class="dt-ifm-box4">
                	<!--button class="btn1">立即购买</button-->
                	
                	 <input style=" width:78px; height:28px; background-color:#EF9D09;margin-right:7px; font-size:12px; color:#fff; border:none; float:left; cursor:pointer;" type="button"  onclick="buy1();" class="btn2"  value="加入购物车"/>
                	 
               
                	<!--button class="btn3">收藏</button-->
                </div>
                  </form>
            </div>
            
        	<div class="dt-if1-r f-r">
               	<div class="dt-ifr-hd" style="height: 189px;">
                	<div class="dt-ifr-tit">
                    	<h3><s:property value="#request.shanghu.name"/></h3>
                    </div>
                     
                    <div class="dt-ifr-tel">
                     
                        <p>客服电话：<s:property value="#request.shanghu.tel"/></p>
                    </div>
                    
                    
                    <button class="dt-r-btn1" onclick="javascript:window.location.href='<%=path%>/shindex.action?store=<s:property value="#request.shanghu.id"/>'" >进入餐厅</button>
                   
                </div>
                
            </div>
            <div style="clear:both;"></div>
        </div>
      
        <div class="deta-info2">
            <div class="dt-if2-r f-r" style="width:100%">
                <ul class="if2-tit2">
                    <li class="current" com-det="dt1"><a href="JavaScript:;">产品信息</a></li>
                    <li com-det="dt2"><a href="JavaScript:;">菜品评论</a></li>
                    <div style="clear:both;"></div>
                </ul>
                <div style="border:1px solid #DBDBDB;" com-det-show="dt1">
                	<div class="if2-tu1">
                        <s:property value="#request.goods.goodsMiaoshu" escape="false"/>
                        <div style="clear:both;"></div>
                    </div>
                    <div class="if2-tu2">
                        <div style="clear:both;"></div>
                    </div>
                    <div class="if2-tu3">
                    </div>
                    <ul class="if2-tu4">
                      
                        <div style="clear:both;"></div>
                    </ul>
                </div>
                <div style="display:none;" com-det-show="dt2">
                 
                	<div class="if2-r-box3">
                	 <c:forEach items="${plist}" var="pingjia">
                    <dl>
                    	 
                        <dd>
                        	<a href="#">${pingjia.plr}</a>
                            <p class="b3-p1">${pingjia.plnr}</p>
                            <p class="b3-p2">${pingjia.plsj}</p>
                        </dd>
            			<div style="clear:both;"></div>
                    </dl>
                    </c:forEach>
                     
                    
                    </div>  </div>
           			 
            </div>
            <div style="clear:both;"></div>
        </div>
    </div>
    
     <jsp:include flush="true" page="/qiantai/inc/incFoot.jsp"></jsp:include>
</body>
</html>
