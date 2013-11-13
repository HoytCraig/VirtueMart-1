<%-- 
    Document   : login
    Created on : Jul 7, 2012, 7:32:08 PM
    Author     : niitstudent
--%>
<%@include file='include.jsp' %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
        <link type="text/css" rel="stylesheet" href="style/index.css">
        <style type="text/css">
            body{
               color:navy;
            }
            table{

                position:absolute;
                top:160px;
                height:200px;
            }
            h1{
                position:absolute;
                top:110px;
            }
        </style>
    </head>
    <body>
        <%!String sid,str,cust,pass,cid;%>
        <% try{
        if(request.getParameter("Submit").equals("Login")){%>
         <sql:query sql="select * from user_acct" var="rs"/>
          <c:set var="flag" value="0"/>
         <c:forEach items="${rs.rows}" var="i">

             <c:if test="${i.user_name eq param.user}" var="check">
                 <c:if test="${i.password eq param.pwd}" var="pass">
                     <% cust=(String)request.getParameter("user");
                     pass=(String) request.getParameter("pwd");
                     session=request.getSession();
                     session.setMaxInactiveInterval(200);
                     %>
                      <c:set var="finalPrice" value="0" scope="session"/>
        <jsp:useBean id="Cart" scope="session" class="BeanClass.CartBean"></jsp:useBean>
                     <%
                     sid=session.getId();
                     str="select user_id from user_acct where user_name='"+cust+"' and password='"+pass+"'";
                     Statement stmt=conn.createStatement();
                     ResultSet rs=stmt.executeQuery(str);
                     while(rs.next()){
                     cid=rs.getString("user_id");
                     str="update user_acct set session_id='"+sid+"'where user_id='"+cid+"'";                     }
                     Statement stmt1=conn.createStatement();
                     stmt1.executeUpdate(str);
                     session.setAttribute("SessionId",sid);
                     session.setAttribute("CustId",cid);
                     session.setAttribute("CustName",cust);
                     RequestDispatcher rd=request.getRequestDispatcher("index.jsp");
                     rd.forward(request,response);
                     %>
                  

                      <c:set var="flag" value="1"/>
                 </c:if>
             </c:if>
            </c:forEach>
                      <c:if test="${flag eq 0}">
                      	  <%@include file='head.jsp' %>
                          <br/><br/><br/><br/><br/><br/>
                          <h3>Username or password is wrong</h1>
                      </c:if>
                 

         
<%}%>
   <% }catch(NullPointerException e){
    %>
		<%@include file='head.jsp' %>
        <h1>Fill in your login details</h1>
        
         <form action="login.jsp" method="post">
            <table>

            <tr><td>Username:     </td>
                <td><input type="text" name="user" value=""></td>
            </tr>
            <tr>
                <td>Password:     </td>
                <td><input type="password" name="pwd" value=""></td>
            </tr>
            <tr>
               
                <td><input type="submit" name="Submit" value="Login"></td>
                <td><input type="reset" name="clear" value="Clear"></td>

            </tr>

        </table>
        </form>
            <% } %>
    </body>
</html>
