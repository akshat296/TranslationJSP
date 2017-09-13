<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<%@page import= "com.registration.form.dao.UserSave"%>
<jsp:useBean id="u" class="com.registration.form.bean.User"></jsp:useBean>
<jsp:setProperty property="*" name="u"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<% 
int id =  Integer.parseInt(request.getParameter("id"));
System.out.print ("ID url : "+id+"</p>");
int user = UserSave.update(u,id);
if(user == 1 )
{
	response.sendRedirect("UpdatedSuccess.jsp");	
	//System.out.print ("<p>User Saved with id : "+u.getId()+"</p>");
}
else {
	response.sendRedirect("UpdationFailed.jsp");	
	
}

%>
</body>
</html>