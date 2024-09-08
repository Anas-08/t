<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Insert Page</title>
    </head>
    <body>
        <center>
            <h1>Insert Page</h1>
            
            <form action="insertJsp.jsp" method="post">
                <table>
                    <input type="hidden"  name="action" value="insert"/>
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
                        <td><input type="submit" value="Insert"/></td>
                    </tr>
                    
                    <tr>
                        <td> <a href="./editJsp.jsp" >Go to Edit Page</a> </td>
                        <td> <a href="./deleteJsp.jsp">Go to Delete Page</a> </td>  
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
    
   if("insert".equals(action)){
        
        Connection con = DB.DOA.getConnection();
        int rows = DB.DOA.insert(con, id, name, price);
        
        if(rows > 0){
            out.println("<script>alert('Record Inserted')</script>");
        }else{
            out.println("<script>alert('Record Not Inserted')</script>");
        
        }
   }
   


%>
