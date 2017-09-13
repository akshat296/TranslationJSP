package com.registration.form.bean;

public class Product {
private int id=0;
private String product_name="",product_type="";
public int getId() {
	return id;
}
public void setId(int id) {
	this.id = id;
	
}
public String getProductName() {
	return product_name;
}
public void setProductName(String product_name) {
//	/System.out.print(" Bean = "+ email +" ");
	this.product_name = product_name;
}
public String getProductType() {
	return product_type;
}
public void setProductType(String product_type) {
	this.product_type = product_type;
}

}
