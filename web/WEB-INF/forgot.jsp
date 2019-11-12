<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Forgot Password</title>
    </head>
    <body>
        <h1>Forgot Password</h1>
        <p>Please enter your email address to retrieve your password</p>
        <form method="post" action="forgot">
        <label>Email Address:<input type="text" name="email"/></label><br>
        <input type="submit" value="Submit" name="submit" />
        </form>
    </body>
</html>
