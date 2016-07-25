package com.epilogue;
import java.sql.Connection;
import java.util.*;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
public class DatabaseConnector
{
		static final String JDBC_DRIVER = "com.mysql.jdbc.Driver";  
		static final String DB_URL = "jdbc:mysql://localhost:3306/epilogue";
		static final String USER = "root";
		static final String PASS = "obstacles";
		Connection conn = null;
		Statement stmt = null;
		public DatabaseConnector()
		{
			connectDatabase();
			createStatement();
		}
		public void connectDatabase()
	   {
		   try
	   		{
			      Class.forName("com.mysql.jdbc.Driver");
			      //System.out.println("Connecting to database...");
			      conn = DriverManager.getConnection(DB_URL,USER,PASS);
	   		}
	   		catch(SQLException e)
	   		{
		   		e.printStackTrace();
	   		}
		   	catch(Exception e)
		    {
		   		e.printStackTrace();
		    }
	   }
	   public void createStatement()
	   {
		   try
		   {
			   //System.out.println("Creating statement...");
			   stmt = conn.createStatement();
		   }
		   catch(SQLException e)
	   		{
		   		e.printStackTrace();
	   		}
		   	catch(Exception e)
		    {
		   		e.printStackTrace();
		    }
	   }
	   public void insert_into_table(String table,User x)
	   {
		   String s2=x.toString();
		   String s1="insert into "+table+" values("+s2+")";
		   try
		   {
		   		int k=stmt.executeUpdate(s1);
		   		//System.out.println("Successfully inserted Item into table "+table);
		   }
		   catch(SQLException e)
	   	   {
		   		e.printStackTrace();
	   	   }
		   catch(Exception e)
		   {
		   		e.printStackTrace();
		   }
	   }
	   public void insert_into_table(String table,Book x)
	   {
		   String s2=x.toString();
		   String s1="insert into "+table+" values("+s2+")";
		   try
		   {
		   		int k=stmt.executeUpdate(s1);
		   		//System.out.println("Successfully inserted Item into table "+table);
		   }
		   catch(SQLException e)
	   	   {
		   		e.printStackTrace();
	   	   }
		   catch(Exception e)
		   {
		   		e.printStackTrace();
		   }
	   }
	   public void insert_into_table(String table,String uname,String isbn)
	   {
		   String s1="insert into "+table+" values("+"'"+uname+"'"+","+"'"+isbn+"'"+")";
		   try
		   {
		   		int k=stmt.executeUpdate(s1);
		   		//System.out.println("Successfully inserted Item into table "+table);
		   }
		   catch(SQLException e)
	   	   {
		   		e.printStackTrace();
	   	   }
		   catch(Exception e)
		   {
		   		e.printStackTrace();
		   }
	   }
	   public void delete_from_table(String table,String column,String uname)
	   {
		   String s1="delete from "+table+" where "+column+"="+"'"+uname+"'";
		   //System.out.println(s1);
		   try
		   {
		   		int k=stmt.executeUpdate(s1);
		   		//System.out.println("Successfully inserted Item into table "+table);
		   }
		   catch(SQLException e)
	   	   {
		   		e.printStackTrace();
	   	   }
		   catch(Exception e)
		   {
		   		e.printStackTrace();
		   }
	   }
	   public void remove_from_wishlist(String uname,String isbn)
	   {
		   String s1="delete from wishlist where username="+"'"+uname+"'"+"and isbn="+"'"+isbn+"'";
		   //System.out.println(s1);
		   try
		   {
		   		int k=stmt.executeUpdate(s1);
		   		//System.out.println("Successfully inserted Item into table "+table);
		   }
		   catch(SQLException e)
	   	   {
		   		e.printStackTrace();
	   	   }
		   catch(Exception e)
		   {
		   		e.printStackTrace();
		   }
	   }
	   //for authenticating user directly from database
	   public boolean search(String table,String s,String p)
	   {
		   String s1="select * from "+table+" where username="+"'"+s+"'";
		   String username,pass;
		   ResultSet rs=null;
		   try
		   {
			   rs=stmt.executeQuery(s1);
			   if(rs.next())
			   {
				   username=rs.getString("username");
				   pass=rs.getString("password");
				   if(username.matches(s)&&pass.matches(p))
				   {
					   return true;
				   }
				   else
				   {
					   return false;
				   }
					   
				   
			   }
			   else
			   {
				   return false;
			   }
		   }
		   catch(SQLException e)
	   	   {
		   		e.printStackTrace();
	   	   }
		   catch(Exception e)
		   {
		   		e.printStackTrace();	
		   }
		   finally
		   {
			   try
			   {
				   rs.close();
			   }
			   catch(SQLException e)
		   	   {
			   		e.printStackTrace();
		   	   }
			   catch(Exception e)
			   {
			   		e.printStackTrace();	
			   }
		   }
		   return false;
	   }
	   public void LoadUserBase(HashMap<String,User> UserBase)
	   {
		   String s1="select * from user";
		   String username,password,fname,lname,address,phone,email;
		   ResultSet rs=null;
		   try
		   {
			   rs=stmt.executeQuery(s1);
			   while(rs.next())
			   {
				   User x=new User();
				   username=rs.getString("username");
				   password=rs.getString("password");
				   fname=rs.getString("fname");
				   lname=rs.getString("lname");
				   address=rs.getString("address");
				   phone=rs.getString("phone");
				   email=rs.getString("email"); 
				   x.setUsername(username);
				   x.setPassword(password);
				   x.setFname(fname);
				   x.setLname(lname);
				   x.setAddress(address);
				   x.setPhone(phone);
				   x.setEmail(email);
				   UserBase.put(username,x);
			   }
		   }
		   catch(SQLException e)
	   	   {
		   		e.printStackTrace();
	   	   }
		   catch(Exception e)
		   {
		   		e.printStackTrace();	
		   }
		   finally
		   {
			   try
			   {
				   rs.close();
			   }
			   catch(SQLException e)
		   	   {
			   		e.printStackTrace();
		   	   }
			   catch(Exception e)
			   {
			   		e.printStackTrace();	
			   }
		   }
	   }
	   public void LoadAdminBase(HashMap<String,Admin> AdminBase)
	   {
		   String s1="select * from admin";
		   String username,password,fname,lname,email;
		   ResultSet rs=null;
		   try
		   {
			   rs=stmt.executeQuery(s1);
			   while(rs.next())
			   {
				   Admin x=new Admin();
				   username=rs.getString("username");
				   password=rs.getString("password");
				   fname=rs.getString("fname");
				   lname=rs.getString("lname");
				   email=rs.getString("email"); 
				   x.setUsername(username);
				   x.setPassword(password);
				   x.setFname(fname);
				   x.setLname(lname);
				   x.setEmail(email);
				   AdminBase.put(username,x);
			   }
		   }
		   catch(SQLException e)
	   	   {
		   		e.printStackTrace();
	   	   }
		   catch(Exception e)
		   {
		   		e.printStackTrace();	
		   }
		   finally
		   {
			   try
			   {
				   rs.close();
			   }
			   catch(SQLException e)
		   	   {
			   		e.printStackTrace();
		   	   }
			   catch(Exception e)
			   {
			   		e.printStackTrace();	
			   }
		   }
	   }
	   public void LoadBookBase(HashMap<String,Book> BookBase)
	   {
		   String s1="select * from book";
		   ResultSet rs=null;
		   try
		   {
			   rs=stmt.executeQuery(s1);
			   while(rs.next())
			   {
				   Book book=new Book();
				   book.setTitle(rs.getString("title"));
				   book.setAuthor(rs.getString("author"));
				   book.setPublisher(rs.getString("publisher"));
				   book.setIsbn(rs.getString("isbn"));
				   book.setPrice(rs.getString("price"));
			       book.setRating(Integer.parseInt(rs.getString("rating")));
				   book.setQty(Integer.parseInt(rs.getString("qty")));
				   book.setCopies_sold(Integer.parseInt(rs.getString("copies_sold")));
				   book.setPublish_date(rs.getString("publish_date"));
			       book.setDescription(rs.getString("description"));
				   book.setCategory_id(Integer.parseInt(rs.getString("category_id")));
				   BookBase.put(book.getIsbn(),book);
			   }
		   }
		   catch(SQLException e)
	   	   {
		   		e.printStackTrace();
	   	   }
		   catch(Exception e)
		   {
		   		e.printStackTrace();	
		   }
		   finally
		   {
			   try
			   {
				   rs.close();
			   }
			   catch(SQLException e)
		   	   {
			   		e.printStackTrace();
		   	   }
			   catch(Exception e)
			   {
			   		e.printStackTrace();	
			   }
		   }
	   }
	   public void LoadOrderTable(HashMap<Integer,Order> ordertable)
	   {
		   String s1="select * from order_table";
		   ResultSet rs=null;
		   try
		   {
			   rs=stmt.executeQuery(s1);
			   while(rs.next())
			   {
				   Order od=new Order();
				   od.setOrder_id(rs.getInt("order_id"));
				   od.setQty(rs.getInt("qty"));
				   od.setShipping_address(rs.getString("shipping_address"));
				   od.setStatus(rs.getBoolean("status"));
				   od.setTotal_price(rs.getString("total_price"));
				   od.setUser_name(rs.getString("username"));
				   ordertable.put(new Integer(od.getOrder_id()),od);
			   }
		   }
		   catch(SQLException e)
	   	   {
		   		e.printStackTrace();
	   	   }
		   catch(Exception e)
		   {
		   		e.printStackTrace();	
		   }
		   finally
		   {
			   try
			   {
				   rs.close();
			   }
			   catch(SQLException e)
		   	   {
			   		e.printStackTrace();
		   	   }
			   catch(Exception e)
			   {
			   		e.printStackTrace();	
			   }
		   }
	   }
	   public void loadWishlist(HashMap<String,Book> wishlist,String uname)
	   {
		   String s1="select * from wishlist where username="+"'"+uname+"'";
		   ResultSet rs=null;
		   try
		   {
			   HashMap<String,Book> BookBase=new HashMap<String,Book>();
			   this.LoadBookBase(BookBase);
			   rs=stmt.executeQuery(s1);
			   while(rs.next())
			   {
				   String isbn=rs.getString("isbn");
				   Book book=BookBase.get(isbn);
				   wishlist.put(book.getIsbn(),book);
			   }
		   }
		   catch(SQLException e)
	   	   {
			   //System.out.println("wishlist");
		   		e.printStackTrace();
	   	   }
		   catch(Exception e)
		   {
		   		e.printStackTrace();	
		   }
		   finally
		   {
			   try
			   {
				   rs.close();
			   }
			   catch(SQLException e)
		   	   {
			   		e.printStackTrace();
		   	   }
			   catch(Exception e)
			   {
			   		e.printStackTrace();	
			   }
		   }
	   }
	   public void loadcart(HashMap<String,Book> cart,String uname)
	   {
		   int o_id=0;
		   String s1="select order_id from order_table where status=0 and username="+"'"+uname+"'";
		   String s;
		   ResultSet rs=null;
		   try
		   {
			   HashMap<String,Book> BookBase=new HashMap<String,Book>();
			   this.LoadBookBase(BookBase);
			   rs=stmt.executeQuery(s1);
			   while(rs.next())
			   {
				  o_id=rs.getInt("order_id");
				  //System.out.println("id found "+o_id);
			   }
			   String s2="select isbn from item where order_id="+o_id;
			   rs=stmt.executeQuery(s2);
			   while(rs.next())
			   {
				   s=rs.getString("isbn");
				   cart.put(s,BookBase.get(s));
				   //System.out.println("added "+BookBase.get(s));
			   }
		   }
		   catch(SQLException e)
	   	   {
		   		e.printStackTrace();
	   	   }
		   catch(Exception e)
		   {
		   		e.printStackTrace();	
		   }
		   finally
		   {
			   try
			   {
				   rs.close();
			   }
			   catch(SQLException e)
		   	   {
			   		e.printStackTrace();
		   	   }
			   catch(Exception e)
			   {
			   		e.printStackTrace();	
			   }
		   }
	   }
	   public boolean check_transaction_status(String uname)
	   {
		   String s1="select order_id from order_table where status=0 and username="+"'"+uname+"'";
		   ResultSet rs=null;
		   try
		   {
			   rs=stmt.executeQuery(s1);
			   if(rs.next())
			   {
				   return true;
			   }
			   else
				   return false;
		   }
		   catch(SQLException e)
	   	   {
			   System.out.println("wishlist");
		   		e.printStackTrace();
	   	   }
		   catch(Exception e)
		   {
		   		e.printStackTrace();	
		   }
		   finally
		   {
			   try
			   {
				   rs.close();
			   }
			   catch(SQLException e)
		   	   {
			   		e.printStackTrace();
		   	   }
			   catch(Exception e)
			   {
			   		e.printStackTrace();	
			   }
		   }
		   return false;
	   }
	   public void add_to_cart(String uname,Book book)
	   {
		   int o_id=0,qty=0;
		   float t_price=0;
		   String s1="select * from order_table where status=0 and username="+"'"+uname+"'";
		   ResultSet rs=null;
		   int k;
		   try
		   {
			   rs=stmt.executeQuery(s1);
			   if(rs.next())
			   {
				   o_id=rs.getInt("order_id");
				   t_price=rs.getFloat("total_price");
				   qty=rs.getInt("qty");
			   }
			   String s2="insert into item values("+o_id+","+"'"+book.getIsbn()+"'"+")";
			   String s3="update order_table set total_price="+(t_price+Float.parseFloat(book.getPrice()))+" where order_id="+o_id;
			   String s4="update order_table set qty="+(qty+1)+" where order_id="+o_id;
			   k=stmt.executeUpdate(s2);
			   k=stmt.executeUpdate(s3);
			   k=stmt.executeUpdate(s4);
			   
		   }
		   catch(SQLException e)
	   	   {
			   System.out.println("wishlist");
		   		e.printStackTrace();
	   	   }
		   catch(Exception e)
		   {
		   		e.printStackTrace();	
		   }
		   finally
		   {
			   try
			   {
				   rs.close();
			   }
			   catch(SQLException e)
		   	   {
			   		e.printStackTrace();
		   	   }
			   catch(Exception e)
			   {
			   		e.printStackTrace();	
			   }
		   }
	   }
	   public void add_to_cart(String uname,Book book,Order order)
	   {
		   int o_id=order.getOrder_id();
		   String s1="insert into order_table values("+order.toString()+")";
		   String s2="insert into item values("+o_id+","+"'"+book.getIsbn()+"'"+")";
		   int k;
		   try
		   {
			   k=stmt.executeUpdate(s1);
			   k=stmt.executeUpdate(s2);
			   
		   }
		   catch(SQLException e)
	   	   {
			   //System.out.println("wishlist");
		   		e.printStackTrace();
	   	   }
		   catch(Exception e)
		   {
		   		e.printStackTrace();	
		   }
	   }
	   public void complete_transaction(String uname)
	   {
		   String s1="update order_table set status=1 where status=0 and username="+"'"+uname+"'";
		   int k;
		   try
		   {
			   k=stmt.executeUpdate(s1);
			   
		   }
		   catch(SQLException e)
	   	   {
			   System.out.println("wishlist");
		   		e.printStackTrace();
	   	   }
		   catch(Exception e)
		   {
		   		e.printStackTrace();	
		   }
	   }
	   public void update_copies_sold(String isbn)
	   {
		   String s="select copies_sold from book where isbn="+"'"+isbn+"'";
		   int k,o=0;
		   ResultSet rs=null;
		   try
		   {
			   rs=stmt.executeQuery(s);
			   if(rs.next())
			   {
				   o=rs.getInt("copies_sold");
			   }
			   String s1="update book set copies_sold="+(o+1)+" where isbn="+"'"+isbn+"'";
			   k=stmt.executeUpdate(s1);
			   
		   }
		   catch(SQLException e)
	   	   {
			   System.out.println("wishlist");
		   		e.printStackTrace();
	   	   }
		   catch(Exception e)
		   {
		   		e.printStackTrace();	
		   }
	   }
	   public void release_resources()
	   {
		   try
		   {
			   stmt.close();
			   conn.close();
		   }
		   catch(SQLException e)
	   	   {
		   		e.printStackTrace();
	   	   }
		   catch(Exception e)
		   {
		   		e.printStackTrace();
		   }
		   
	   }
}