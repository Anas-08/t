<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    String name = (String) session.getAttribute("userName");
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Profile</title>
    </head>
    <body>
        
        <h1>Profile Page</h1>
        <br>
        <br>
        <h1>Welcome, <%= name %> </h1>
        
        
    </body>
</html>
