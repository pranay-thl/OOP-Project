<?xml version="1.0" ?>
 <%@ page language="java" session="true"%>
 <%@ page import="com.epilogue.*" %>
 <%@ page import="java.util.*" %>
<html xmlns="www.w3.org/2016/xhtml">
 <jsp:useBean id="admin" scope="session" class="com.epilogue.Admin" />
 <%-- create the javabean for the book store, so that all the collection of books are visible to all the pages in this session--%>
 <jsp:useBean id="store" scope="session" class="com.epilogue.BookStore" />
<head>
<title>Welcome Admin</title>
<link type="text/css" rel="stylesheet" href="Admin.css"/>
</head>

<body>
<div id="header">
<h1>Epilogue</h1>
</div>

<div id="nav">
<strong>User Database</strong><br>
</div>

<div id="section">
<h2>Delete User</h2>
<%
String uname=request.getParameter("username");
if(uname==null||uname=="")
{
	%>
	<form method="get" action="Admin-UserBase.jsp">
	<p><strong>Username</strong> <input type="text" name="username"
		size="20"></p>
	<br> <input type="submit" value="Submit"> 
	<%
}
else
{
	if(store.UserBase.containsKey(uname))
	{
		store.UserBase.remove(uname);
		store.connector.delete_from_table("user","username",uname);
		//store.remove_from_UserBase(uname);
	//System.out.println(store.getUserBase());
	%>
	<p><strong>You have deleted <%=uname%></strong></p>
	<%
	}
	else
	{
		%>
		<p><strong>User not Foud!</strong></p>
		<%
	}
}
%>
<h1>List of Users</h1>
<%
Iterator<String> it=store.UserBase.keySet().iterator();
User u;
while(it.hasNext())
{
	String x=it.next();
	u=store.UserBase.get(x);
	%>
	<%="Name :	"+u.getFname()+" "+u.getLname()+", Username :	"+u.getUsername()%><br>
	<%
}
%>
</div>

<div id="footer">
Copyright © Epilogue
</div>

</body>