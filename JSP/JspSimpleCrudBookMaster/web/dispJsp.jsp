<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Display Page</title>
    </head>
    <body>
    <center>
        
        <h1>Display Page</h1>
        
        <%
            Connection con = DB.DOA.getConnection();
            String select = "select * from bookmaster";
            PreparedStatement ps = con.prepareStatement(select);
            ResultSet res = ps.executeQuery();
        %>
         <table border="1" cellpadding="12" >
             <tr>
                 <td>Id</td>
                 <td>Name</td>
                 <td>Price</td>
             </tr>
        <%
            while(res.next()){
            %>
           
                <tr>
                    <td><%= res.getString("bookid") %></td>
                    <td><%= res.getString("bookname") %></td>
                    <td><%= res.getString("bookprice") %></td>
                </tr>
            
        <%
            
            }
        %>
        
        </table>
        
        <br>
        <br>
        <a href="./index.html" >Back</a>
    </center>
    </body>
</html>
