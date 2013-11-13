<%-- 
    Document   : logout
    Created on : 16 Jul, 2012, 1:24:26 AM
    Author     : siddharth
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib  uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@taglib  uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@include file="connection.jsp" %>
<%@page import="java.util.*,javax.servlet.*,java.sql.*,javax.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Logout</title>
    </head>
    <body
    <%! 
        Statement stmt;
        ResultSet rs;
        RequestDispatcher rd;
        String cmd;
    %>
    <%
    String sid=(String)session.getAttribute("SessionId");
    String cid=(String)session.getAttribute("CustId");
    session.invalidate();
    cmd="update user_acct set session_id='empty' where user_id='"+cid+"'";                     
    stmt=conn.createStatement();
    stmt.executeUpdate(cmd);
    rd=request.getRequestDispatcher("index.jsp");
    rd.forward(request, response);

%>
</body>
</html>
