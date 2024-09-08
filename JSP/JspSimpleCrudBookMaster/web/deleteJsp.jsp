<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.util.*, java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Delete Page</title>
    </head>
    <body>
        <center>
            <h1>Delete Page</h1>
            
            <form action="deleteJsp.jsp" method="post">
                <table>
                    <input type="hidden"  name="action" value="delete"/>
                    <tr>
                        <td>Id : </td>
                        <td><input type="text" placeholder="id" name="bookid" required /></td>
                    </tr>
                   
                    <tr>
                        <td> </td>
                        <td><input type="submit" value="Delete"/></td>
                    </tr>
                    
                    <tr>
                        <td></td>
                        <td><a href="./index.html">Back</a></td>
<!--                     <td> <a href="./editJsp.jsp" >Go to Edit Page</a> </td>
                        <td> <a href="./deleteJsp.jsp">Go to Delete Page</a> </td>  -->
                    </tr>
                    
                    
                </table>
            </form>
        </center>
    </body>
</html>



<%
    
    String action = request.getParameter("action");
    String id = request.getParameter("bookid");


   try{
   
//    int idd = Integer.parseInt( request.getParameter("bookid"));

   if("delete".equals(action)){
        
        Connection con = DB.DOA.getConnection();
        String delete = "delete from bookmaster where bookid = ?";
        PreparedStatement ps = con.prepareStatement(delete);
//        ps.setInt(1, idd);
        ps.setString(1, id);
        int rows = ps.executeUpdate();
//        int rows = DB.DOA.delete(con, idd);
        
        if(rows > 0){
            out.println("<script>alert('Record Deleted')</script>");
        }else{
            out.println("<script>alert('Record Not Deleted')</script>");
        }
   }
   
   }catch(NumberFormatException e){
       System.out.println("Number Delete Error "+ e.getMessage());
   }catch(SQLException e){
       System.out.println("Sql error delete "+ e.getMessage());
   }

%>
