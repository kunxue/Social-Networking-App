<%@ taglib prefix="form"  uri="http://www.springframework.org/tags/form"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
<title>Registration</title>
<style type="text/css">
<!--
.STYLE1 {
	font-size: xx-large;
	font-weight: bold;
}
.STYLE3 {color: #000000}
-->
</style>
</head>

<body background="images/4.jpg">
<div align="center" class="STYLE1">
  <p>Welcome</p>
  <table width="897" border="1">
    <tr>
      <td width="887" bgcolor="#00FF33">Registration:</td>
    </tr>
  </table>
<form:form commandName="user" method="post">
<font color='red'><form:errors path="*"></form:errors></font>
    <table width="876" border="1" bordercolor="#FFFFFF">
      <tr>
        <td> <span class="STYLE3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp; &nbsp; Account: &nbsp;
            <label>
            <form:input path="account" />
            </label>
        </span></td>
      </tr>
      <tr>
        <td><span class="STYLE3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp; Password: &nbsp;
            <label>
            <form:password path="password"/>
            </label>
        </span></td>
      </tr>
      <tr>
        <td><span class="STYLE3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Validatepassword:
            <label>
          &nbsp;
          <form:password path="validatepassword" />
            </label>
        </span></td>
      </tr>
      <tr>
        <td><span class="STYLE3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;Name:
            <label>
          &nbsp;
          <form:input path="name" />
            </label>
        </span></td>
      </tr>
      <tr>
        <td><span class="STYLE3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp;Gender:
            <label>
          &nbsp;
          <form:radiobutton path="gender" value="male" />
        Male 
        <form:radiobutton path="gender" value="female" />
Female</label>
        </span></td>
      </tr>
      <tr>
        <td><span class="STYLE3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; MSN:
            <label>
          &nbsp;
          <form:input path="msn" />
            </label>
        </span></td>
      </tr>
      <tr>
        <td><span class="STYLE3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp; MainPage:&nbsp;&nbsp;
            <label>
            <form:input path="mainpage"  />
            </label>
        </span></td>
      </tr>
      <tr>
        <td><span class="STYLE3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp;Interest:
            <label>
          &nbsp;
          <form:input path="interest"  />
            </label>
        </span></td>
      </tr>
      <tr>
        <td><span class="STYLE3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;Address:
            <label>
          &nbsp;
          <form:input path="address"  />
            </label>
        </span></td>
      </tr>
      <tr>
        <td><span class="STYLE3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;Email:&nbsp;&nbsp;
            <label>
            <form:input path="email" />
            </label>
        </span></td>
      </tr>
    </table>
    <p>
      <label></label>
      <label>
      <input type="image" class="STYLE1" src="images/register.jpg"/>
      </label>
      <a href="login.htm">Back to login page</a></p>
    <p>&nbsp;</p>
    <p class="STYLE1">&nbsp;</p>
    <p>&nbsp;</p>
    <p>&nbsp;</p>
    <p>&nbsp;</p>
    <p>&nbsp;</p>
    <p>&nbsp;</p>
    <p>&nbsp;</p>
  </form:form>
  <p>&nbsp;</p>
  <p align="left">&nbsp;</p>
  <p align="left">&nbsp;</p>
  <p>&nbsp;</p>
  <p>&nbsp;</p>
  <p>&nbsp;</p>
  <p>&nbsp;</p>
  <p>&nbsp;</p>
  <p>&nbsp;</p>
  <p>&nbsp;</p>
  <p>&nbsp;</p>
</div>
</body>
</html>
