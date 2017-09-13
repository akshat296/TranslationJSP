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
<h1>Update Form</h1>
<% 
System.out.print (" Some things = "+request.getParameter("id"));
%>
<form name="Update" action=<%= "updation.jsp?id="+request.getParameter("id")  %> method ="post">
<p>Name</p>
<input type="text" placeholder="Name" id="name" name="name"><br>

<p>Email</p>
<input type="text" placeholder="Email" id="email" name="email"><br>

<p>Password</p>
<input type="password" placeholder="Password" id="password" name="password"><br>

<p>Confirm Password</p>
<input type="password" placeholder="Confirm Password" id="confirm_password" name="confirm_password"><br>

<p>Username</p>
<input type="text" placeholder="Username" id="username"  name="username"><br>

<p>Date</p>
<input type="text" placeholder="Date" id="dob"  name="dob"><br>

<p>Country</p>
 <select id="country" name ="country">
<option value="india">India</option>
<option value="us">United States</option>
<option value="Canada">Canada</option>
</select>

<br> 
<p>Age</p>
<input type="text" placeholder="Age" id="age"  name="age"><br>

<br>
<input type ="submit" value ="Update!">
</form>
</center>
</body>
</html>