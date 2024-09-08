<%@page import="com.mysql.cj.xdevapi.DbDoc"%>
<%@page import="java.sql.Connection"%>
<%--<%@page import="DOA" %>--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Register</title>
    </head>
    <body>
    <center>
        <h1>Register Page</h1>
            
        <form action="registerJsp.jsp" method="post" >
            <table>
                <input type="hidden" name="action" value="insert">
                <tr>
                    <td>Name : </td>
                    <td><input type="text" name="name" placeholder="Enter your name" required /></td>
                </tr>
                <tr>
                    <td>Email : </td>
                    <td><input type="email" name="email" placeholder="Enter your email" required /></td>
                </tr>
                <tr>
                    <td>Password : </td>
                    <td><input type="password" name="password" required /></td>
                </tr>
                <tr>
                    <td>Mobile : </td>
                    <td><input type="text" name="mobile"  placeholder="Enter your mobile" required /></td>
                </tr>
                <tr>
                    <td>City : </td>
                    <td><input type="text" name="city"  placeholder="Enter your city" required /></td>
                </tr>

                <tr>
                    <td></td>
                    <td><input type="submit" value="Register" /></td>
                </tr>
                <tr>
                    
                    <td></td>
                    <td>Already Register <a href="./loginJsp.jsp" >Login Here</a> </td>
                </tr>
            </table>
        </form>
        
          </center>

   </body>
</html>

<%
    String action = request.getParameter("action");
    
    String name = request.getParameter("name");
    String email = request.getParameter("email");
    String password = request.getParameter("password");
    String mobile = request.getParameter("mobile");
    String city = request.getParameter("city");
//  
//    
//    out.println(name);
//    out.println(email);
//    out.println(password);
//    out.println(mobile);
//    out.println(city);

    if ("insert".equals(action)) {
            Connection con = DB.DatabaseObjectAccess.getConnection();
            int rows = DB.DatabaseObjectAccess.insert(con, name, email, password, mobile, city);

            if (rows > 0) {
                out.print("<script>alert('Record Inserted')</script>");
            } else {
                out.print("<script>alert('Record Not Inserted')</script>");
            }
    }
    
%>   


 