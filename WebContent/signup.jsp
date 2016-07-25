<?xml version="1.0" ?>
<html xmlns="www.w3.org/2016/xhtml">
 <%@ page language="java" session="true"%>
 <%@ page import="com.epilogue.*" %>
 <%@ page import="java.util.*" %>
<head>
<title>Epilogue: The Perfect BookStore</title>
</head>
<jsp:useBean id="store" scope="session" class="com.epilogue.BookStore" />
<link type="text/css" rel="stylesheet" href="signup.css" />
<body>
<%
	User Userx=new User();
	boolean form_status = true;
	String username= request.getParameter("username");
	String fname = request.getParameter("FirstName");
	String lname =request.getParameter("LastName");
	String pass = request.getParameter("pass");
	String address = request.getParameter("Address");
	String phone = request.getParameter("PhoneNo");
	String email = request.getParameter("mail");
	//System.out.println(fname+" "+lname+" "+pass);
	if ((username == null||username=="") || (fname == null||fname=="") || (lname == null||lname=="") || (pass == null||pass=="")|| (address== null||address=="")|| (phone == null||phone=="")|| (email == null||email==""))
		form_status = false;
	if (form_status == true) {
		if(store.UserBase.containsKey(username))
		{
			%>
			<center>
			<p><strong><font color="#EEE8AA">Username taken, choose a diffrent username!</strong></p>
			<p><a href="index.jsp">Click here to go back:</a></p>
			</center>
			<% 
		}
		else
		{
		//System.out.println("Hello "+fname+" "+lname+" "+pass+" ");
		Userx.setUsername(username);
		Userx.setPassword(pass);
		Userx.setFname(fname);
		Userx.setLname(lname);
		Userx.setAddress(address);
		Userx.setPhone(phone);
		Userx.setEmail(email);
		store.connector.insert_into_table("user",Userx);
		store.UserBase.put(username,Userx);
		//store.insert_into_userbase(Userx);
		//System.out.println(store.getUserBase());
%>
<center>
<p><strong><font color="#EEE8AA">Hello <%=fname%>, you have successfully
registered!</strong></p>
<p><a href="index.jsp">Click here to go back:</a></p>
</center>
<%}
	} else {
%>
<center>
<h1><strong><font color="#EEE8AA"><u>User Sign Up</u></strong></h1>
<form method="get" action="signup.jsp">
<p><strong>Username</strong> <input type="text" name="username"
	size="25"></p>
<p><strong>First Name</strong> <input type="text" name="FirstName"
	size="25"></p>
<p><strong>Last Name</strong> <input type="text" name="LastName"
	size="25"></p>
<p><strong>Password</strong> <input name="pass" type="password"
	size="6"></p>
<p><strong>Address</strong> <input type="text" name="Address"
	size=50></textarea></p>
<p><strong>Mobile No</strong> <input type="text" name="PhoneNo"
	size="10"></p>
<p><strong>Email</strong> <input name="mail" type="id" size="30">
<br><br> <input type="submit" value="Submit"> <input
	type="reset" value="reset">
<p>Already have an account? <a href="login.jsp">Sign in</a></p>
</form>
</center>
<%
	}
%>
</body>
</html>