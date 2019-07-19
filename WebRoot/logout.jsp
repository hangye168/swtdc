<%@ page contentType="text/html; charset=gb2312" %>
<%@page session="true"%>
<%
    request.getSession().setAttribute("shanghu",null);
    request.getSession().setAttribute("userType",null);
    request.getSession().invalidate();
 %>
<script>
	       var win=window;
            while(win.parent!=window.top)
            {
            	win=win.parent;
            }
            win.parent.location.replace("qiantai/shanghu/shanghulogin.jsp");  
</script>