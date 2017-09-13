<%@ page language="java" import="java.util.*" %>
<%
ResourceBundle resource = ResourceBundle.getBundle("commonVariable");
/// commonVariable.properties file will be in WEB-INF/classess  folder

String sPath=resource.getString("forum.path");
String sName=resource.getString("forum.database");

System.out.println(sPath);
System.out.println(sName);

%>