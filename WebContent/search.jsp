<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib  uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@taglib  uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@include file="connection.jsp" %>
<%@page import="java.util.*,javax.servlet.*,java.sql.*,javax.sql.*" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>VirtueMart-Online Shopping</title>
         <link type="text/css" rel="stylesheet" href="style/search.css">
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
       {cmd="select  session_id  from customers where c_id='"+cid+"'";
              stmt=conn.createStatement();
              rs=stmt.executeQuery(cmd);
              while(rs.next()){
               if(rs.getString("session_id").equals(sid)){
               session=request.getSession();
               session.setAttribute("SessionId",sid);
               session.setAttribute("CustId",cid);
               session.setAttribute("CustName",cust);
%>

<c:set var="s" value="${param.searchItem}"></c:set>
  <sql:setDataSource driver="oracle.jdbc.OracleDriver" url="jdbc:oracle:thin:@localhost:1521:XE"
                            user="SID_1607" password="hr"/>
                         
        <sql:query sql="select * from products"  var="prod"></sql:query>
        <table id="list">
                     <c:set var="j" value="0"/>
                    <c:forEach items="${prod.rows}" var="i">
                      
                     <c:if test="${s eq i.prod_name}" var="p" ></c:if>
                     <c:if test="${p eq true}"> 
                         <c:set var="j" value="1"/>
                               <tr> <td align="center">
                                <b><u>Search Result:</u></b>
                               <br/>
                              <form action="updateCart.jsp?pp=abc&id=${i.prod_id}" method="post" onsubmit="cartUpdate(${Cart.size},q.value)"> 
                               <img src="img/${i.prod_id}.jpg"><br/>
                               <b><c:out value="${i.prod_name}" ></c:out><br/>
                               Price:&nbsp;<c:out value="Rs.${i.prod_price}"></c:out><br/>
                               
                               <c:out value="${i.prod_desc}"></c:out><br/>
                               Discount:&nbsp;<c:out value="${i.discount}%"></c:out><br/>
                               Quantity:&nbsp;<input type="text" name="q" value=""><br/>
                               <input type="submit" name="add" value="Add to Cart" ><br/>
                               </form>
                           </td>
        </tr>
                     </c:if>
        </c:forEach>
         
        <c:if test="${j eq 0}">
        
            <tr><td><b>No items matching your search</b></td></tr>
         </c:if>
        </table>
        <div id="head">
            <img id="logo" src="img/ths.png">
        </div>
        <div id="cat">
            <h2 align="center">SEARCH DEPARTMENTS</h2>



               <table id="dept">
            <%--    
                <tr><td align="center" id="dItem"><a href="deptsearch.jsp?pp=a&r=1" >Gaming</a></td></tr>
                <tr><td align="center" id="dItem"><a href="deptsearch.jsp?pp=a&r=2">Books</a></td></tr>
                <tr><td align="center" id="dItem"><a href="deptsearch.jsp?pp=a&r=3">Music & Movies</a></td></tr>
                <tr><td align="center" id="dItem"><a href="deptsearch.jsp?pp=a&r=4">Computers</a></td></tr>
                <tr><td align="center" id="dItem"><a href="deptsearch.jsp?pp=a&r=5">Sports & Outdoors</a></td></tr>
                <tr><td align="center" id="dItem"><a href="deptsearch.jsp?pp=a&r=6">Mobiles & Accesories</a></td></tr>
                <tr><td align="center" id="dItem"><a href="deptsearch.jsp?pp=a&r=7">Watches</a></td></tr>
            
            --%>
                <tr><td align="center" id="dItem"><a href="deptsearch.jsp?pp=a&r=8" >Art Supplies</a></td></tr>
                <tr><td align="center" id="dItem"><a href="deptsearch.jsp?pp=a&r=9">Craft Supplies</a></td></tr>
                <tr><td align="center" id="dItem"><a href="deptsearch.jsp?pp=a&r=10">Papercraft</a></td></tr>
                <tr><td align="center" id="dItem"><a href="deptsearch.jsp?pp=a&r=11">Stationary</a></td></tr>
            </table>
        </div>
        </div>
        <div id="bar">

            <form method="post" action="search.jsp?p=xyz" onsubmit="return checkSearch()" name="searchBar">
               
                <input type="text" name="searchItem" value="search" id="search">
                <input type="submit" name="go" value="search">
                 &nbsp;&nbsp;&nbsp;&nbsp;<a href="cart.jsp" ><input type="button" value="Cart(${sessionScope.Cart.size})" name="Cart"></a>
               </form>
               </div>
        <div id="header">
             <u>Welcome, <%=cust%></u>         
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="index.jsp">Home</a>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="logout.jsp">Login</a>
         
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Latest Offers
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="about.html">About</a>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="contact.html">Contact Us</a><br>
         </div>
          <h4 id="msg"><u><b></b></u></h4>
          <% }}} else 
                    {
              rd=request.getRequestDispatcher("login.jsp");
              rd.forward(request,response);
             }             
    %>     