<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import = "java.io.*,java.util.Locale" %>
<%@ page import = "javax.servlet.*,javax.servlet.http.* "%>
    <%@ page import="java.util.*" %>
    <%@ page import = "java.text.DateFormat,java.util.Date" %>
    <%@ page import = "java.text.NumberFormat,java.util.Date" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%

// Set response content type
response.setContentType("text/html");

// Set spanish language code.
response.setHeader("Content-Language", "es");
String title = "En Español";

Locale locale = request.getLocale();
out.println("Locale : " + locale  + "<br />");
String language = locale.getLanguage();
String country = locale.getCountry();

String date = DateFormat.getDateTimeInstance(
	      DateFormat.FULL, 
	      DateFormat.SHORT, 
	      locale).format(new Date( ));
%>
<p>     <%  out.println("Language : " + language  + "<br />");
            out.println("Country  : " + country   + "<br />");
            out.print("Date format in this country   " +date); 
            NumberFormat nft = NumberFormat.getPercentInstance(locale);
            String formattedPerc = nft.format(0.51);
            %></p> 
   <h1>Language Test : <%  out.print(title); %></h1>
    <div align = "center">
         <p>Formatted Percentage: <%  out.print(formattedPerc); %></p>
      </div>
   
      
      <div align = "center">
         <p>En Español</p>
         <p>¡Hola Mundo!</p>
      </div>
</body>
</html>