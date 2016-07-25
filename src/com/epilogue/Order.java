package com.epilogue;
public class Order
{
	int order_id;
	String user_name;
	int qty;
	String total_price;
	String shipping_address;
	boolean status;
	public Order()
	{
		
	}
	public Order(User x,BookStore b)
	{
		this.order_id=b.orderlist.size()+1;
		this.user_name=x.getUsername();
		this.qty=0;
		this.total_price="0";
		this.shipping_address=x.getAddress();
		this.status=false;
	}
	public int getOrder_id() {
		return order_id;
	}
	public void setOrder_id(int order_id) {
		this.order_id = order_id;
	}
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	public int getQty() {
		return qty;
	}
	public void setQty(int qty) {
		this.qty = qty;
	}
	public String getTotal_price() {
		return total_price;
	}
	public void setTotal_price(String total_price) {
		this.total_price = total_price;
	}
	public String getShipping_address() {
		return shipping_address;
	}
	public void setShipping_address(String shipping_address) {
		this.shipping_address = shipping_address;
	}
	public boolean isStatus() {
		return status;
	}
	public void setStatus(boolean status) {
		this.status = status;
	}
	public String toString()
	{
		return ""+this.getOrder_id()+","+"'"+this.getUser_name()+"'"+","+this.getQty()+","+this.getTotal_price()+","+"'"+this.getShipping_address()+"'"+","+this.isStatus();
	}
}
