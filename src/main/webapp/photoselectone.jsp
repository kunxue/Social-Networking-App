<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="javax.servlet.http.HttpSession" %>
<%@page import="java.util.List" %>
<%@page import="com.me.spring.pojo.Comment" %>
<%@page import="com.me.spring.pojo.User" %>
<jsp:useBean id="commentdao" class="com.me.spring.dao.CommentDAO" scope="session" />
<jsp:useBean id="photodao" class="com.me.spring.dao.PhotoDAO" scope="session" />
<jsp:useBean id="selectphoto" class="com.me.spring.pojo.Photo" scope="session" />
<jsp:useBean id="memberuser" class="com.me.spring.pojo.User" scope="session" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body background="images/3.jpg">
<% 
int Page=1;
int photoid = Integer.parseInt(request.getParameter("photoid"));
selectphoto = photodao.get(photoid);	
List commentlist = null;
commentlist = commentdao.getcomment(photoid);
%>
<table width="422" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td height="318"><img src="<%=selectphoto.getPhotoaddress()%>" height="300" width="400">&nbsp;</td>
  </tr>
</table>

<%
   if(commentlist.size() > 0)
   {
	   for(int i = 0;i< commentlist.size();i++)
	   {
		   Comment comment = (Comment)commentlist.get(i);
		   User user1 = comment.getUser();
%>
<div align="center">
	  <table width="345"  border="1" cellpadding="1" cellspacing="1" bordercolor="#FFFFFF" bgcolor="#fece62">
        <tr>
          <td width="47" bgcolor="#FFFFFF"><%=user1.getAccount()%> :</td>
          <td width="285" bgcolor="#FFFFFF"><%=comment.getContent()%></td>
        </tr>
      </table>	 
  </div>  
<% 		   
	   }
   }
%>

<form  name="form1" method="post" action="addcomment.jsp?photoid=<%=selectphoto.getId()%>">
  <p align="center" class="STYLE1">comment:
    <label>
    <textarea name="commentcontent" rows="5"></textarea>
    </label>
  </p>
  <p class="STYLE1">
    <label>
    <div align="center">
      <input type="submit" name="Submit" value="Submit" />
    </div>
    </label>
  </p>
     <div align="center">
  <%
  String ismember = request.getParameter("ismember");
if(ismember == null)
{
%>
  <p><a href="viewphoto.jsp" class="STYLE1">Back</a></p>
<%
}
else
{
%>
 <p><a href="viewmemberphoto.jsp?member=<%=memberuser.getAccount()%>" class="STYLE1">Back</a></p>
 <%
}
 %>
     </div>
  <p>&nbsp;</p>
  <p>&nbsp;</p>
  <p>&nbsp;</p>
  <p>&nbsp;</p>
  <p>&nbsp;</p>
  <p>&nbsp;</p>
</form>

</body>
</html>