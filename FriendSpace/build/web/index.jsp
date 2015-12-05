<!DOCTYPE html>
<html>
    <head>
        <title>Friend Space</title>
        <link rel="stylesheet" type=text/css href="Style.css"/>
    </head>
    <body>
        <div id="login">            
            <h1>Login</h1>
            <form action="LoginServlet" Method ="POST">
            <p><input type="text" name="username" value="" id="user" placeholder="Username"></p>
            <p><input type="password" name="pass" value="" id="pass" placeholder="Password"></p>
            <p><input type="submit" name="signin" value="Sign In" >
                <input type="button" name="signup" value="Sign Up" onclick="sign()">
            </p>
            </form>            
        </div>
        <div id="footer">
            <p>
                Silly Guys Productions Pvt. Ltd. Copyright Product <a href="About_us.jsp"><input type="button" name="aboutus" value="About Us"></a>
            </p>
        </div>
    <script>       
        function sign() {
            window.location.href = "Signup.jsp";
        }
    </script>
    </body>
</html>
