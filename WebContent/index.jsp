<?xml version="1.0" ?>
<html xmlns="www.w3.org/2016/xhtml">
<%-- import the required packages into the jsp --%>
        <%@ page language="java" session="true"%>
        <%@ page import="java.util.Iterator" %>
		<%@ page import="com.epilogue.*" %>
        <%-- create the session attributes/values that will be visible to all the pages participating in this session, they are sort of universally used values by all the pages in the current session --%>

        <%-- create the 'login' session attribute to create uniform login information throughout the user session--%>
		<jsp:useBean id="user" scope="session" class="com.epilogue.User" />
		<jsp:useBean id="admin" scope="session" class="com.epilogue.Admin" />
        <%-- create the javabean for the book store, so that all the collection of books are visible to all the pages in this session--%>
        <jsp:useBean id="store" scope="session" class="com.epilogue.BookStore" />
<head>
<title>Epilogue: The Online Book Store</title>
</head>
<head>
<title>Home</title>
<link type="text/css" rel="stylesheet" href="index.css" />
</head>

<body>

<div id="header">
<h1>Epilogue</h1>
</div>
<ul>
  <li><a href="index.jsp">Home</a></li>
  <li><a href="about.jsp">About Us</a></li>
  <% //boolean status=(Boolean)session.getAttribute("loginStatus");
     //boolean adminstatus=(Boolean)session.getAttribute("adminloginStatus");
  if((session.getAttribute("loginStatus")==null||(Boolean)session.getAttribute("loginStatus")==false)&&(session.getAttribute("adminloginStatus")==null||(Boolean)session.getAttribute("adminloginStatus")==false))
  {%>
  
  <li><b><a href="signup.jsp">Sign up</a></b></li>
   <li><b><a href="login.jsp">Sign in</a></b></li>
   <li><b><a href="AdminLogin.jsp">Admin</a></b></li>
   <%
  }
   else
   {
	   if(session.getAttribute("adminloginStatus")==null||(Boolean)session.getAttribute("adminloginStatus")==false)
	   {
	   %>
	   <li><b><a href="User.jsp"><%=user.getUsername()%></a></b></li>
	   <li><b><a href="logout.jsp">Log out</a></b></li>
	   
	   <%
	   }
	   else
	   {
		   %>
		   <li><b><a href="Admin.jsp"><%=admin.getUsername()%></a></b></li>
		   <li><b><a href="logout.jsp">Log out</a></b></li>
		   
		   <%
	   }
   }
   %>
</ul>


<div id="nav">

</div>
<div id="section0">
<p>
  &nbspSearch Book:
  <%
  String st=request.getParameter("booktitle");
  if(st==null||st=="")
  {
  %>
  <form method="get" action="index.jsp">
  &nbsp<input type="search" name="booktitle">
  &nbsp<input type="submit" value="Go"/>
  <%
  }
  else
  {
	  String k=store.keyFinder(st);
	  //System.out.println(k);
	  if(k!="")
	  	response.sendRedirect("Book.jsp?book="+k);
	  else
	  {
		  %>
		  	Not Found!
		  <%
	  }
  }
  %>
</p>
</div>
<div id="section">
</div>
<br/><br/></br><br/>

<div id="section1">
<h3>&nbspMost Popular</h3>
<%
int in=0;
while(in<store.length&&in<9)
{
%>
<div>
<a href="Book.jsp?book=<%=store.MostPopular[in]%>"><img src="data/book/<%=store.MostPopular[in]%>.jpg"  alt="Mountain View" style="width:104px;height:128px;"></a>
</div>
<%
in++;
}
%>
<br><br><div id="section2">
</br></br>
<h3>Latest Releases</h3>
<%
Iterator<String> it=store.BookBase.keySet().iterator();
String ss;
in=0;
while(it.hasNext()&&in<9)
{
	ss=it.next();
	in++;
%>
<div>
<a href="Book.jsp?book=<%=ss%>"><img src="data/book/<%=ss%>.jpg"  alt="Mountain View" style="width:104px;height:128px;"></a>
</div>
<%
}
%>
</div>
</div>
</br></br></br></br>
<div id="footer">
Copyright © Epilogue
</div>

</body>
</html>