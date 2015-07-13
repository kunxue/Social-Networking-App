<%@ taglib prefix="form"  uri="http://www.springframework.org/tags/form"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>Search members</title>
<style type="text/css">
<!--
.STYLE1 {font-size: xx-large}
.STYLE2 {color: #FF0000}
-->
</style>
</head>

<body background="images/4.jpg">
<form:form commandName="user" method="post">
  <p>&nbsp;</p>
  <p><span class="STYLE2"><span class="STYLE1">&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Search by</span>:</span>
      <form:select path="password">
        <form:option value="account"/>
        <form:option value="name" />
        <form:option value="msn" />
        <form:option value="email"/>
        <form:option value="address" />
      </form:select>
  </p>
  <p>
    <label> <span class="STYLE1">&nbsp;&nbsp;</span><span class="STYLE1">&nbsp;&nbsp;</span><span class="STYLE1">&nbsp;&nbsp;</span><span class="STYLE1">&nbsp;&nbsp;</span><span class="STYLE1">&nbsp;&nbsp;</span><span class="STYLE1">&nbsp;&nbsp;</span><span class="STYLE1">&nbsp;&nbsp;</span><span class="STYLE1">&nbsp;&nbsp;</span><span class="STYLE1">&nbsp;&nbsp;</span><span class="STYLE1">&nbsp;</span>
      <form:input path="account" />
    </label>
    <br />
    <label> <span class="STYLE1">&nbsp;&nbsp;</span><span class="STYLE1">&nbsp;&nbsp;</span><span class="STYLE1">&nbsp;&nbsp;</span><span class="STYLE1">&nbsp;&nbsp;</span><span class="STYLE1">&nbsp;&nbsp;</span><span class="STYLE1">&nbsp;&nbsp;</span><span class="STYLE1">&nbsp;&nbsp;</span><span class="STYLE1">&nbsp;&nbsp;</span><span class="STYLE1">&nbsp;&nbsp;</span><span class="STYLE1">&nbsp;</span>
      <input type="submit" name="Submit" value="Search" />
    </label>
  </p>
  <p>&nbsp;</p>
  <p>&nbsp;</p>
  <p>&nbsp;</p>
  <p>&nbsp;</p>
  <p>&nbsp;</p>
  <p>&nbsp;</p>
  <p>&nbsp;</p>
  <p>&nbsp;</p>
  <p>&nbsp;</p>
  <p>&nbsp;</p>
</form:form>
</body>
</html>
