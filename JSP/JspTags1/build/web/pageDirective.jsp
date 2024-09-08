<%-- 
    Document   : pageDirective
    Created on : 8 Sep, 2024, 12:14:44 AM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.Random, java.io.*" %> 
<%@page isErrorPage="true" %> 
<%@page session="false"  %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Page Directive</h1>
        
        <%
            Random  r=  new Random();
            int num = r.nextInt(10);
        %>
        <h3>Random Number : <%= num %></h3>
        
        <br>
        <hr>
        <br>
        <br>
        <%@include file="./include.jsp" %>
        <%--<%@include file="./jspTag1.jsp" %>--%>
        <br>
        <hr>
        <br>
        <br>
           <a href="index.html" >Back</a>
    </body>
</html>
