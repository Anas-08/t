<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login Page</title>
    </head>
    <body>
        <h1>Login Page</h1>
        
        <form action="loginJsp.jsp" method="post" >
            <table>
                
                 <input type="hidden" name="action" value="login">
                <tr>
                    <td>Name : </td>
                    <td><input type="text" name="name" placeholder="Enter your name" required /></td>
                </tr>
                <tr>
                    <td>Password : </td>
                    <td><input type="password" name="password" required /></td>
                </tr>
                <tr>
                    <td></td>
                    <td><input type="submit" value="Login" /></td>
                </tr>
                <tr>
                    <td></td>
                    <td>Not Register yet ? <a href="./registerJsp.jsp" >Register Here</a> </td>
                </tr>
            </table>
        </form>
    </body>
</html>


<%
    String action = request.getParameter("action");
    String name = request.getParameter("name");
    String password = request.getParameter("password");
    
    if("login".equals(action)){
    try {
//                   out.print(name);
//                    out.print(password);
        
            Connection con = DB.DatabaseObjectAccess.getConnection();
            String selectQuery = "select * from register1 where name = ? and password = ?";
            PreparedStatement ps = con.prepareStatement(selectQuery);
            ps.setString(1, name);
            ps.setString(2, password);
            ResultSet row = ps.executeQuery();

            if(row.next()){
                  session.setAttribute("userName", name);
//                out.print("inside if block");
                RequestDispatcher rq = request.getRequestDispatcher("profileJsp.jsp");
                rq.forward(request, response);
                
            }else{
                out.println("<h1 style='color:red'; >Wrong name and password</h1>");

                RequestDispatcher rq = request.getRequestDispatcher("loginJsp.jsp");
                rq.include(request, response);
            }
//            if (name.equals(row.getString("name")) && password.equals(row.getString("password"))) {
//                session.setAttribute("userName", name);
//                out.print("inside if block");
////                RequestDispatcher rq = request.getRequestDispatcher("index.html");
////                rq.forward(request, response);
//            } else {
//                out.println("<h1 style='color:red'; >Wrong name and password</h1>");
//
//                RequestDispatcher rq = request.getRequestDispatcher("loginJsp.jsp");
//                rq.include(request, response);
//            }

        } catch (SQLException e) {

            System.out.println("Login error" + e.getMessage());
        }
    }
%>