<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ page isELIgnored="false"%>
<%@ taglib uri="http://java.fckeditor.net" prefix="FCK"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="pragma" content="no-cache" />
		<meta http-equiv="cache-control" content="no-cache" />
		<meta http-equiv="expires" content="0" />
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3" />
		<meta http-equiv="description" content="This is my page" />

		<link rel="stylesheet" type="text/css" href="<%=path%>/css/base.css" />
        <script type="text/javascript" src="<%=path %>/js/popup.js"></script>
		  <script language="javascript">
          
			
			function up()
		    {
		        var pop=new Popup({ contentType:1,isReloadOnClose:false,width:400,height:200});
	            pop.setContent("contentUrl","<%=path %>/upload/upload.jsp");
	            pop.setContent("title","文件上传");
	            pop.build();
	            pop.show();
		    }
			
		    
		     
        </script>
	</head>

	<body leftmargin="2" topmargin="9"
		background='<%=path%>/images/allbg.gif'>
		<form action="<%=path%>/editShanghu.action" name="formAdd"
		
			method="post">
			<input type="hidden" name="id" value="${sessionScope.shanghu.id}" />
			<table width="98%" align="center" border="0" cellpadding="4"
				cellspacing="1" bgcolor="#CBD8AC" style="margin-bottom: 8px">
				<tr bgcolor="#EEF4EA">
					<td colspan="3" background="<%=path%>/images/wbg.gif"
						class='title'>
						<span>商户资料</span>
					</td>
				</tr>
				<tr align='center' bgcolor="#FFFFFF"
					onMouseMove="javascript:this.bgColor='red';"
					onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
					<td width="25%" bgcolor="#FFFFFF" align="right">
						用户名：
					</td>
					<td width="75%" bgcolor="#FFFFFF" align="left">
						<input type="text" name="userName" value="${sessionScope.shanghu.uname}" />
					</td>
				</tr>
				<tr align='center' bgcolor="#FFFFFF"
					onMouseMove="javascript:this.bgColor='red';"
					onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
					<td width="25%" bgcolor="#FFFFFF" align="right">
						密码：
					</td>
					<td width="75%" bgcolor="#FFFFFF" align="left">
						<input type="text" name="userPw" value="${sessionScope.shanghu.pwd}" />
					</td>
				</tr>
				<tr align='center' bgcolor="#FFFFFF"
					onMouseMove="javascript:this.bgColor='red';"
					onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
					<td width="25%" bgcolor="#FFFFFF" align="right">
						餐厅名称：
					</td>
					<td width="75%" bgcolor="#FFFFFF" align="left">
						<input type="text" name="name" value="${sessionScope.shanghu.name}" />
					</td>
				</tr>
				<tr align='center' bgcolor="#FFFFFF"
					onMouseMove="javascript:this.bgColor='red';"
					onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
					<td width="25%" bgcolor="#FFFFFF" align="right">
						照片：
					</td>
					<td width="75%" bgcolor="#FFFFFF" align="left">
						<input type="text" name="fujian"  id="fujian"  readonly="readonly" value="${sessionScope.shanghu.logo}" />
						<input type="button" value="上传" onclick="up()"/>
					</td>
				</tr>
				 
				<tr align='center' bgcolor="#FFFFFF"
					onMouseMove="javascript:this.bgColor='red';"
					onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
					<td width="25%" bgcolor="#FFFFFF" align="right">
						客服电话：
					</td>
					<td width="75%" bgcolor="#FFFFFF" align="left">
						<input type="text" name="tel" value="${sessionScope.shanghu.tel}" />
					</td>
				</tr>
				<tr align='center' bgcolor="#FFFFFF"
					onMouseMove="javascript:this.bgColor='red';"
					onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
					<td width="25%" bgcolor="#FFFFFF" align="right">
						&nbsp;
					</td>
					<td width="75%" bgcolor="#FFFFFF" align="left">
						<input type="submit" value="提交" />
						&nbsp;
						<input type="reset" value="重置" />
						 
					</td>
				</tr>
			</table>
		</form>
	</body>
</html>
