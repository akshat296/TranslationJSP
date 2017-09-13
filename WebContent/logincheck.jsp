<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
  
<jsp:useBean id="obj" class="com.registration.form.bean.LoginUser" >
</jsp:useBean>  
<jsp:setProperty property="*" name="obj"/>

 <%@page import= "com.registration.form.dao.UserSave"%>


  
 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

</head>
<body>
<% 
System.out.print (" Login_Check_email = "+obj.getEmail()+" ");
int ab = UserSave.checkLogin(obj);

if(ab == 0)
{
response.sendRedirect("failedLogin.jsp");	
}
else {
	
	response.sendRedirect("User.jsp");
}%>

</body>
</html>