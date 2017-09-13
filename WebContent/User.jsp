<%@ page pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page language="java" import="java.util.*" %>
<%@page import="com.registration.form.dao.UserSave,com.registration.form.bean.Product,com.registration.form.bean.*,java.util.*"%>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>  
  

    <%@ page import = "java.io.*,java.util.Locale" %>
<%@ page import = "javax.servlet.*,javax.servlet.http.* "%>
<c:set var="language" value="en" scope="session" />

<fmt:setLocale value="${language}" />
<fmt:setBundle basename="com.example.i18n.text" />
<!DOCTYPE html>
<html lang="${language}">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>User View Details</title>
</head>
<body>

  
<%  
List<User> list=UserSave.getAllRecords();  
request.setAttribute("list",list);  
%>  
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
<h1><%=  resource.getString("login.label.user_list") %></h1>  
<table border="1" width="90%">  
<tr><th><%=  resource.getString("login.label.id") %></th><th><%=  resource.getString("login.label.name") %></th>
<th><%=  resource.getString("login.label.country") %></th><th><%=  resource.getString("login.label.edit") %></th>  
<th><%=  resource.getString("login.label.country") %></th><th>
<%=  resource.getString("login.label.edit") %></th><th><%=  resource.getString("login.label.delete") %></th></tr>  
<c:forEach items="${list}" var="u">  
<tr><td>${u.getId()}</td><td>${u.getName()}</td><td>${u.getPassword()}</td>  
<td>${u.getEmail()}</td><td>${u.getCountry()}</td>  
<td><a href="edituser.jsp?id=${u.getId()}"><%=  resource.getString("login.label.edit") %></a></td>  
<td><a href="deleteuser.jsp?id=${u.getId()}"><%=  resource.getString("login.label.delete") %></a></td></tr>  
</c:forEach>  
</table>  
<br/><a href="index.jsp"><%=  resource.getString("login.label.add_new_user") %></a>  
<br>
<br>
<table border="1" width="90%">  
<tr>
<tr>
<th><%=  resource.getString("login.label.id") %></th><th><%=  resource.getString("login.label.product_name") %></th>
<th><%=  resource.getString("login.label.product_type") %>
</th>
</tr>

<%  
ArrayList<Product> productList = new ArrayList<Product>();
productList =  UserSave.getAllProducts();  
Iterator<Product> itr = productList.iterator();

while (itr.hasNext())
{
	Product Pobj = itr.next();
	out.println("<tr><td> <center> "+Pobj.getId()+"<center></td>");
	out.println("<td> <center>"+Pobj.getProductName()+"</td>");
	out.println("<td>  <center> "+resource.getString("login.label."+Pobj.getProductType())+"</td></tr>");
} 



%>



</table>
</body>
</html>