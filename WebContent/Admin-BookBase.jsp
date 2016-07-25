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
<strong>Book Database</strong><br>
</div>

<div id="section">
<h2>Delete Book</h2>
<%
String bname=request.getParameter("isbn");
if(bname==null||bname=="")
{
	%>
	<form method="get" action="Admin-BookBase.jsp">
	<p><strong>Book ISBN</strong> <input type="text" name="isbn"
		size="20"></p>
	<br> <input type="submit" value="Submit"> 
	<%
}
else
{
	store.remove_from_BookBase(bname);
	%>
	<p><strong>You have deleted Book, ISBN: <%=bname%></strong></p>
	<%
}
%>
<h1>List of Books</h1>
<%
Iterator<String> it=store.BookBase.keySet().iterator();
Book u;
while(it.hasNext())
{
	String x=it.next();
	u=store.BookBase.get(x);
	%>
	<%="Book Name : "+u.getTitle()+",	Isbn : "+u.getIsbn()+", Qty : "+u.getQty()%><br>
	<%
}
%>
</div>

<div id="footer">
Copyright © Epilogue
</div>

</body>