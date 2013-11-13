<%-- 
    Document   : connection
    Created on : Jul 14, 2012, 6:34:09 PM
    Author     : Administrator
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="javax.sql.*,java.sql.*, java.util.Properties"  %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<% 
	String dbClassName = "com.mysql.jdbc.Driver";
	String Connection = "jdbc:mysql://127.0.0.1/eshopping";
	Properties p = new Properties();
	
	p.put("user","root");
    p.put("password","root");
	Class.forName(dbClassName);
	Connection conn=DriverManager.getConnection(Connection,p);
	System.out.println("Connection to db successful");
%>