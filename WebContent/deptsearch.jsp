<%-- 
    Document   : deptsearch
    Created on : Jul 11, 2012, 4:55:31 PM
    Author     : Administrator
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib  uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@taglib  uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@include file="connection.jsp" %>
<%@include file="datasource.jsp" %>
<%@page import="java.util.*,javax.servlet.*,java.sql.*,javax.sql.*" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Search</title>
        <link type="text/css" rel="stylesheet" href="style/deptsearch.css">
        <script type="text/javascript" src="script/search.js"></script>
    </head>
    <body>
        <%!String cmd,cid,sid,cust;
        Statement stmt;
        ResultSet rs;
        RequestDispatcher rd;
%>
        <%   
      sid=(String) session.getAttribute("SessionId");
      cid=(String) session.getAttribute("CustId");
      cust=(String) session.getAttribute("CustName");
      if(sid!=null&&cid!=null)
       {cmd="select session_id  from user_acct where user_id='"+cid+"'";
              stmt=conn.createStatement();
              rs=stmt.executeQuery(cmd);
              while(rs.next()){
               if(rs.getString("session_id").equals(sid)){
               session=request.getSession();
               session.setAttribute("SessionId",sid);
               session.setAttribute("CustId",cid);
               session.setAttribute("CustName",cust);
%>
         <div id="head">
            <img id="logo" src="img/ths.png">
        </div>
        <div id="cat">
            <h2 align="center">SEARCH DEPARTMENTS</h2>
			<table id="dept">
            	<tr><td><%@include file='load_dept.jsp'%></td></tr>
            </table>
        </div>
        <div id="bar">

          <form method="post" action="search.jsp" onsubmit="return checkSearch()" name="searchBar">
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                 
                <input type="text" name="searchItem" value="search" id="search">
                <input type="submit" name="go" value="search">
                 &nbsp;&nbsp;&nbsp;&nbsp;<a href="cart.jsp" ><input type="button" value="Cart(${sessionScope.Cart.size})" id="cButton" name="Cart"></a>
               </form>
               </div>
        <div id="header">
            <u>Welcome, <%=cust%></u>         
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="index.jsp">Home</a>
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="logout.jsp">Logout</a>

  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Latest Offers
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="about.html">About</a>
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="contact.html">Contact Us</a>
 
  
        </div>
  <sql:query var="rs">
  	SELECT dept_name FROM department WHERE dept_id=${param.dept_id}
  </sql:query>
  <c:forEach items="${rs.rows}" var="i">
  	<h4 id="result">Displaying search results for: ${i.dept_name} </h4>
  </c:forEach>
  <h4 id="msg"></h4>
       
     
        <table id="list">

       			<sql:query var="prod">
       				SELECT * FROM product where dept_id=${param.dept_id}
       			</sql:query>    
                   <c:forEach var="i" items="${prod.rows}">
                       <tr>
                           <td align="center">
                               <br/>
                               <form action="updateCart.jsp?pp=abc&id=${i.product_id}" method="post" onsubmit="cartUpdate(${Cart.size},q.value)"> 
                               <img src="img/${i.product_id}.jpg"><br/>
                               <b>Name:&nbsp;<c:out value="${i.product_name}"></c:out><br/>
                               Price:&nbsp;<c:out value="Rs.${i.price}"></c:out><br/>
                               
                               <c:out value="${i.description}"></c:out><br/>
                               Discount:&nbsp;<c:out value="${i.discount}%"></c:out><br/>
                               Quantity:&nbsp;<input type="text" name="q" value=""><br/>
                               <p id="error"></p>
                               <input type="submit" name="add" value="Add to Cart" ><br/>
                               </form>
                           </td>
                       </tr>
        </c:forEach>
   
        </table>
             <% }}} else 
                    {
              rd=request.getRequestDispatcher("login.jsp");
              rd.forward(request,response);
             }             
    %>                 
    </body>
</html>
