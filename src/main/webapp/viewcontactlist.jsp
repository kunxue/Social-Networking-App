<%@page import="com.me.spring.pojo.User" %>
<%@page import="com.me.spring.pojo.Contactlist" %>
<%@page import="javax.servlet.http.HttpSession" %>
<%@page import="java.util.List" %>
<%@page import="java.util.ArrayList" %>
<%@page import="com.me.spring.dao.ContactlistDAO" %>
<%@page import="com.me.spring.dao.UserDAO" %>
<%@page import="com.me.spring.dao.DAO" %>
<jsp:useBean id="user" class="com.me.spring.pojo.User" scope="session" />
<jsp:useBean id="pagination" class="com.me.spring.controllers.MyPagination" scope="session" />
<jsp:useBean id="contactlistdao" class="com.me.spring.dao.ContactlistDAO" scope="session" />
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<style type="text/css">
<!--
.STYLE2 {
	color: #000000;
	font-size: x-large;
	font-weight: bold;
}
.STYLE4 {
	font-size: x-large;
	color: #000000;
}
.STYLE5 {font-size: x-large}
.style6 {color: #77642c}
-->
</style>
</head>
<body background="images/2.jpg">
<%

String str=(String)request.getParameter("Page");
String deleteaccount = (String)request.getParameter("account");
int Page=1;
int j;
List  userlist1 = new ArrayList();
if(deleteaccount != null)
{  
	contactlistdao.delete(user.getAccount(),deleteaccount);
	contactlistdao.delete(deleteaccount,user.getAccount());
	out.print("<script language=javascript>alert('Delete contact sucessfully!');window.location.href='viewcontactlist.jsp';</script>");
}
if(str == null) 
{	
    UserDAO userdao = new UserDAO();
	List  contactlist = contactlistdao.get(user.getAccount());
	for(j = 0;j < contactlist.size();j++)
	{
		Contactlist contact = (Contactlist)contactlist.get(j);
		User user1 = (User)userdao.get(contact.getContact());
		userlist1.add(user1);
	}
	int pagesize = 2;
	userlist1 = pagination.getInitPage(userlist1,Page,pagesize); 
    DAO.close();
}
else 
{	
	Page=pagination.getPage(str);
	userlist1=pagination.getAppointPage(Page);  
}
%>
<%
  int i = 0;
 for(i = 0; i < userlist1.size();i++)
 {
	 User user1 = (User)userlist1.get(i);
%>
<table width="506" border="1" bordercolor="#FFFFFF">
  <tr>
    <td width="202"><span class="STYLE2">Account:</span></td>
    <td width="288"><span class="STYLE5"><%=user1.getAccount()%></span></td>
  </tr>
  <tr>
    <td><span class="STYLE4">Name:</span></td>
    <td><span class="STYLE5"><%=user1.getName()%></span></td>
  </tr>
  <tr>
    <td><span class="STYLE4">MSN:</span></td>
    <td><span class="STYLE5"><%=user1.getMsn()%></span></td>
  </tr>
  <tr>
    <td><span class="STYLE5">Email:</span></td>
    <td><span class="STYLE5"><%=user1.getEmail()%></span></td>
  </tr>
  <tr>
    <td><span class="STYLE5">Address:</span></td>
    <td><span class="STYLE5"><%=user1.getAddress()%></span></td>
  </tr>
  <tr>
    <td><span class="STYLE5">Gender:</span></td>
    <td><span class="STYLE5"><%=user1.getGender()%></span></td>
  </tr>
</table>

<div align="right" class="style6">
  <div align="left"><a href="viewcontactlist.jsp?account=<%=user1.getAccount()%>" class="STYLE5">Delete</a>  
    <span class="STYLE5">&nbsp;&nbsp;</span><a href="viewmembercontactlist.jsp?member=<%=user1.getAccount()%>" class="STYLE5">View his/her contactlist</a><span class="STYLE5">&nbsp;&nbsp;&nbsp;&nbsp;</span><a href="viewmemberphoto.jsp?member=<%=user1.getAccount()%>" class="STYLE5">View his/her photos</a></div>
<hr></div>
<%} %>
 <%=pagination.printCtrl(Page,"viewcontactlist.jsp") %>
</body>
</html>