<%@ page language="java" contentType="text/html; charset=ISO-8859-1"   pageEncoding="ISO-8859-1"%>
<%@ page import="java.net.InetAddress" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Simple Web App</title>
</head>
<body>
<%
String ipAddress = request.getHeader("X-FORWARDED-FOR");
        if(ipAddress == null){    
            ipAddress = request.getRemoteAddr();
        }
%>
<h1>Hello World!</h1>
<span><br>Your IP Address is:   <%= ipAddress %></span>
</body>
</html>
