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
         <%
 if((session.getAttribute("loginStatus")==null||(Boolean)session.getAttribute("loginStatus")==false)&&(session.getAttribute("adminloginStatus")==null||(Boolean)session.getAttribute("adminloginStatus")==false))
 {
	 response.sendRedirect("login.jsp");
 }
 else
 {
	 if(session.getAttribute("adminloginStatus")==null||(Boolean)session.getAttribute("adminloginStatus")==false)
	 {
		 if(request.getParameter("book").equals("ignore_this")==false)
		 {
		 if(user.wishlist.containsKey(request.getParameter("book")))
		 {
			 %>
			<p>This book is already in your wishlist!<p>
			 <%
		 }
		 else
		 {
		 user.addToWishlist(store.BookBase.get(request.getParameter("book")));
		 %>
		 <p>Added <%=store.BookBase.get(request.getParameter("book")).getTitle() %> to you wishlist</p>
		 <%
		 }
		 }
	 }
	 else
	 {
		 %>
		 <p>You Already own all the books <%=admin.getUsername() %></p>
		 <%
	 }
 }
 %>
        
<head>
<title>Wishlist</title>
<link type="text/css" rel="stylesheet" href="wishlist.css"/>
</head>

<body>

<div id="header">
<h1>Your Wishlist</h1>
</div>
<div id="display">
<%
Iterator<String> it=user.wishlist.keySet().iterator();
String ss;
int in=0;
while(it.hasNext())
{
	ss=it.next();
	in++;
%>
<div>
<a href="Book.jsp?book=<%=ss%>"><img src="data/book/<%=ss%>.jpg"  alt="Mountain View" style="width:104px;height:128px;"></a>
<h3><br/><%=store.BookBase.get(ss).getTitle()%></h3></a>
<img src="data/r.png" /><br/><%=store.BookBase.get(ss).getPrice()%>
<br/>
 <a href="cart.jsp?book=<%=ss%>"><img src="data/check.gif"/></a>
<br/><br/><br/><br/></br>
<br/>
<%
}
%>
 <br/> <br/>
</div>


<div id="footer"> 
Copyright © Epilogue
 </div> 

</body>
</html>