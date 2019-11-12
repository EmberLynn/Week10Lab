<%-- 
    Document   : login
    Created on : 30-Oct-2019, 1:21:49 PM
    Author     : awarsyle
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
    </head>
    <body>
        <h1>Login</h1>
        <form action="login" method="post">
            email: <input type="text" name="email"><br>
            password: <input type="password" name="password"><br>
            <input type="submit" value="Login"><br>
        </form>
        <a href="forgot">Forgot Password?</a>
        
            
    </body>
</html>
