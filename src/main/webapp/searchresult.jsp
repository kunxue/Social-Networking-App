<%@page import="com.me.spring.pojo.User" %>
<%@page import="javax.servlet.http.HttpSession" %>
<%@page import="java.util.List" %>
<%@page import="com.me.spring.dao.ContactlistDAO" %>
<%@page import="com.me.spring.dao.DAO" %>
<jsp:useBean id="user" class="com.me.spring.pojo.User" scope="session" />
<jsp:useBean id="pagination" class="com.me.spring.controllers.MyPagination" scope="session" />

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Search result</title>
<style type="text/css">
<!--
.STYLE1 {
	color: #FF0000;
	font-size: xx-large;
}
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
String selectaccount=(String)request.getParameter("selectaccount");
int Page=1;
if(selectaccount != null)
{   
  
    ContactlistDAO contactlistdao = new ContactlistDAO();
    if(contactlistdao.havecontact(user.getAccount(),selectaccount)== true)
    {
    	Page=pagination.getPage(str);
    	out.print("<script language=javascript>alert('The member have been in your contactlist');window.location.href='searchresult.jsp?Page="+Page+"';</script>");
    }
    else if((user.getAccount().equals(selectaccount) == true))
    {
 
       	Page=pagination.getPage(str);
      	out.print("<script language=javascript>alert('Can not add yourself!');window.location.href='searchresult.jsp?Page="+Page+"';</script>");
    }
    else
    {  
    contactlistdao.save(user.getAccount(),selectaccount);
    contactlistdao.save(selectaccount,user.getAccount());
	Page=pagination.getPage(str);
	out.print("<script language=javascript>alert('Add member sucessfully,continue');window.location.href='searchresult.jsp?Page="+Page+"';</script>");
    }
    DAO.close();
}

List userlist1 = null;
if(str == null) 
{	
	userlist1 = (List)session.getAttribute("userlist");
	int pagesize = 2;
	userlist1 = pagination.getInitPage(userlist1,Page,pagesize); 
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
<% 
out.print("<a href='searchresult.jsp?selectaccount="+user1.getAccount()+"'class="+"'STYLE1'"+">Add to Contactlist</a>");
%>
<div align="right" class="style6">  <hr></div>
<%} %>
 <%=pagination.printCtrl(Page,"searchresult.jsp") %>
</body>
</html>