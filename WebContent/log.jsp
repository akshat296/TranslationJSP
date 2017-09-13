<%@ page pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page language="java" import="java.util.*" %>
    <%@ page import = "java.io.*,java.util.Locale" %>
<%@ page import = "javax.servlet.*,javax.servlet.http.* "%>
<c:set var="language" value="en" scope="session" />

<fmt:setLocale value="${language}" />
<fmt:setBundle basename="com.example.i18n.text" />

<!DOCTYPE html>
<html lang="${language}">
    <head>
        <title>JSP/JSTL i18n demo</title>
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
    </head>
    <body>
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
        <form method="post">
            <label for="username"><%= resource.getString("login.label.username") %></label>
            <input type="text" id="username" name="username">
            <br>
             <br>
             
            <label for="password"><%= resource.getString("login.label.password") %>:</label>
            <input type="password" id="password" name="password">
            <br>
             <br>
          <%= resource.getString("login.button.submit") %>
            <input type="submit" name="submit" value= '<%= resource.getString("login.button.submit")%>'>
             <br>
        </form>
        </center>
    </body>
</html>