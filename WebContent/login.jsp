<%@ page pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page language="java" import="java.util.*" %>
    <%@ page import = "java.io.*,java.util.Locale" %>
<%@ page import = "javax.servlet.*,javax.servlet.http.* "%>
<c:set var="language" value="en" scope="session" />

   <%@page import= "com.registration.form.dao.UserSave"%>
 <jsp:useBean id="obj" class="com.registration.form.bean.LoginUser" ></jsp:useBean>  
<jsp:setProperty property="*" name="obj"/>
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

<head></head>
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
<title><%=  resource.getString("login.label.login_page") %></title>

<body>
<h1><%=  resource.getString("login.label.login_page") %></h1>
<form method = "get" action ="logincheck.jsp" >
<p><%=  resource.getString("login.label.email") %></p>
<input type = "text"  name="email"> <br>
<p> <%=  resource.getString("login.label.password") %> </p> 
<input type = "password" name="password">  <br>
<br>
<input type= "submit" value='<%=  resource.getString("login.label.login") %>'>


</form>

</body>
</html>