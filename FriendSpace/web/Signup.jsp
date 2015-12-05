<!DOCTYPE html>
<html>
<head>
    <title>Friend Space</title>
    <link rel="stylesheet" type=text/css href="Style.css" />

</head>
<body>   
    <div id="friend_details">
        <h1 style="padding-left:30px">Profile Details
            <img src="profile_pic.png" width=200 height=200 style="padding-right:10px" /></h1>
      
        <form autocomplete="on" action="SignupServlet" method="post">
            <fieldset>
                <legend>Personal Details</legend>
                <table>
                    <tr>
                        <td>First Name:</td>
                        <td><input type="text" name="first_name" value="" ></td>
                    </tr>
                    <tr>
                        <td>Last Name:</td>
                        <td><input type="text" name="last_name" value="" ></td>
                    </tr>
                </table>
            </fieldset>
        <p>  </p>
            <fieldset>
                <legend>Contact Details</legend>
                <table>
                    <tr>
                        <td>Phone No:</td>
                        <td><input type="text" name="mobile_no" value="" ></td>
                    </tr>
                    <tr>
                        <td>Email:</td>
                        <td><input type="text" name="email" value="" ></td>
                    </tr>
                    <tr>
                        <td>Address:</td>
                        <td><input type="text" name="address" value=""></td>
                    </tr>
                </table>
            </fieldset>        
        <p>  </p>
            <fieldset>
                <legend>Security Details</legend>
                <table>                    
                    <tr>
                        <td>User_id:</td>
                        <td><input type="text" name="user_id" value="" ></td>
                    </tr>
                    <tr>
                        <td>Username:</td>
                        <td><input type="text" name="username" value="" ></td>
                    </tr>
                    <tr>
                        <td>Password:</td>
                        <td><input type="password" name="pass" value="" ></td>
                    </tr>
                    <tr>
                        <td>Confirm password:</td>
                        <td><input type="password" name="confirm_password" value=""></td>
                    </tr>                    
                </table>
            </fieldset>
           <p><input type="submit" name="save" value="Save"></p>        
        </form>
        <a href="Options_page.jsp">Goto Previous page</a>
</div>   
    <div id="footer">
        <p>
            Silly Guys Productions Pvt. Ltd. Copyright Product <a href="About_us.jsp"><input type="button" name="aboutus" value="About Us"></a>
        </p>
    </div>   
    <script type="text/javascript">

        function validate_form() {
            valid = true;
            if (f1.firstname.value =="") {
                alert("Please fill in the First Name box");
                valid = false;
            }
            if (f3.username.value == "") {
                alert("Please fill in the Username box");
                valid = false;
            }
            if (f3.password.value == "") {
                alert("Please fill in the Password box");
                valid = false;
            }
            if (f3.confirm_password.value == "") {
                alert("Please fill in the Confirm password box");
                valid = false;
            }
            if (f3.password.value != f3.confirm_password.value) {
                alert("Password and confirm password dosnt match");
                valid = false;
            }            
            if (valid == true) {
                window.location.href = "Login.html";    
            }
        }
    </script>
</body>
</html>
