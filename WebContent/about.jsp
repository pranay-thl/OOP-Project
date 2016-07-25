<?xml version="1.0" ?>
 <%@ page language="java" session="true"%>
 <%@ page import="com.epilogue.*" %>
 <%@ page import="java.util.*" %>
<html xmlns="www.w3.org/2016/xhtml">
 <jsp:useBean id="admin" scope="session" class="com.epilogue.Admin" />
 <%-- create the javabean for the book store, so that all the collection of books are visible to all the pages in this session--%>
 <jsp:useBean id="store" scope="session" class="com.epilogue.BookStore" />
<head>
<title>Epilogue: About Us</title>
<link type="text/css" rel="stylesheet" href="Admin.css"/>
</head>

<body>
<div id="header">
<h1>Epilogue</h1>
</div>

<div id="section">
<a href="index.jsp"><h1>Epilogue</h1></a>
<h1><a name="Epilogue"></a></h1>
<p>Epilogue is the online store with the largest collection of latest and popular books.</p>
<p>Epilogue contains over 20,000 books and still increasing it's collection in order to give user it's best services.</p>
</div>

<div id="footer">
Copyright © Epilogue
</div>

</body>