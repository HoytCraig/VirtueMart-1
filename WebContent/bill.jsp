

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib  uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@taglib  uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page import="java.util.*"  %>
<%@include file="connection.jsp" %>
<%@page import="java.util.*,javax.servlet.*,java.sql.*,javax.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Bill Page</title>
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
                          BILL</h2><br/>
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
                                       <td align="center"><a href="bill.jsp?pp=r&id=${x.id}&q=${x.quantity}"><input type="button" name="remove" value="Remove"></a></td>
                                        <c:set var="finalPrice" value="${finalPrice+x.price}"/>
                              </tr>
                              </c:if>
                          </c:forEach>
                                       <tr>
                                          <td colspan="6" align="right"><b> Total Bill Ammount: Rs.</b></td>
                                          <td><B>${finalPrice}0</B></td>
                                      </tr>
                                      <tr>
                                      <form action="pay.jsp" method="post">
                                          <td colspan="2" align="center">
                                              Choose your mode of payement:
                                          </td>
                                          <td align="center">
                                              <img src="img/visa.jpg"/>
                                          </td>
                                          <td align="center">
                                              <input type="checkbox" name="card" value="VISA"/>VISA
                                          </td>
                                          <td align="center">
                                              <img src="img/master.jpg"/>
                                          </td>
                                          <td align="center">
                                              <input type="checkbox" value="MASTER CARD" name="card"/>MASTER CARD
                                          </td>
                                          <td align="center">
                                              <img src="img/amex.jpg"/>
                                          </td>
                                          <td align="center">
                                              <input type="checkbox" value="AMERICAN EXPRESS" name="card"/>AMERICAN EXPRESS
                                          </td>
                                      </form>   
                                      </tr>
                              </table>
            </td> </table>
                                           <div id="top">
              <a href="cart.jsp">BACK</a>
          </div>
        
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
                          BILL PAGE </h2><br/>
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
                                       <td align="center"><a href="bill.jsp?pp=r&id=${x.id}&q=${x.quantity}"><input type="button" name="remove" value="Remove"></a></td>
                                       <c:set var="finalPrice" value="${finalPrice+x.price}"/>
                              </tr>
                                </c:if>
                                       
                          </c:forEach>
                                       <tr>
                                          <td colspan="6" align="right"><b> Total Bill Ammount: Rs.</b></td>
                                          <td><B>${finalPrice}0</B></td>
                                      </tr>
                                      <c:if test="${Cart.size-param.q ne 0}">
                                        <tr>
                                      <form action="pay.jsp" method="post">
                                          <td colspan="2" align="center">
                                              Choose your mode of payement:
                                          </td>
                                          <td align="center">
                                              <img src="img/visa.jpg"/>
                                          </td>
                                          <td align="center">
                                              <input type="checkbox" name="card" value="VISA"/>VISA
                                          </td>
                                          <td align="center">
                                              <img src="img/master.jpg"/>
                                          </td>
                                          <td align="center">
                                              <input type="checkbox" value="MASTER CARD" name="card"/>MASTER CARD
                                          </td>
                                          <td align="center">
                                              <img src="img/amex.jpg"/>
                                          </td>
                                          <td align="center">
                                              <input type="checkbox" value="AMERICAN EXPRESS" name="card"/>AMERICAN EXPRESS
                                          </td>
                                      </form>   
                                      </tr>
                                      </c:if>
                              </table>
            </td> </table>     
        
          <jsp:setProperty name="Cart" property="size" value="${Cart.size-param.q}"/>
          <div id="top">
              <a href="index.jsp">BACK</a>
          </div>
     
</c:if> 
             <% }}} else 
                    {
              rd=request.getRequestDispatcher("login.jsp");
              rd.forward(request,response);
             }             
    %>               
    </body>
</html>
