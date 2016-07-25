package com.epilogue;
import java.util.*;
public class BookStore
{
	public HashMap<String,User> UserBase;
	public HashMap<String,Admin> AdminBase;
	public HashMap<String,Book> BookBase;
	public String MostPopular[];
	public int keys[];
	public int length;
	public HashMap<Integer,Order> orderlist;
	public DatabaseConnector connector;
	public BookStore()
	{
		UserBase=new HashMap<String,User>();
		AdminBase=new HashMap<String,Admin>();
		BookBase=new HashMap<String,Book>();
		MostPopular=new String[200];
		keys=new int[200];
		orderlist=new HashMap<Integer,Order>();
		connector=new DatabaseConnector();
		LoadDataBase();
		loadfilter();
	}
	public void LoadDataBase()
	{
		
		connector.LoadUserBase(UserBase);
		connector.LoadBookBase(BookBase);
		connector.LoadAdminBase(AdminBase);
		connector.LoadOrderTable(orderlist);
		
	}
	public void loadfilter()
	{
		Iterator<String> it=this.BookBase.keySet().iterator();
		int in=0;
		while(it.hasNext())
		{
			String isbn=it.next();
			int k=this.BookBase.get(isbn).getCopies_sold();
			MostPopular[in]=isbn;
			keys[in]=k;
			in++;
			length++;
		}
		for(int i=0;i<in;i++)
		{
			for(int j=i+1;j<in;j++)
			{
				if(keys[j]>keys[i])
				{
					int temp=keys[i];
					String k=MostPopular[i];
					MostPopular[i]=MostPopular[j];
					MostPopular[j]=k;
					keys[i]=keys[j];
					keys[j]=temp;
				}
			}
		}

	}
	public boolean AuthenticateUser(String uname,String pass)
	{
		//System.out.println(uname+" "+pass);
		//System.out.println(UserBase);
		if(UserBase.containsKey(uname))
		{
			User x=UserBase.get(uname);
			if(x.getPassword().equals(pass))
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
	public boolean AuthenticateAdmin(String uname,String pass)
	{
		if(AdminBase.containsKey(uname))
		{
			Admin x=AdminBase.get(uname);
			if(x.getPassword().equals(pass))
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
	public void remove_from_UserBase(String uname)
	{
		Iterator<String> it=UserBase.keySet().iterator();
		while(it.hasNext())
		{
			if(it.next().equals(uname))
			{
				connector.delete_from_table("user","username",uname);
				UserBase.remove(uname);
				return;
			}
		}
	}
	public void remove_from_BookBase(String isbn)
	{
		Iterator<String> it=BookBase.keySet().iterator();
		while(it.hasNext())
		{
			if(it.next().equals(isbn))
			{
				connector.delete_from_table("wishlist","isbn",isbn);
				connector.delete_from_table("item","isbn",isbn);
				connector.delete_from_table("book","isbn",isbn);
				BookBase.remove(isbn);
				return;
			}
		}
	}
	public String keyFinder(String titl)
	{
		Iterator<String> it=BookBase.keySet().iterator();
		while(it.hasNext())
		{
			String k=it.next();
			//System.out.println(this.BookBase.get(k).getTitle());
			if(this.BookBase.get(k).getTitle().equals(titl))
			{
				return k;
			}
		}
		return "";
	}
	public void insert_into_userbase(User Userx)
	{
		connector.insert_into_table("user",Userx);
		UserBase.put(Userx.getUsername(),Userx);
	}
	public void insert_into_bookbase(Book book)
	{
		connector.insert_into_table("book",book);
		BookBase.put(book.getIsbn(),book);
	}
}
