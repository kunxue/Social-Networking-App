<%@ taglib prefix="form"  uri="http://www.springframework.org/tags/form"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<html>
<head>
<title>Upload a file please</title>
</head>
<body  background="images/4.jpg">
<h1>Please upload a file</h1>
<form:form method="post" action="uploadphoto.htm" enctype="multipart/form-data">
<font color='red'><form:errors path="*"></form:errors></font>
<input type="file" name="file" value="browse"/>
  <p>Description: 
    <label>
    <form:input path="photodescription" />
    </label>
  </p>
<input type="submit" value="Upload"/>
</form:form>
</body>
</html>