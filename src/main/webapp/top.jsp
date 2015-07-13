<%@page import="com.me.spring.pojo.User" %>
<%@page import="javax.servlet.http.HttpSession" %>
<jsp:useBean id="user" class="com.me.spring.pojo.User" scope="session" />
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
<title>Main page head</title>
<style type="text/css">
<!--
.STYLE1 {	color: #FF0000;
	font-size: x-large;
}
.STYLE2 {	font-size: large;
	font-weight: bold;
}
-->
</style>
</head>

<body background="images/top.jpg">
<span class="STYLE1">Welcome:</span><span class="STYLE2">${user.account}</span> <span class="STYLE1"> &nbsp;&nbsp;&nbsp;Email:</span> <span class="STYLE2">${user.email}</span> &nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="STYLE1">&nbsp;<a href="login.htm" target="_parent">Log out</a></span>
</body>
</html>
