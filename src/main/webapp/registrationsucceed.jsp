<%@ taglib prefix="form"  uri="http://www.springframework.org/tags/form"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
<title>registrationsucceed</title>
<style type="text/css">
<!--
.STYLE1 {
	font-size: xx-large;
	font-weight: bold;
	color: #FF0000;
}
.STYLE3 {font-size: x-large; font-weight: bold; color: #FF0000; }
-->
</style>
</head>

<body>
<div align="center" class="STYLE1">
  <p class="STYLE1">Congratualtion! you have already registered sucessfully
</p>
  <p>&nbsp;</p>
  <p><a href="mainpage.jsp">Login in your main page</a></p>
  <p>&nbsp;</p>
</div>
<%
out.print("<script language=javascript>alert('registered sucessfully');window.location.href='mainpage.jsp';</script>");

%>>
</body>
</html>
