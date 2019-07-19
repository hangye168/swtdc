<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
 
  <body>
  <div>
		<footer>
			 <!--底部服务--> 
			<div class="ft-service">
			</div>
					<!--底部 版权-->
					
					<div class="footer w1200">
						<p>			 
							<a target="_blank" href="<%=path%>/admin/login.jsp">后台管理</a><span>|</span>
							<a target="_blank" href="<%=path%>/qiantai/shanghu/shanghulogin.jsp">商家入口</a> 						 
						</p>

					</div>
					
		</footer>
		</div>
  </body>
</html>
