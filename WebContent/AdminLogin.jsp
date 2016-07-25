<?xml version="1.0" ?>
<html xmlns="www.w3.org/2016/xhtml">
 <%@ page language="java" session="true"%>
 <%@ page import="com.epilogue.*" %>
 <jsp:useBean id="admin" scope="session" class="com.epilogue.Admin" />
 <%-- create the javabean for the book store, so that all the collection of books are visible to all the pages in this session--%>
 <jsp:useBean id="store" scope="application" class="com.epilogue.BookStore" />
<head>
<title>Epilogue: Admin Login Page</title>
<link type="text/css" rel="stylesheet" href="AdminLogin.css"/>
</head>
<body>
<%
	String username= request.getParameter("username");
	String pass = request.getParameter("pass");
	//System.out.println(fname+" "+lname+" "+pass);
	
	if(store.AuthenticateAdmin(username,pass))
	{
		session.setAttribute("adminloginStatus", new Boolean(true));
		admin.setUsername(username);
		 response.sendRedirect("Admin.jsp");
	}
	else
	{
		session.setAttribute("adminloginStatus", new Boolean(false));
%>
<center>
<h1><strong><font color="#EEE8AA"><u>Admin Login</u></strong></h1>
<form method="get" action="AdminLogin.jsp">
<p><strong>Username</strong>
<input type="text" name="username" size="25">
</p>
<p><strong>Password</strong>
<input name="pass" type="password" size="6"></p>
<input type="submit" value="Submit">
</form>
</center>
<% }%>
</body>
</html>