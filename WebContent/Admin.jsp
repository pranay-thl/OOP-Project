<?xml version="1.0" ?>
 <%@ page language="java" session="true"%>
 <%@ page import="com.epilogue.*" %>
 <%@ page import="java.util.*" %>
<html xmlns="www.w3.org/2016/xhtml">
 <jsp:useBean id="admin" scope="session" class="com.epilogue.Admin" />
 <%-- create the javabean for the book store, so that all the collection of books are visible to all the pages in this session--%>
 <jsp:useBean id="store" scope="session" class="com.epilogue.BookStore" />
<head>
<title>Epilogue: Admin Panel</title>
<link type="text/css" rel="stylesheet" href="Admin.css"/>
</head>

<body>
<div id="header">
<h1>Epilogue</h1>
</div>

<div id="nav">
<a href="Admin-UserBase.jsp">User Base</a><br>
<a href="Admin-Addbook.jsp">Add Book</a><br>
<a href="Admin-BookBase.jsp">Book Base</a><br>
</div>

<div id="section">
<h1>Welcome <%=admin.getUsername()%></h1>
<p><a href="index.jsp">Home</a></p>
</div>

<div id="footer">
Copyright © Epilogue
</div>

</body>