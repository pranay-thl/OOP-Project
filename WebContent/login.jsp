<?xml version="1.0" ?>
<html xmlns="www.w3.org/2016/xhtml">
 <%@ page language="java" session="true"%>
 <%@ page import="com.epilogue.*" %>
<head>
<title>Epilogue- Login Page</title>
</head>
 <jsp:useBean id="user" scope="session" class="com.epilogue.User" />
 <%-- create the javabean for the book store, so that all the collection of books are visible to all the pages in this session--%>
 <jsp:useBean id="store" scope="session" class="com.epilogue.BookStore" />
<link type="text/css" rel="stylesheet" href="login.css" />
<body>
<%
	String username= request.getParameter("username");
	String pass = request.getParameter("pass");
	//System.out.println(fname+" "+lname+" "+pass);
	
	if(store.AuthenticateUser(username,pass))
	{
		//System.out.println(store.getUserBase());
		session.setAttribute("loginStatus", new Boolean(true));
		user.setUsername(username);
		user.setAddress(store.UserBase.get(username).getAddress());
		user.setFname(store.UserBase.get(username).getFname());
		user.setLname(store.UserBase.get(username).getLname());
		user.setPhone(store.UserBase.get(username).getPhone());
		user.init_Wishlist();
		user.init_cart();
		response.sendRedirect("index.jsp");
	}
	else
	{
		session.setAttribute("loginStatus", new Boolean(false));
		user=null;
%>
<center>
<h1><strong><font color="#EEE8AA"><u>User Login</u></strong></h1>
<form method="get" action="login.jsp">
<p><strong>Username</strong> <input type="text" name="username"
	size="25"></p>
<p><strong>Password</strong> <input name="pass" type="password"
	size="6"></p>
<!--<p><strong>male</strong>
<input type="radio" value="male"<hacked>&nbsp&nbsp</p>
<p><strong>female</strong>
<option><input type="radio" value="female"<hacked>&nbsp;</p>--> <input
	type="submit" value="Login"> <!--<input type="reset" value="reset">-->
<p><a href="signup.jsp">CREATE NEW ACCOUNT</a></p>
<p>By signing in you are agreeing to our Conditions of</p>
<p>Use and Sale and our Privacy Notice</p></form>
</center>
<%
	}
%>
</body>
</html>