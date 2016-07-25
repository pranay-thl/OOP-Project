package com.epilogue;
public class Admin
{
	String username;
	String password;
	String fname;
	String lname;
	String email;
	public Admin()
	{
		
	}
	public Admin(String u,String pa,String f,String l,String e)
	{
		this.setUsername(u);
		this.setPassword(pa);
		this.setFname(f);
		this.setLname(l);
		this.setEmail(e);
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getFname() {
		return fname;
	}
	public void setFname(String fname) {
		this.fname = fname;
	}
	public String getLname() {
		return lname;
	}
	public void setLname(String lname) {
		this.lname = lname;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
}
