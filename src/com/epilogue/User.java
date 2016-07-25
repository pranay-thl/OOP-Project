package com.epilogue;
import java.util.*;
public class User
{
	String username;
	String password;
	String fname;
	String lname;
	String address;
	String phone;
	String email;
	public HashMap<String,Book> wishlist;
	public HashMap<String,Book> cart;
	public DatabaseConnector connector;
	public User()
	{
		wishlist=new HashMap<String,Book>();
		cart=new HashMap<String,Book>();
		connector=new DatabaseConnector();
	}
	public User(String u,String pa,String f,String l,String a,String p,String e)
	{
		wishlist=new HashMap<String,Book>();
		cart=new HashMap<String,Book>();
		connector=new DatabaseConnector();
		this.setUsername(u);
		this.setPassword(pa);
		this.setFname(f);
		this.setLname(l);
		this.setAddress(a);
		this.setPhone(p);
		this.setEmail(e);
	}
	public void setUsername(String s)
	{
		this.username=s;
	}
	public void setPassword(String s)
	{
		this.password=s;
	}
	public void setFname(String s)
	{
		this.fname=s;
	}
	public void setLname(String s)
	{
		this.lname=s;
	}
	public void setAddress(String s)
	{
		this.address=s;
	}
	public void setPhone(String s)
	{
		this.phone=s;
	}
	public void setEmail(String s)
	{
		this.email=s;
	}
	
	public String getUsername()
	{
		return this.username;
	}
	public String getPassword()
	{
		return this.password;
	}
	public String getFname()
	{
		return this.fname;
	}
	public String getLname()
	{
		return this.lname;
	}
	public String getAddress()
	{
		return this.address;
	}
	public String getPhone()
	{
		return this.phone;
	}
	public String getEmail()
	{
		return this.email;
	}
	public String toString()
	{
		return "'"+this.getUsername()+"'"+","+"'"+this.getPassword()+"'"+","+"'"+this.getFname()+"'"+","+"'"+this.getLname()+"'"+","+"'"+this.getAddress()+"'"+","+this.getPhone()+","+"'"+this.getEmail()+"'";
	}
	public void init_Wishlist()
	{
		connector.loadWishlist(this.wishlist,this.username);
	}
	public void init_cart()
	{
		connector.loadcart(this.cart,this.username);
	}
	public void addToWishlist(Book book)
	{
		this.wishlist.put(book.getIsbn(),book);
		connector.insert_into_table("wishlist", this.username, book.getIsbn());
	}
	public void addToCart(Book book,BookStore bstore)
	{
		if(this.wishlist.containsKey(book.getIsbn()))
		{
			connector.remove_from_wishlist(this.username,book.getIsbn());
			//System.out.println(wishlist);
			this.wishlist.remove(book.getIsbn());
			//System.out.print(wishlist);
		}
		this.cart.put(book.getIsbn(),book);
		if(connector.check_transaction_status(this.username))
		{
			connector.add_to_cart(this.username,book);
		}
		else
		{
			Order order=new Order();
			//System.out.println(bstore.orderlist.size());
			order.setOrder_id(bstore.orderlist.size()+1);
			order.setQty(1);
			//System.out.println(this.address);
			order.setShipping_address(this.address);
			order.setTotal_price(book.getPrice());
			order.setUser_name(this.username);
			order.setStatus(false);
			bstore.orderlist.put(new Integer(bstore.orderlist.size()+1),order);
			connector.add_to_cart(this.username, book, order);
		}
	}
	public void create_direct_transaction(String isbn,BookStore bstore)
	{
		Order order=new Order();
		//System.out.println(bstore.orderlist.size());
		order.setOrder_id(bstore.orderlist.size()+1);
		order.setQty(1);
		//System.out.println(this.address);
		order.setShipping_address(this.address);
		order.setTotal_price(bstore.BookBase.get(isbn).getPrice());
		order.setUser_name(this.username);
		order.setStatus(true);
		
		Book bk=bstore.BookBase.get(isbn);
		bk.setCopies_sold(bk.getCopies_sold()+1);
		bstore.BookBase.put(isbn,bk);
		connector.update_copies_sold(isbn);
		
		bstore.orderlist.put(new Integer(bstore.orderlist.size()+1),order);
		connector.add_to_cart(this.username, bstore.BookBase.get(isbn), order);
	}
	public void complete_transaction(BookStore b)
	{
		connector.complete_transaction(this.username);
		this.cart.clear();
		Iterator<Integer> it=b.orderlist.keySet().iterator();
		while(it.hasNext())
		{
			Integer x=it.next();
			Order order=b.orderlist.get(x);
			if(order.isStatus()==false&&order.getUser_name().equals(this.username))
			{
				order.setStatus(true);
				b.orderlist.put(x,order);
			}
		}
	}
}
