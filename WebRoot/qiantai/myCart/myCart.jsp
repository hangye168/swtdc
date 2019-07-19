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
		<link rel="stylesheet" type="text/css"
			href="<%=path%>/qiantai/css/common.css" />
		<link rel="stylesheet" type="text/css"
			href="<%=path%>/qiantai/css/Orders.css" />
		<script type="text/javascript" src="<%=path%>/qiantai/js/jquery.js"></script>
		<script type="text/javascript" src="<%=path%>/qiantai/js/zhonglin.js"></script>
		<script type='text/javascript'
			src='<%=path%>/dwr/interface/cartService.js'></script>
		<script type='text/javascript' src='<%=path%>/dwr/engine.js'></script>
		<script type='text/javascript' src='<%=path%>/dwr/util.js'></script>
		<script language="JavaScript" src="<%=path%>/js/public.js"
			type="text/javascript"></script>
		<script type="text/javascript">
	        function modiNum(goodsId,quantity)
	        {
	            var r1= /^[0-9]*[1-9][0-9]*$/　　//正整数 
	            var val=r1.test(quantity); //str为你要判断的字符 执行返回结果 true 或 false
	            if(val==false)
	            {
	                alert("数量必须是数字,请重新输入");
	            }
	            else
	            {
	                document.getElementById("indicator1").style.display="block";
	                cartService.modiNum(goodsId,quantity,callback);
	            }
	        }
	        
	        function callback()
	        {
	            document.getElementById("indicator1").style.display="none";
	            document.location.reload(true);
	        }
	        
	        
	        function delGoodsFromCart(goodsId)
	        {
	            document.getElementById("indicator1").style.display="block";
	            cartService.delGoodsFromCart(goodsId,callback);
	        }
	        
	        function clearCart()
	        {
	            document.getElementById("indicator1").style.display="block";
	            cartService.clearCart(callback);
	        }
	        
	        function check(){
	        	if(document.form1.pln.value < 1){
	        		alert("购买数量不能为空");
	        	}else{
	        		document.form1.submit();
	        	}
	        }
    </script>
	</head>

	<body>
		<jsp:include flush="true" page="/qiantai/inc/incTop.jsp"></jsp:include>



		<s:set name="items" value="#session.cart.items" />
		<!--购物车样式-->
		<div class="Inside_pages clearfix">
			<div class="shop_carts">

			 
					<div class="shopping">
						<form method="post" action="<%=path%>/orderQueren.action" name="form1">
							<table class="table_list">
                              <tr class="tr">
								 
										<td class="name"  >
											菜品名称
										</td>
										<td class="scj sp"  >
											价格
										</td>
										 
										<td class="sl"  >
											购买数量
										</td>
										<td class="xj" >
											小计
										</td>
										<td class="cz">
										操作
										</td>
									</tr>
								<s:iterator value="#items">
									<tr class="tr">
										 
										<td class="name" align="center" style="text-align: center" >
											<div class="img">
												<a href="#"><img src="<%=path%>/<s:property value="value.goods.goodsPic"/>" />
												</a>
											</div>
											<div class="p_name"  >
												<a href="#"><s:property value="value.goods.goodsName"/></a>
											</div>
										</td>
										<td class="scj sp" style="width: 120px;">
											<span id="Original_Price_1">￥<s:property value="value.goods.goodsShichangjia"/></span>
										</td>
										 
										<td class="sl"  >
											<div class="Numbers">
												<!-- a onClick="setAmount.reduce('#qty_item_1')"
													href="javascript:void(0)" class="jian">-</a -->
												<input type="text" class="textBox" name="pln" onChange="modiNum(<s:property value="value.goods.goodsId"/>,this.value)" value="<s:property value="value.goodsQuantity"/>" size="4"/>
												 
											</div>
										</td>
										<td class="xj"  >
											<span id="total_item_1"><s:property value="value.goodsQuantity * value.goods.goodsShichangjia"/></span>
											 
										</td>
										<td class="cz">
											<p>
												<a href="#" onclick="delGoodsFromCart(<s:property value="value.goods.goodsId"/>)">删除</a>
											<P>
											 
										</td>
									</tr>

								</s:iterator>

							</table>
							<div class="sp_Operation clearfix">

								<!--结算-->
								<div class="toolbar_right">
									<ul class="Price_Info">
										<!--  li class="p_Total">
										
										
										 
											<label class="text">
												菜品总价：
											</label>
											<span class="price " id="Total_price"><s:property
													value="#session.cart.totalPrice" />元
											</span>
										</li-->
										<li class="p_Total">
											<label class="text">
												实际总价：
											</label>
											<span class="price sumPrice" name="pln" id="Total_price"><s:property
													value="#session.cart.totalPrice" />元</span>
										</li>
										 
									</ul>
									<div class="btn">
										<a class="cartsubmit" href="#" onclick="check()"></a>
											<a class="continueFind" href="<%=path%>/shindex.action?store=${sessionScope.store}"></a>
									</div>
								</div>
							</div>
						</form>
					</div>
				</div>
			<img id="indicator1" src="<%=path%>/images/loading.gif"
					style="display: none" />
		<jsp:include flush="true" page="/qiantai/inc/incFoot.jsp"></jsp:include>
	</body>
</html>
