package com.registration.form.bean;

public class LoginUser implements java.io.Serializable {
	private int id=0;
	private String  email=null , password=null ;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
		
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		System.out.print(" Bean = "+ email +" ");
		this.email = email;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	
	
	
	
}
