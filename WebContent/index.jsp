<%@ page pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page language="java" import="java.util.*" %>
    <%@ page import = "java.io.*,java.util.Locale" %>
<%@ page import = "javax.servlet.*,javax.servlet.http.* "%>
<c:set var="language" value="en" scope="session" />

<fmt:setLocale value="${language}" />
<fmt:setBundle basename="com.example.i18n.text" />
    <%@page import= "com.registration.form.dao.UserSave"%>
    <%@ page import="java.io.*" %>
    <%@page import="java.net.URLDecoder"%>
        <%@page import="java.util.Arrays"%>
    <jsp:useBean id="u" class="com.registration.form.bean.User"></jsp:useBean>
<jsp:setProperty property="*" name="u"/>
<!DOCTYPE html>
<html lang="${language}">
<head>
 <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
Locale locale = request.getLocale();
out.println("Locale : " + locale  + "<br />");
String language = locale.getLanguage();
ResourceBundle  resource;
if(request.getParameter("language")!=null)
{
 resource = ResourceBundle.getBundle("text_"+request.getParameter("language"));
// Set response content type
}
else {
	 resource = ResourceBundle.getBundle("text_en");
}


//response.setHeader("Content-Language", "es");%>
 <center>
        <form>
     
            <select id="language" name="language" onchange="submit()">
           		   <option value="en" ${language == 'en' }>Select a Language</option>
                <option value="en" ${language == 'en' }>English</option>
                <option value="nl" ${language == 'nl' }>Nederlands</option>
                <option value="es" ${language == 'es' }>Español</option>
                  <option value="hin" ${language == 'hin' }>Hindi</option>
            </select>
        </form>
        <br><br>
        <center>
<center>
<h1><%= resource.getString("login.label.registration_form") %></h1>
<% 
String [] err ={" "," "," "," "," "," "," "};
if( request.getParameterValues("fibSequence")!=null)
{
String encArray = Arrays.toString(request.getParameterValues("fibSequence")); 

String decArray = URLDecoder.decode(encArray,"utf-8");
//Now you can parse the list into an Integer list
err = decArray.split(",");
System.out.print("  Some  =  "+err[0]);
}%>
<form name="Registration" action="savingform.jsp" method ="post">
<p><%= resource.getString("login.label.name") %></p>
<input type="text" placeholder="Name" id="name" name="name"><br>
<%= "\b"+err[0] %>
<p><%= resource.getString("login.label.email") %></p>
<input type="text" placeholder="Email" id="email" name="email"><br>
<%= err[1] %>
<p><%= resource.getString("login.label.password") %></p>
<input type="password" placeholder="Password" id="password" name="password"><br>

<p><%= resource.getString("login.label.c_password") %></p>
<input type="password" placeholder="Confirm Password" id="confirm_password" name="confirm_password"><br>
<%= err[2] %>
<p><%= resource.getString("login.label.username") %></p>
<input type="text" placeholder="Username" id="username"  name="username"><br>
<%= err[3] %>
<p><%= resource.getString("login.label.dob") %></p>
<input type="text" placeholder="Date" id="dob"  name="dob"><br>
<%= err[4] %>
<p><%= resource.getString("login.label.country") %></p>
 <select id="country" name ="country">
<option value="india"><%= resource.getString("login.label.country.india") %></option>
<option value="us"><%= resource.getString("login.label.country.us") %></option>
<option value="Canada"><%= resource.getString("login.label.country.canada") %></option>
</select>
<%= err[5] %>
<br> 
<p><%= resource.getString("login.label.age") %></p>
<input type="text" placeholder="Age" id="age"  name="age"><br>
<%= err[6] +"\b" %>
<br>
<input type ="submit" value =<%= resource.getString("login.label.register") %>>
</form>
</center>
<p><a href=""><%= resource.getString("login.label.login") %></a></p>
</body>
</html>