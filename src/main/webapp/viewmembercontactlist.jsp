<%@page import="com.me.spring.pojo.User" %>
<%@page import="com.me.spring.pojo.Contactlist" %>
<%@page import="javax.servlet.http.HttpSession" %>
<%@page import="java.util.List" %>
<%@page import="java.util.ArrayList" %>
<%@page import="com.me.spring.dao.ContactlistDAO" %>
<%@page import="com.me.spring.dao.UserDAO" %>
<%@page import="com.me.spring.dao.DAO" %>
<jsp:useBean id="user" class="com.me.spring.pojo.User" scope="session" />
<jsp:useBean id="memberuser" class="com.me.spring.pojo.User" scope="session" />
<jsp:useBean id="pagination" class="com.me.spring.controllers.MyPagination" scope="session" />
<jsp:useBean id="contactlistdao" class="com.me.spring.dao.ContactlistDAO" scope="session" />
<jsp:useBean id="userdao" class="com.me.spring.dao.UserDAO" scope="session" />
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
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
<body  background="images/2.jpg">
<%

String str=(String)request.getParameter("Page");
String member = (String)request.getParameter("member");
String selectaccount = (String)request.getParameter("selectaccount");
int Page=1;
int j;
List  userlist1 = new ArrayList();
if(member != null)
{  
	memberuser = userdao.get(member);
    session = request.getSession();
    session.setAttribute("memberuser", memberuser);	
}
if(selectaccount != null)
{   
 
    if(contactlistdao.havecontact(user.getAccount(),selectaccount)== true)
    {
    	Page=pagination.getPage(str);
    	out.print("<script language=javascript>alert('The member have been in your contactlist');window.location.href='viewmembercontactlist.jsp?Page="+Page+"';</script>");
    }
    else if((user.getAccount().equals(selectaccount) == true))
    {
 
       	Page=pagination.getPage(str);
      	out.print("<script language=javascript>alert('Can not add yourself!');window.location.href='viewmembercontactlist.jsp?Page="+Page+"';</script>");
    }
    else
    {  
    contactlistdao.save(user.getAccount(),selectaccount);
    contactlistdao.save(selectaccount,user.getAccount());
	Page=pagination.getPage(str);
	out.print("<script language=javascript>alert('Add member sucessfully,continue');window.location.href='viewmembercontactlist.jsp?Page="+Page+"';</script>");
    }
    DAO.close();
}

if(str == null) 
{	

	List  contactlist = contactlistdao.get(member);
	for(j = 0;j < contactlist.size();j++)
	{
		Contactlist contact = (Contactlist)contactlist.get(j);
		User user1 = (User)userdao.get(contact.getContact());
		if(!user1.getAccount().equals(user.getAccount()))
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
<span class="STYLE1">Your contact member:</span><span class="STYLE2">${memberuser.account}</span> <span class="STYLE1"> &nbsp;&nbsp;&nbsp;Email:</span> <span class="STYLE2">${memberuser.email}</span> &nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="STYLE1">&nbsp;<a href="right.jsp">Back</a></span>
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
out.print("<a href='viewmembercontactlist.jsp?Page="+Page+"&selectaccount="+user1.getAccount()+"'class="+"'STYLE1'"+">Add to Contactlist</a>");
%>
<%} %>
 <%=pagination.printCtrl(Page,"viewcontactlist.jsp") %>
</body>
</html>