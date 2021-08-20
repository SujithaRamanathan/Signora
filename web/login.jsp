<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*" %>
<%@page import="java.sql.*" %>
<%@page import="java.sql.Connection" %>
<%@page import="java.sql.DriverManager" %>
<%@page import="java.sql.SQLException" %>

<script>
    window.onload = test(){
        alert("Invalid"); // added sample text
    }
 </script>
    
    
<%



try {
Class.forName("com.mysql.jdbc.Driver");  
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/women","root","Sujitha@01");

if(request.getParameter("submit")!=null)
{
String dbemail,dbpassword;
String email=request.getParameter("email");
String password=request.getParameter("pwd");
PreparedStatement pstmt = null;

pstmt = con.prepareStatement("select email,password from register where email=? and password = ?");
pstmt.setString(1,email);
pstmt.setString(2,password);

ResultSet rs = pstmt.executeQuery();
if(rs.next())
{
dbemail = rs.getString("email");
dbpassword= rs.getString("password");

if(email.equals(dbemail)  && password.equals(dbpassword))
{
session.setAttribute("login",dbemail);
response.sendRedirect("products.html");
}
}

else
{

 out.println("<script> test();</script>");
}

con.close();
}
}

catch(Exception e)
{
out.println(e);
}
%>


