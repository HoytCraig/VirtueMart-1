<!--
To change this template, choose Tools | Templates
and open the template in the editor.
-->
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@include file='include.jsp' %>
<html>
  <head>
    <title>Registration page</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link type="text/css" rel="stylesheet" href="style/register.css">
    <script type="text/javascript" src="script/signup.js"></script>
  </head>
  <body>
      <%@include file='head.jsp' %>
      <table id="Body">
          <tr>
      		  <td></td>
              <td align="center"><h2>REGISTER HERE</h2></td>
              <td></td>
          </tr>
          <tr>
              <td colspan="2">
                  <form method="post" action="success.jsp" onsubmit="return validate()" name="signup">
                  <table id="signup">
                      <tr>
                          <td>First Name:      </td>
                          <td><input  type="text" name="fname" value=""><br>

                              <p id="nameMsg"></p>
                          </td>

                      </tr>

					  <tr>
                          <td>Last Name:      </td>
                          <td><input  type="text" name="lname" value=""><br>

                              <p id="nameMsg"></p>
                          </td>

                      </tr>
					  
                      <tr>
                           <td>Email-Id:      </td>
                          <td><input  type="text" name="email" value=""><br>
                              <p id="emailMsg"></p>
                          </td>
                      </tr>
                      <tr>
                          <td>User-Name:      </td>
                          <td><input  type="text" name="uname" value=""><br>

                              <p id="nameMsg"></p>
                          </td>

                      </tr>
                      <tr>
                           <td>Password:    </td>
                           <td><input  type="password" name="pwd" value=""><br>
                              <p id="passMsg"></p>
                           </td>
                      </tr>
                      <tr>
                            <td>Confirm Password:      </td>
                          <td><input  type="password" name="cpwd" value=""><br>
                              <p id="cpassMsg"></p>
                          </td>
                       </tr>
                       <tr>
                           <td>Address:     </td>
                           <td> <textarea name="address" rows="5" cols="50"></textarea><br>
                              <p id="addMsg"></p>
                           </td>

                       </tr>
                       <tr>
                           <td>Contact No:      </td>
                           <td><input  type="text" name="number" value=""><br>
                              <p id="conMsg"></p>
                           </td>
                      </tr>
                       <tr>
                           <td>Gender:      </td>
                           <td><select name="gender"> 
                           			 <option value="male">Male</option>
  									 <option value="female">Female</option>
  								</select> <br>
                              <p id="conMsg"></p>
                           </td>
                      </tr>
                      <tr>
                          <td><input type="submit" value="Submit" name="submit"></td>
                          <td><input type="reset" value="Clear" name="clear"></td>
                      </tr>
                  </table>
                  </form>
              </td>
              <td id="note" >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;For a secure password:<ul>
                      <li>Length should be more than 8 Characters</li>
                      <li>Use numbers and special characters</li>
                      <li>Spaces are not special characters</li>
                  </ul></td>
          </tr>
      </table>
  </body>
</html>
