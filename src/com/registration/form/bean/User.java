package com.registration.form.bean;

public class User {
private int id,age;
private String name,email, password,confirm_password, username, dob, country;


public int getAge() {
	//System.out.print("Age in get "+ age);
	return age;
}
public void setAge(int age) {
	
	this.age = age;
}
public int getId() {
	return id;
}
public void setId(int id) {
	this.id = id;
}
public String getName() {
	return name;
}
public void setName(String name) {

	this.name = name;
}
public String getEmail() {
	return email;
}
public void setEmail(String email) {
	this.email = email;
}
public String getPassword() {
	return password;
}
public void setPassword(String password) {
	this.password = password;
}
public String getConfirm_password() {
	return confirm_password;
}
public void setConfirm_password(String confirm_password) {
	this.confirm_password = confirm_password;
}
public String getUsername() {
	
	return username;
}
public void setUsername(String username) {
	this.username = username;
}
public String getDob() {
	return dob;
}
public void setDob(String dob) {
	this.dob = dob;
}
public void setCountry(String country) {
	
	this.country = country;
}
public String getCountry() {
	
	return country;
	
}
}
