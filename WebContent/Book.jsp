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
        <%Book currBook=store.BookBase.get(request.getParameter("book"));%>
<head>
<title>Epilogue: The Online Book Store</title>
</head>
<head>
<title>Home</title>
<link type="text/css" rel="stylesheet" href="Book.css" />
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

<div id="display">
<img src="data/book/<%=currBook.getIsbn()%>.jpg" alt="Mountain View" style="width:204px;height:278px;"/>
</br>
<h1><%=currBook.getTitle() %></h1>
</br>
<p><img src="data/r.png"/><br/><%=currBook.getPrice() %></a>
<br/><br/>
<strong><p>&nbsp&nbsp&nbsp&nbspISBN : <%=currBook.getIsbn() %></strong></p>
<br/>
 <a href="Order.jsp?book=<%=currBook.getIsbn()%>">
 <img src="data/button.jpg"/></a>
 <a href="cart.jsp?book=<%=currBook.getIsbn()%>"><img src="data/cart.png"/></a>
<a href="Wishlist.jsp?book=<%=currBook.getIsbn()%>"><img src="data/wishlist.jpg"/></a>
 </a>
 <br/> <br/> <br/> <br/><br/><br/>
<p>&nbsp&nbsp&nbsp<%=currBook.getDescription()%></p>
</div>

</br></br></br></br>
<div id="footer">
Copyright © Epilogue
</div>

</body>
</html>