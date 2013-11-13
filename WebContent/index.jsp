<%@include file='include.jsp' %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>VirtueMart-Online Shopping</title>
        <link type="text/css" rel="stylesheet" href="style/index.css">
        <script type="text/javascript" src="script/search.js"></script>
    </head>
	
    <body>
    	<%! String cmd,cid,sid,cust;
        	Statement stmt;
        	ResultSet rs;
        	RequestDispatcher rd;
		%>
            <%
            try{
            
            String sid=(String)session.getAttribute("SessionId");
            String cid=(String)session.getAttribute("CustId");
            if(sid!=null&&cid!=null){
              
              String cust=(String) session.getAttribute("CustName");
              cmd="select  session_id  from user_acct where user_id='"+cid+"'";
              stmt=conn.createStatement();
              rs=stmt.executeQuery(cmd);
              
              while(rs.next()){
               if(rs.getString("session_id").equals(sid)){
               session=request.getSession();
               session.setAttribute("SessionId",sid);
               session.setAttribute("CustId",cid);
               session.setAttribute("CustName",cust);
 			%>
			   <%@include file='log_head.jsp' %>
			<% }}} else {%>
				<%@include file='head.jsp' %>
            <%}}catch(NullPointerException e){ %>
                 
            <%@include file='head.jsp' %>
 <% } %>
           
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
                &nbsp;&nbsp;&nbsp;&nbsp;<a href="cart.jsp"><input type="button" value="Cart(${Cart.size})" name="Cart"></a>
               </form>
               </div>
      
          <h4 id="msg"><u><b></b></u></h4>
        <table id="list">

            <tr>
                <td><img src="img/59.jpg"></td>
                <td><img src="img/64.jpg"></td>
                <td><img src="img/68.jpg"></td>
            </tr>
            <tr>
                <td><img src="img/61.jpg"></td>
                <td><img src="img/57.jpg"></td>
                <td><img src="img/66.jpg"></td>
            </tr>
        </table>
     
    </body>
</html>

