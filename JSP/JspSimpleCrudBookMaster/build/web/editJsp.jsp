<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.mysql.cj.xdevapi.PreparableStatement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Edit Page</title>
    </head>
    <body>
        <center>
            <h1>Edit Page</h1>
            
            <form action="editJsp.jsp" method="post">
                <table>
                    <input type="hidden"  name="action" value="update"/>
                    <tr>
                        <td>Book Id : </td>
                        <td><input type="text" placeholder="enter book id" name="bookid" required /></td>
                    </tr>
                    <tr>
                        <td>Book name : </td>
                        <td><input type="text" placeholder="enter book name" name="bookname" required /></td>
                    </tr>
                    <tr>
                        <td>Book Price : </td>
                        <td><input type="text" placeholder="enter book price" name="bookprice" required /></td>
                    </tr>
                    <tr>
                        <td> </td>
                        <td><input type="submit" value="Edit"/></td>
                    </tr>
                    
                    <tr>
                         <td></td>
                        <td><a href="./index.html">Back</a></td> 
                    </tr>
                    
                    
                </table>
            </form>
        </center>
    </body>
</html>



<%
    
    String action = request.getParameter("action");
    String id = request.getParameter("bookid");
    String name = request.getParameter("bookname");
    String price = request.getParameter("bookprice");
    
   if("update".equals(action)){
        
        try{
            Connection con = DB.DOA.getConnection();
//        int rows = DB.DOA.insert(con, id, name, price);
        String update = "update bookmaster set bookname =?, bookprice =? where bookid = ?";
        PreparedStatement ps = con.prepareStatement(update);
        ps.setString(1, name);
        ps.setString(2, price);
        ps.setString(3, id);
        int rows = ps.executeUpdate();
        
        if(rows > 0){
            out.println("<script>alert('Record Updated')</script>");
        }else{
            out.println("<script>alert('Record Not Updated')</script>");
        }
        }catch(SQLException e){
            System.out.println("update error "+e.getMessage());
        }
        
   }
   


%>
