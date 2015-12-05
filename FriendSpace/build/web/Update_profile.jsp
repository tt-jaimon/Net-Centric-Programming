<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<!DOCTYPE html>
<html>
<head>
    <title>Friend Space</title>
    <link rel="stylesheet" type=text/css href="Style.css" />
</head>
<body>
   <jsp:include page="login_header.jsp" />
   <%
        Class.forName("org.postgresql.Driver");
                Connection conn = DriverManager.getConnection("jdbc:postgresql://localhost:5432/postgres", "postgres","jaimon@tt");
                Statement stmt = conn.createStatement();
                String user_id = request.getSession().getAttribute("loggedinUserId").toString();
                String selectUser = "SELECT * FROM user_details WHERE user_id = '"+user_id+"';";
                ResultSet rs = stmt.executeQuery(selectUser);
                if( rs.next() ) {
                    String db_first_name= rs.getString("first_name");
                    String db_last_name = rs.getString("last_name");
                    String db_username = rs.getString("username");
                    String db_pass = rs.getString("pass");
                    String db_address = rs.getString("address");
                    String db_mobile_no = rs.getString("mobile_no");
                    String db_email = rs.getString("email");
                %>
    <div id="friend_details">
        <h1 style="padding-left:30px">Profile Details
        <img src="rpk.jpg" width=200 height=200 style="padding-right:10px" /></h1>
        <form autocomplete="on" action="UpdateProfile" method="post">
            <fieldset>
                <legend>Personal Details</legend>
                <table>
                    <tr>
                        <td>First Name:</td>
                        <td><input type="text" name="first_name" value="<%=db_first_name%>" ></td>
                    </tr>
                    <tr>
                        <td>Last Name:</td>
                        <td><input type="text" name="last_name" value="<%=db_last_name%>" ></td>
                    </tr>
                </table>
            </fieldset>
        <p>  </p>
            <fieldset>
                <legend>Contact Details</legend>
                <table>
                    <tr>
                        <td>Phone No:</td>
                        <td><input type="text" name="mobile_no" value="<%=db_mobile_no%>" ></td>
                    </tr>
                    <tr>
                        <td>Email:</td>
                        <td><input type="text" name="email" value="<%=db_email%>" ></td>
                    </tr>
                    <tr>
                        <td>Address:</td>
                        <td><input type="text" name="address" value="<%=db_address%>"></td>
                    </tr>
                </table>
            </fieldset>        
        <p>  </p>
            <fieldset>
                <legend>Security Details</legend>
                <table>
                    <tr>
                        <td>Username:</td>
                        <td><input type="text" name="username" value="<%=db_username%>" ></td>
                    </tr>
                    <tr>
                        <td>Password:</td>
                        <td><input type="password" name="pass" value="<%=db_pass%>" ></td>
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
                <%}%>
</body>
</html>
