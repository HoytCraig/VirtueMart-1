<%-- 
    Document   : success
    Created on : 16 Jul, 2012, 1:47:44 AM
    Author     : siddharth
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="connection.jsp" %>
<%@page import="java.util.*,javax.servlet.*,java.sql.*,javax.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Successful Registration</title>
        <style>
            body{
                color:navy;
                font-family: sans-serif;
            }
        </style>
    </head>
    <body>
        <%!String lname; 
           String cmd;
           String fname;
           String name;
           String email;
           String uname;
           String pwd;
           String address;
           String contact;
           String gender;
		%>
        <%
        fname=(String) request.getParameter("fname"); 
        lname=(String) request.getParameter("lname"); 
        email=(String) request.getParameter("email");
        pwd= (String) request.getParameter("pwd"); 
        uname = (String) request.getParameter("uname");
        address= (String) request.getParameter("address");
        contact= (String) request.getParameter("number"); 
        gender = (String) request.getParameter("gender");
        cmd="insert into user_acct (fname,lname,email_id,user_name,password,address,contactno,gender) values('"+fname+"','"+lname+"','"+email+"','"+uname+"','"+pwd+"','"+address+"','"+contact+"','"+gender+"')";
                     Statement stmt=conn.createStatement();
                     stmt.executeUpdate(cmd);
                      %>
       <img src="img/ths.png"/>
       <h2 align="center">You have successfully registered to VirtueMart</h2><br/>
       <br/>
       <b>FIRST NAME:</b>&nbsp;&nbsp;<%=fname%><br/>
       <b>LAST NAME:</b>&nbsp;&nbsp;<%=lname%><br/>
       <b>USER NAME:</b>&nbsp;&nbsp;<%=uname%><br/>
       <b>EMAIL-ID:</b>&nbsp;&nbsp;<%=email %><br/>
       <b>ADDRESS:</b>&nbsp;&nbsp;<%=address %><br/>
       <b>CONTACT NO:</b>&nbsp;&nbsp;<%=contact %><br/><br/><br/>
       You may now <a href="login.jsp">login</a> to access your Shopping Cart

       
    </body>
</html>
