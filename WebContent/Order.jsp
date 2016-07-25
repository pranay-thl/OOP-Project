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
	 if(session.getAttribute("adminloginStatus")!=null&&(Boolean)session.getAttribute("adminloginStatus")==true)
	 {
		 response.sendRedirect("Admin.jsp");
	 }
 }
 %>
<head>
<title>Cart</title>
<link type="text/css" rel="stylesheet" href="cart.css"/>
</head>

<body>

<div id="header">
<h1>Review You Order</h1>
</div>
<div id="display">
<br/>
<strong><p><h2>&nbsp&nbspDelivery Address</h2></p></strong>
<p>&nbsp&nbsp<%=user.getFname()%> <%=user.getLname() %></p>
<p>&nbsp&nbsp<%=user.getAddress()%></p>
<p>&nbsp&nbspPhone: <%=user.getPhone() %></p>
<div id="display">
<%
float total_price=0;
int total_qty=0;
String send;
if(request.getParameter("book").equals("cart")==true)
{
	send="cart";
Iterator<String> it=user.cart.keySet().iterator();
String ss;
int in=0;

while(it.hasNext())
{
	ss=it.next();
	total_qty++;
	total_price+=Float.parseFloat(store.BookBase.get(ss).getPrice());
%>
<div>
<a href="Book.jsp?book=<%=store.BookBase.get(ss).getIsbn()%>"><img src="data/book/<%=ss%>.jpg"  alt="Mountain View" style="width:104px;height:128px;"></a>
<h3><br/><%=store.BookBase.get(ss).getTitle()%></h3></a>
<img src="data/r.png" /><br/><%=store.BookBase.get(ss).getPrice()%>
<br/>
<br/><br/><br/><br/></br>
<br/>
<%
}
}
else
{
	String ss=request.getParameter("book");
	send=request.getParameter("book");
	total_qty=1;
	total_price=Float.parseFloat(store.BookBase.get(ss).getPrice());
%>
<div>
<a href="Book.jsp?book=<%=store.BookBase.get(ss).getIsbn()%>"><img src="data/book/<%=ss%>.jpg"  alt="Mountain View" style="width:104px;height:128px;"></a>
<h3><br/><%=store.BookBase.get(ss).getTitle()%></h3></a>
<img src="data/r.png" /><br/><%=store.BookBase.get(ss).getPrice()%>
<br/>
<br/><br/><br/><br/></br>
<br/>
<%
}
%>
 <br/> <br/>
 <p><strong>Total Quantitiy=<%=total_qty%></strong></p><br/>
 <p><strong>Total Price= Rs.<%=total_price%></strong></p><br/>
  <a href="transact.jsp?complete=<%=send%>">
 <img src="data/button.jpg"/></a>
 
 <br/> <br/> <br/> <br/><br/><br/>
</div>


<div id="footer"> 
Copyright � Epilogue
 </div> 

</body>
</html>