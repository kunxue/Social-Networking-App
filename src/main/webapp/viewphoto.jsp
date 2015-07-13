<%@page import="com.me.spring.pojo.User" %>
<%@page import="com.me.spring.pojo.Photo" %>
<%@page import="javax.servlet.http.HttpSession" %>
<%@page import="java.util.List" %>
<%@page import="com.me.spring.dao.ContactlistDAO" %>
<%@page import="com.me.spring.dao.DAO" %>
<jsp:useBean id="user" class="com.me.spring.pojo.User" scope="session" />
<jsp:useBean id="pagination" class="com.me.spring.controllers.MyPagination" scope="session" />
<jsp:useBean id="photodao" class="com.me.spring.dao.PhotoDAO" scope="session" />
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>View photos</title>
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

String deleteid = (String)request.getParameter("id");
String str=(String)request.getParameter("Page");
int Page=1;
if (deleteid != null)
{
	int id = Integer.parseInt(deleteid);
	photodao.delete(id);
	out.print("<script language=javascript>alert('Delete photo sucessfully!');window.location.href='viewphoto.jsp';</script>");
}
List photolist = null;
if(str == null) 
{	
	photolist = (List)photodao.getphoto(user.getId());
	int pagesize = 4;
	photolist = pagination.getInitPage(photolist,Page,pagesize); 
}
else 
{	
	Page=pagination.getPage(str);
	photolist=pagination.getAppointPage(Page);  
}
%>
         <table width="455" border="1" align="center" cellpadding="1" cellspacing="1" bordercolor="#FFFFFF"  bgcolor="#FEce62">
            <%for(int i=0;i<photolist.size();i++){
  Photo photo=(Photo)photolist.get(i);
if(i % 2 ==0 ){
%>
            <tr bgcolor="#FFFFFF">
              <td width="230"><div align="center">
                <table width="200" border="0" align="center" cellpadding="0" cellspacing="0">
                    <tr>
                     <td height="150"><div align="center"><a href="photoselectone.jsp?photoid=<%=photo.getId()%>" onClick=""><img src="<%=photo.getPhotoaddress()%>" width="160" height="140"></a></div></td>
                    </tr>
                    <tr>
                      <td height="20"><div align="center"><%=photo.getPhotodescription()%></div></td>
                    </tr>
                    <tr>
                      <td height="20"><div align="center"><a href="viewphoto.jsp?id=<%=photo.getId()%>">delete</a></div></td>
                    </tr>
                              </table>
              </div></td>
              
              <%}else{%>
              <td width="212"><div align="center">
                <table width="200" border="0" align="center" cellpadding="0" cellspacing="0">
                  <tr>
                    <td height="150"><div align="center"><a href="photoselectone.jsp?photoid=<%=photo.getId()%>" onClick=""><img src="<%=photo.getPhotoaddress()%>" width="160" height="140"></a></div></td>
                  </tr>
                  <tr>
                    <td height="20"><div align="center"><%=photo.getPhotodescription()%></div></td>
                  </tr>
                  <tr>
                    <td height="20"><div align="center"><a href="viewphoto.jsp?id=<%=photo.getId()%>">delete</a></div></td>
                  </tr>
                </table>
                </div>                </td>
            </tr>
            <%}
					}%>
            <%if(photolist.size()%2 ==1){%>
  <td bgcolor="#FFFFFF"><div align="center">
    <table width="200" border="0" align="center" cellpadding="0" cellspacing="0">
      <tr>
        <td height="150"><div align="center"></div></td>
      </tr>
      <tr>
        <td height="20"><div align="center"></div></td>
      </tr>
      <tr>
        <td height="20"><div align="center"></div></td>
      </tr>
    </table>
    </div></td>

  <%}%> 
   </tr>
          </table>
          <%=pagination.printCtrl(Page,"viewphoto.jsp") %>
</body>
</html>