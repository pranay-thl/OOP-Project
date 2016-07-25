package com.epilogue;
public class Book
{
	String title;
	String author;
	String publisher;
	String isbn;
	String price;
	int rating;
	int qty;
	int copies_sold;
	String publish_date;
	String description;
	int category_id;
	public Book()
	{
		
	}
	public String getTitle()
	{
		return this.title;
	}
	public String getAuthor()
	{
		return this.author;
	}
	public String getPublisher()
	{
		return this.publisher;
	}
	public String getIsbn()
	{
		return this.isbn;
	}
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	public int getRating() {
		return rating;
	}
	public void setRating(int rating) {
		this.rating = rating;
	}
	public int getQty() {
		return qty;
	}
	public void setQty(int qty) {
		this.qty = qty;
	}
	public int getCopies_sold() {
		return copies_sold;
	}
	public void setCopies_sold(int copies_sold) {
		this.copies_sold = copies_sold;
	}
	public String getPublish_date() {
		return publish_date;
	}
	public void setPublish_date(String publish_date) {
		this.publish_date = publish_date;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public int getCategory_id() {
		return category_id;
	}
	public void setCategory_id(int category_id) {
		this.category_id = category_id;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public void setAuthor(String author) {
		this.author = author;
	}
	public void setPublisher(String publisher) {
		this.publisher = publisher;
	}
	public void setIsbn(String isbn) {
		this.isbn = isbn;
	}
	public String toString()
	{
		return "'"+this.getTitle()+"'"+","+"'"+this.getAuthor()+"'"+","+"'"+this.getPublisher()+"'"+","+"'"+this.getIsbn()+"'"+","+"'"+this.getPrice()+"'"+","+this.getRating()+","+this.getQty()+","+this.getCopies_sold()+","+"'"+this.getPublish_date()+"'"+","+"'"+this.getDescription()+"'"+","+this.getCategory_id();
	}
}