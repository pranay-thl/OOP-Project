<?xml version="1.0" ?>
<html xmlns="www.w3.org/2016/xhtml">
 <%@ page language="java" session="true"%>
 <jsp:useBean id="user" scope="session" class="com.epilogue.User" />
 <jsp:useBean id="admin" scope="session" class="com.epilogue.Admin" />
 <%-- create the javabean for the book store, so that all the collection of books are visible to all the pages in this session--%>
 <jsp:useBean id="store" scope="application" class="com.epilogue.BookStore" />
<head>
<title>Epilogue- Login Page</title>
</head>
<link type="text/css" rel="stylesheet" href="signup.css" />
<body>
<% session.setAttribute("loginStatus",new Boolean(false));
	user.wishlist.clear();
	user.cart.clear();
	user=null;
	session.setAttribute("adminloginStatus",new Boolean(false));
	admin=null;
	response.sendRedirect("index.jsp");
%>
</body>
</html>

	