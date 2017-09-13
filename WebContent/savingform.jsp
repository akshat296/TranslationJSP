<%@page import= "com.registration.form.dao.UserSave"%>
<%@page import= "com.registration.form.dao.Validations"%>
<%@page import="java.net.URLEncoder"%>
<%@page import="java.util.Arrays"%>
   
<jsp:useBean id="u" class="com.registration.form.bean.User"></jsp:useBean>
<jsp:setProperty property="*" name="u"/>

<% 
String err[]=UserSave.validation(u);
int k=0;
for(int i=0;i<err.length;i++)
{
	if(!err[i].equals(" "))
	{
		k=1;
	}
}
int i=0;
if(k==0)
{
	System.out.print ("SavingForm_email = "+u.getEmail());
 i=UserSave.save(u);
}
else {
	//System.out.print(" Validations errors ");
	
	String param = Arrays.toString(err);
	param = param.substring(1, param.length()-1);//removing enclosing []
	String encArray = URLEncoder.encode(param, "utf-8");

	// Send encArray as parameter.
	//resp.sendRedirect(("result.jsp?fibSequence=" + encArray));
	response.sendRedirect(("index.jsp?fibSequence=" + encArray));
}
if(i>0)
{
	System.out.print("Success");
	response.sendRedirect("success.jsp");
	
}
else 
{	System.out.print(" Error in DB ");
	//response.sendRedirect("unsuccess.jsp");
}

%>  