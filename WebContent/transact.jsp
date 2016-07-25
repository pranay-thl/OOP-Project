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
<title>Cart</title>
<link type="text/css" rel="stylesheet" href="cart.css"/>
</head>

<body>
<%
if(request.getParameter("complete")==null||request.getParameter("complete")=="")
{
	response.sendRedirect("User.jsp");
}
%>
<div id="header">
<h1>Transaction Complete!</h1>
</div>
<div id="display">
<br/>
  <a href="User.jsp"><strong><p>&nbsp&nbspClick Here to go back!</p></strong>
 <br/> <br/> <br/> <br/><br/><br/>
</div>
<%
String key=request.getParameter("complete");
if(key.equals("cart"))
{
	user.complete_transaction(store);
}
else
{
	user.create_direct_transaction(key,store);
}
%>

<div id="footer"> 
Copyright © Epilogue
 </div> 

</body>
</html>