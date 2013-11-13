<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib  uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@taglib  uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page import="java.util.*"  %>
<%@include file="connection.jsp" %>
<%@page import="java.util.*,javax.servlet.*,java.sql.*,javax.sql.*" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

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
        RequestDispatcher rd; %>
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
 <c:set var="finalPrice" value="0"/>
 <c:if test="${param.pp eq abc}" >
 
               <table id="back">
            <tr>
                <td>
            <img id="logo" src="img/ths.png">
                </td>
                <td align="center"><div id="top"></div>
       <h2 align="center">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                          SHOPPING CART</h2><br/>
 <c:if test="${Cart.size eq 0}" var="r">

              <h4 align="center"><b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                          You have no items in your cart</b></h4>
            </c:if>
             <c:if test="${r eq false}">
                <h4 align="center"><b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            You have ${Cart.size} items in your cart:</b></h4>

                </td>
             
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
                            <th></th>
                     </tr>
                     
                          <c:forEach items="${Cart.cartList}" var="x">
                              <tr>
                                  <c:if test="${x.id ne 0}">
                                  <td align="center"><img src="img/${x.id}.jpg"</td>
                                  <td align="center">${x.name}</td>
                                   <td align="center">${x.desc}</td>
                                    <td align="center">${x.rate}0</td>
                                     <td align="center">${x.disc}</td>
                                      <td align="center">${x.quantity}</td>
                                       <td align="center">${x.price}0</td>
                                       <td align="center"><a href="cart.jsp?pp=r&id=${x.id}&q=${x.quantity}"><input type="button" name="remove" value="Remove"></a></td>
                                        <c:set var="finalPrice" value="${finalPrice+x.price}"/>
                              </tr>
                              </c:if>
                          </c:forEach>
                                       <tr>
                                          <td colspan="6" align="right"><b> Total Bill Ammount: Rs.</b></td>
                                          <td><B>${finalPrice}0</B></td>
                                      </tr>
                                         <tr>
                                          <td colspan="8" align="center"><a href="bill.jsp"><input type="button" value="Proceed to Bill"/></a></td>
                                      </tr>

                              </table>
            </td> </table>
                 <div id="top">
              <a href="index.jsp">BACK</a>
          </div>
        </c:if>
</c:if>
<c:if test="${param.pp eq 'r'}">
   
      <h3 align="center">${param.q} items removed successfully</h3>
    <c:forEach items="${Cart.cartList}" var="x">
        <c:if test="${param.id eq x.id}">
            <jsp:setProperty name="x" property="id" value="0"/>
        </c:if>
    </c:forEach>
     <table id="back">
            <tr>
                <td>
            <img id="logo" src="img/ths.png">
                </td>
                <td align="center"><div id="top"></div>
       <h2 align="center">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                          SHOPPING CART</h2><br/>
 <c:if test="${Cart.size eq 0}" var="r"></c:if>

            <c:if test="${r eq true}">
              <h4 align="center"><b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                          You have no items in your cart</b></h4>
            </c:if>
             <c:if test="${r eq false}">
            <h4 align="center"><b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                          You have ${Cart.size-param.q} items in your cart:</b></h4>

             </td>
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
                            <th></th>
                     </tr>
                          <c:forEach items="${Cart.cartList}" var="x">
                              <tr>
                              <c:if test="${x.id ne 0}">
                                  <td align="center"><img src="img/${x.id}.jpg"</td>
                                  <td align="center">${x.name}</td>
                                   <td align="center">${x.desc}</td>
                                    <td align="center">${x.rate}0</td>
                                     <td align="center">${x.disc}</td>
                                      <td align="center">${x.quantity}</td>
                                       <td align="center">${x.price}0</td>
                                       <td align="center"><a href="cart.jsp?pp=r&id=${x.id}&q=${x.quantity}"><input type="button" name="remove" value="Remove"></a></td>
                                       <c:set var="finalPrice" value="${finalPrice+x.price}"/>
                              </tr>
                                </c:if>
                                       
                          </c:forEach>
                                       <tr>
                                          <td colspan="6" align="right"><b> Total Bill Ammount: Rs.</b></td>
                                          <td><B>${finalPrice}0</B></td>
                                      </tr>
                                      <tr>
                                          <td colspan="8" align="center"><a href="bill.jsp"><input type="button" value="Proceed to Bill"/></a></td>
                                      </tr>

                              </table>
            </td> </table>     
        
          <jsp:setProperty name="Cart" property="size" value="${Cart.size-param.q}"/>
          <div id="top">
              <a href="index.jsp">BACK</a>
          </div>
    </c:if>    
</c:if> 
             <% }}} else 
                    {
              rd=request.getRequestDispatcher("login.jsp");
              rd.forward(request,response);
             }             
    %>               
</body>
</html>
