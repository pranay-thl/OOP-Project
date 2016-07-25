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
<strong>Add Book to Database</strong><br>
</div>

<div id="section">
<%
	Book book=new Book();
	boolean form_status = true;
	String title= request.getParameter("Title");
	String author = request.getParameter("Author");
	String publisher=request.getParameter("Publisher");
	String isbn= request.getParameter("Isbn");
	String price= request.getParameter("Price");
	String rating= request.getParameter("Rating");
	String qty= request.getParameter("Qty");
	String copies_sold= request.getParameter("Copies_sold");
	String publish_date= request.getParameter("Publish_date");
	String description= request.getParameter("Description");
	String category_id= request.getParameter("Category_id");
	//System.out.println(fname+" "+lname+" "+pass);
	if ((title == null||title=="") || (author == null||author=="") || (publisher == null||publisher=="") || (isbn == null||isbn=="")|| (price== null||price=="")|| (rating == null||rating=="")|| (qty == null||qty=="")|| (copies_sold == null||copies_sold=="")|| (publish_date == null||publish_date=="")|| (description == null||description=="")|| (category_id == null||category_id==""))
	{
		//System.out.println(isbn);
		form_status=false;
	}
	if (form_status == true) {
		if(store.BookBase.containsKey(isbn))
		{
			%>
			<center>
			<p><strong>Duplicate ISBN!</strong></p>
			<p><a href="Admin.jsp">Click here to go back:</a></p>
			</center>
			<% 
		}
		else
		{
		book.setTitle(title);
		book.setAuthor(author);
		book.setPublisher(publisher);
		book.setIsbn(isbn);
		book.setPrice(price);
		book.setRating(Integer.parseInt(rating));
		book.setQty(Integer.parseInt(qty));
		book.setCopies_sold(Integer.parseInt(copies_sold));
		book.setPublish_date(publish_date);
		book.setDescription(description);
		book.setCategory_id(Integer.parseInt(category_id));
		store.connector.insert_into_table("book",book);
		store.BookBase.put(book.getIsbn(),book);
%>
<p><strong>Successfully inserted into Book Database</strong></p>
<p><a href="Admin.jsp">Click here to go back:</a></p>
<%
	}
	} else {
%>
<center>
<h1><strong><u>Add Book</u></strong></h1>
<form method="get" action="Admin-Addbook.jsp">
<p><strong>Title</strong> <input type="text" name="Title"
	size="25"></p>
<p><strong>Author</strong> <input type="text" name="Author"
	size="25"></p>
<p><strong>Publisher</strong> <input type="text" name="Publisher"
	size="25"></p>
<p><strong>Isbn</strong> <input name="Isbn" type="text"
	size="25"></p>
<p><strong>Price</strong> <input type="text" name="Price"
	size=6></textarea></p>
<p><strong>Rating</strong> <input type="text" name="Rating"
	size="3"></p>
<p><strong>Quantity</strong> <input name="Qty" type="text" size="3">
<p><strong>Copies Sold</strong> <input type="text" name="Copies_sold"
	size="3"></p>
	<p><strong>Publish Date</strong> <input type="text" name="Publish_date"
	size="10"></p>
	<p><strong>Description</strong> <input type="text" name="Description"
	size="25"></p>
	<p><strong>Category ID</strong> <input type="text" name="Category_id"
	size="3"></p>
<br><br> <input type="submit" value="Submit"> <input
	type="reset" value="reset">
</form>
</center>
<%
	}
%>
</div>

<div id="footer">
Copyright © Epilogue
</div>

</body>