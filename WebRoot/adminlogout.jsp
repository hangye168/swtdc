<%@ page contentType="text/html; charset=gb2312" %>
<%@page session="true"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%
    request.getSession().setAttribute("admin",null);
    request.getSession().setAttribute("userType",null);
    request.getSession().invalidate();
 %>
<script>
	       var win=window;
            while(win.parent!=window.top)
            {
            	win=win.parent;
            }
            win.parent.location.href = "<%=path%>/admin/login.jsp";  
</script>