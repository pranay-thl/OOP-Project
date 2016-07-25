<?xml version="1.0" ?>
 <%@ page language="java" session="true"%>
 <%@ page import="com.epilogue.*" %>
 <%@ page import="java.util.*" %>
<html xmlns="www.w3.org/2016/xhtml">
 <jsp:useBean id="user" scope="session" class="com.epilogue.User" />
 <%-- create the javabean for the book store, so that all the collection of books are visible to all the pages in this session--%>
 <jsp:useBean id="store" scope="session" class="com.epilogue.BookStore" />
<head>
<title>Epilogue: User Panel</title>
<link type="text/css" rel="stylesheet" href="Admin.css"/>
</head>

<body>
<div id="header">
<h1>Book Store</h1>
</div>

<div id="nav">
<a href="Wishlist.jsp?book=ignore_this">Wish List</a><br>
<a href="cart.jsp?book=ignore_this">Cart</a><br>
<a href="User-OrderHistory.jsp">Order History</a><br>
</div>

<div id="section">
<h1>Welcome <%=user.getUsername()%></h1>
<p><a href="index.jsp">Home</a></p>
</div>

<div id="footer">
Copyright � Epilogue
</div>

</body>