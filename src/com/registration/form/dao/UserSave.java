package com.registration.form.dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;  
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import com.registration.form.bean.LoginUser;
import com.registration.form.bean.*;  
public class UserSave {
public static Connection getConnection()
{
	Connection con=null;
	try
	{
		Class.forName("com.mysql.jdbc.Driver");
		con=DriverManager.getConnection("jdbc:mysql://localhost:3306/jsp_db","root","");
	}
	catch(Exception e)
	{System.out.println(e);
	}
	
	return con;
	}

public static int save(User u){  
    int status=0;  
    try{  
        Connection con=getConnection();  
        PreparedStatement ps=con.prepareStatement(  
"insert into users(name,email, password,dob, username, country,age) values(?,?,?,?,?,?,?)");  
        ps.setString(1,u.getName());  
        ps.setString(2,u.getEmail());  
        ps.setString(3,u.getPassword());  
        ps.setString(4,u.getDob());  
        ps.setString(5,u.getUsername());  
        ps.setString(6,u.getCountry());  
        ps.setInt(7,u.getAge());  
        status=ps.executeUpdate();  
    }catch(Exception e){System.out.println(e);}  
    return status;  
}  
public static String[] validation(User u)
{String errors[]={" "," "," "," "," "," "," "};

if(u==null)
{
	return errors;
}
	String emailPattern = "^[\\w!#$%&’*+/=?`{|}~^-]+(?:\\.[\\w!#$%&’*+/=?`{|}~^-]+)*@(?:[a-zA-Z0-9-]+\\.)+[a-zA-Z]{2,6}$";
	//System.out.print(" name = " +u.getName());
	if( u.getName()==null || u.getName().length()<3 )
	{
		errors[0]="Name Should not be less than 3";
	}
	else {
		errors[0]=" ";
	}
	 if(  u.getEmail()==null || u.getEmail().length()<3 )
		{
			   errors[1]="Email Should not be less than 3";
		}
	else if(u.getEmail().length()>3)
	{
	
        Pattern p = Pattern.compile(emailPattern);
        Matcher m = p.matcher(u.getEmail());
     
        if(!m.matches())
        {
        	errors[1]="Please enter valid email";
        }
	
	}
	
	else {
		 errors[1]=" ";
	}
	if( u.getPassword()==null || u.getConfirm_password()==null || (!u.getPassword().equals(u.getConfirm_password())))
	{
		errors[2]="Password Does not match";
	}
	else {
		errors[2]=" ";
	}
	if( u.getDob()==null || u.getDob().length()<3 )
	{
		errors[4]="Please enter valid Date of Birth";
	}
	else {
		errors[4]=" ";
	}
	if( u.getUsername()==null || u.getUsername().length()<3 )
	{
		errors[3]="Username Should not be less than 3";
	}else {
		errors[3]=" ";
	}
	if(u.getAge()<0 ||  u.getAge() == 0)
	{
		errors[6]="Age should not be negative";
	}else {
		errors[6]=" ";
	}
	return errors;
}

public static int checkLogin(LoginUser login)
{
	User u=null;
	 ResultSet rs;  
	    try{  
	        Connection con=getConnection();  
	        int count = 0;
	        PreparedStatement ps=con.prepareStatement(  
	"select * from users where email = ? and password = ? ");  
	        ps.setString(1,login.getEmail());  
	       System.out.print("\nCheck Login Function = " +login.getEmail()+" ");
	        ps.setString(2,login.getPassword());
	        System.out.print("\nCheck Login Function Password = " +login.getPassword()+" ");
	        //System.out.print(login.getPassword());
	        rs=ps.executeQuery(); 
	        while(rs.next()){   u=new User();  
	        count++;
           u.setId(rs.getInt("id"));  
            u.setName(rs.getString("name"));  
           
            u.setEmail(rs.getString("email"));  
          
            u.setCountry(rs.getString("country"));   }
	        
	     if(count > 0)
	     {
	    	 return 1; 
	     }
	     else 
	     {
	    	 return 0;
	     }
	        }catch(Exception e){
	    	u=new User(); 
	    	
	    	System.out.println(e);u=null; return 0;}  
	   
	

}
public static List<User> getAllRecords(){  
    List<User> list=new ArrayList<User>();  
      
    try{  
        Connection con=getConnection();  
        PreparedStatement ps=con.prepareStatement("select * from users");  
        ResultSet rs=ps.executeQuery();  
        while(rs.next()){  
            User u=new User();  
            u.setId(rs.getInt("id"));  
            u.setName(rs.getString("name"));  
            u.setPassword(rs.getString("password"));  
            u.setEmail(rs.getString("email"));  
          
            u.setCountry(rs.getString("country"));  
            list.add(u);  
        }  
    }
    catch(Exception e)
    {
    	System.out.println(e);
    	}  
    return list;  
}
public static boolean delete (int id)
{
	
	  
	    try{  
	        Connection con=getConnection();  
	      
	        PreparedStatement ps=con.prepareStatement(  
	        		"delete from users where id = ? ");  
	      
	        ps.setInt(1,id);  
	      ps.executeUpdate(); 
	      return true;
	        }
	    	catch(Exception e){
	    
	    	System.out.println(e);
	    	return false;}  
	   
	
	
}
	public static int update(User u,int id){  
    int status=0;  
    try{  
        Connection con=getConnection();  
        PreparedStatement ps=con.prepareStatement(  
        "update users set name=?,password=?,email=?,username=?,dob=?, country=?,age=? where id=?");  
        ps.setString(1,u.getName());  
        ps.setString(2,u.getPassword());  
        ps.setString(3,u.getEmail());   
        ps.setString(6,u.getCountry());  
        ps.setString(5,u.getDob());  
       
        ps.setString(4,u.getUsername());  
        ps.setInt(7,u.getAge());  
        
        ps.setInt(8,id);  
        status=ps.executeUpdate();  
    }catch(Exception e){System.out.println(e);}  
    return status;  
}
	public static ArrayList<Product> getAllProducts(){  
	    ArrayList<Product> list=new ArrayList<Product>();  
	      
	    try{  
	        Connection con=getConnection();  
	        PreparedStatement ps=con.prepareStatement("select * from products_list");  
	        ResultSet rs=ps.executeQuery();  
	        while(rs.next()){  
	            Product u=new Product();  
	            u.setId(rs.getInt("id"));  
	            u.setProductName(rs.getString("product_name"));  
	            u.setProductType(rs.getString("product_type"));  
	            
	            list.add(u);  
	            
	        }  
	    }
	    catch(Exception e)
	    {
	    	System.out.println(e);
	    	}  
	    return list;  
	}

}
