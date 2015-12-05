<!DOCTYPE html>
<html>
    <head>
        <title>Friend Space</title>
        <link rel="stylesheet" type=text/css href="Style.css"/>
    </head>
    <body>
        <jsp:include page="login_header.jsp" />
        <div id="friend_details">
            <h1 style="padding-left:30px">
                Friend Details
                <img src="profile_pic.png" width=200 height=200 style="padding-right:10px" />
            </h1>
            <form autocomplete="on" action="AddFriends">
                <fieldset>
                    <legend>Personal Details</legend>
                    <table>
                        <tr>
                            <td>First Name:</td>
                            <td><input type="text" name="first_name" value="" placeholder="First Name"></td>
                        </tr>
                        <tr>
                            <td>Last Name:</td>
                            <td><input type="text" name="last_name" value="" placeholder="Last Name"></td>
                        </tr>
                        <tr>
                            <td>Nick Name:</td>
                            <td><input type="text" name="friend_nick_name" value="" placeholder="Nick Name"></td>
                        </tr>
                        <tr>
                            <td>DOB:</td>
                            <td><input type="text" name="date_of_birth" value="" placeholder="dob"></td>
                        </tr>
                        <tr>
                            <td>Category:</td>
                            <td><input type="text" name="category" value="" placeholder="Category"></td>
                        </tr>
                    </table>
                </fieldset>
            <p>  </p>
            <fieldset>
                    <legend>Contact Details</legend>
                    <table>
                        <tr>
                            <td>Phone No:</td>
                            <td><input type="text" name="phoneno" value="" placeholder="mobile_no"></td>
                        </tr>
                        <tr>
                            <td>Email:</td>
                            <td><input type="text" name="email" value="" placeholder="Email"></td>
                        </tr>
                        <tr>
                            <td>Address:</td>
                            <td><input type="text" name="address" value="" placeholder="Address"></td>
                        </tr>
                         <tr>
                        <td>Description:</td>
                        <td><textarea name="description"></textarea></td>
                    </tr>
                    </table>
                </fieldset>
            <input type="submit" name="Save" value="Save">
            </form>
            <p></p>
            <a href="Options_page.jsp">Goto Previous page</a>
        </div>
        <div id="footer">
            <p>
                Silly Guys Productions Pvt. Ltd. Copyright Product <a href="About_us.jsp"><input type="button" name="aboutus" value="About Us"></a>
            </p>
        </div>
</body>
</html>
