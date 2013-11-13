<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib  uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@taglib  uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@include file="connection.jsp" %>
<%@page import="java.util.*,javax.servlet.*,java.sql.*,javax.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Your Shopping Cart</title>
        <link type="text/css" rel="stylesheet" href="style/cart.css">
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
  <sql:setDataSource driver="oracle.jdbc.OracleDriver" url="jdbc:oracle:thin:@localhost:1521:XE"
                            user="SID_1607" password="hr"/>
 <jsp:setProperty name="Cart" property="size" value="${Cart.size+param.q}"/> 
 <table id="back">
            <tr>
                <td>
            <img id="logo" src="img/ths.png">
                </td>
                <td align="center">
                    <div id="top"></div>
       <h2 align="center">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                          SHOPPING CART</h2><br/>
         <h4 align="center"><b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                          You have ${sessionScope.Cart.size} items in your cart:</b></h4>

             </td>
              <jsp:useBean id="Item" scope="page" class="BeanClass.ItemBean" />
             <c:set value="${param.id}" var="r"></c:set>
                          
             <sql:query sql="select * from products" var="tbl"></sql:query>
             <c:set var="skip" value="f"/>
             <c:forEach items="${tbl.rows}" var="i">
                <c:set value="${i.prod_id}" var="j"></c:set>
                <c:if test="${r eq j}" var="k">
                    <c:if test="${not empty Cart.cartList}"var="z">
                        <c:forEach items="${Cart.cartList}" var="k">
                            <c:if test="${k.id eq j}">
                             <c:set var="skip" value="t"/>
                            <jsp:setProperty name="k" property="quantity" value="${k.quantity+param.q}"/>
                            <c:set var="cat" value="${i.category_id}"/>
                            </c:if>
                        </c:forEach>
                    </c:if>
                    <c:if test="${z eq false}">
                        <c:set var="cat" value="${i.category_id}"/>
                            <jsp:setProperty name="Item" property="id" value="${i.prod_id}"/>
                            <jsp:setProperty name="Item" property="name" value="${i.prod_name}"/>
                            <jsp:setProperty name="Item" property="desc" value="${i.prod_desc}"/>
                            <jsp:setProperty name="Item" property="rate" value="${i.prod_price}"/>
                            <jsp:setProperty name="Item" property="disc" value="${i.discount}"/>
                            <jsp:setProperty name="Item" property="quantity" value="${param.q}"/>
                            <jsp:setProperty name="Cart"  property="item" value="${Item}"></jsp:setProperty>
                     </c:if>
                     <c:if test="${z eq true}">
                        <c:if test="${skip eq 'f'}">
                            <c:set var="cat" value="${i.category_id}"/>
                            <jsp:setProperty name="Item" property="id" value="${i.prod_id}"/>
                            <jsp:setProperty name="Item" property="name" value="${i.prod_name}"/>
                            <jsp:setProperty name="Item" property="desc" value="${i.prod_desc}"/>
                            <jsp:setProperty name="Item" property="rate" value="${i.prod_price}"/>
                            <jsp:setProperty name="Item" property="disc" value="${i.discount}"/>
                            <jsp:setProperty name="Item" property="quantity" value="${param.q}"/>
                            <jsp:setProperty name="Cart"  property="item" value="${Item}"></jsp:setProperty>
                        </c:if>
                    </c:if>
                </c:if>
             </c:forEach>


                          
            <tr>
            <td colspan="2"><table id="list">
                     <tr>
                         <th></th>
                         <th>Product Name</th>
                          <th>Product Description</th>
                           <th>Rate</th>
                            <th>Discount</th>
                            <th>Quantity</th>
                            <th>Price</th>
                     </tr>
                     <c:set var="finalPrice" value="0"/>
                          <c:forEach items="${Cart.cartList}" var="x">
                              <tr>
                                  <c:if test="${x.id ne 0}">
                                  <td align="center"><img src="img/${x.id}.jpg"</td>
                                  <td align="center">${x.name}</td>
                                   <td align="center">${x.desc}</td>
                                    <td align="center">${x.rate}0</td>
                                     <td align="center">${x.disc}</td>
                                      <td align="center">${x.quantity}</td>
                                    <c:set var="rate" value="${x.rate}"/>
                                    <c:set var="disc" value="${x.disc}"/>
                                    <c:set var="qty" value="${x.quantity}"/>
                                    <c:set var="price" value="${(rate-rate*disc/100)*qty}"/>
                                    <jsp:setProperty name="x" property="price" value="${price}"/>
                                      <td align="center">${price}0</td>
                                      <c:set var="finalPrice" value="${finalPrice+price}"/>
                                   
                              </tr>
                              </c:if>
                          </c:forEach>
                                      <tr>
                                          <td colspan="6" align="right"><b> Total Bill Ammount: Rs.</b></td>
                                          <td><B>${finalPrice}0</B></td>
                                      </tr>
                              </table>
            </td> </table>
                               <div id ="top">
                                   <a href="deptsearch.jsp?pp=a&r=${cat}">BACK</a>
  
                               </div>
                                    <% }}} else 
                    {
              rd=request.getRequestDispatcher("login.jsp");
              rd.forward(request,response);
             }             
    %>        
</body>
</html>
