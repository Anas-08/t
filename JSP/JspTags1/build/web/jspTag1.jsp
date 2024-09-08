<%-- 
    Document   : jspTag1
    Created on : 7 Sep, 2024, 11:45:01 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Declarative Tags -> </h1>
        <%! 
            int num1 = 10;
            int num2 = 90;
            String name = "testing"; 
            
            public int doSum(){
                return num1 + num2;
            }
            public String rev(){
                StringBuffer revStr = new StringBuffer(name);
                return revStr.reverse().toString();
            }
        %>
        
        <h2>use of Scriplet Tag</h2>
        <%
            out.println("Number 1 : " + num1);
            out.println("<br>");
            out.println("Number 2 : " + num2);
            out.println("<br>");
            out.println("sum of tow number is : " + doSum());
            out.println("<br>");
            out.println("String : " + name);
            out.println("<br>");
            out.println("Reverse String : " + rev());
        %>
        
        <h2>Expression Tag</h2>
        
        <p>Num 1 : <%= num1%></p>
        <p>Num 2 : <%= num2%></p>
        <p>Sum of two number : <%= doSum() %></p>
        <p>String : <%= name%></p>
        <p>Reverse String : <%= rev() %></p>
        
        <a href="index.html" >Back</a>
    </body>
</html>
