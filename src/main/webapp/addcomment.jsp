<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <jsp:useBean id="commentdao" class="com.me.spring.dao.CommentDAO" scope="session" />
 <jsp:useBean id="photodao" class="com.me.spring.dao.PhotoDAO" scope="session" />
<jsp:useBean id="selectphoto" class="com.me.spring.pojo.Photo" scope="session" />
<jsp:useBean id="user" class="com.me.spring.pojo.User" scope="session" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
int photoid = Integer.parseInt(request.getParameter("photoid"));
String content = (String)request.getParameter("commentcontent");
selectphoto = photodao.get(photoid);
commentdao.save(content,selectphoto,user);
out.print("<script language=javascript>alert('Add comment sucessfully!');window.location.href='photoselectone.jsp?photoid="+photoid+"';</script>");
%>

</body>
</html>