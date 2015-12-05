
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
                String f_id=request.getParameter("friend_id");
                String selectUser = "SELECT * FROM friend_details WHERE user_id = '"+user_id +"' and friend_id="+f_id+";";
                ResultSet rs = stmt.executeQuery(selectUser);
                if( rs.next() ) {
                    String db_first_name= rs.getString("first_name");
                    String db_last_name = rs.getString("last_name");
                    String db_nick_name = rs.getString("friend_nick_name");
                    String db_dob = rs.getString("date_of_birth");
                    String db_category = rs.getString("category");
                    String db_address = rs.getString("address");
                    String db_mobile_no = rs.getString("mobile_no");
                    String db_email = rs.getString("email");
                    String db_description = rs.getString("description");
                %>
    
    <div id="friend_details">
        <h1 style="padding-left:30px">Friend Details
            <img src="Hareesh.jpg" width=200 height=200 style="padding-right:10px" /></h1>
        <form autocomplete="on" action="EditFriends" method="post">
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
                    <tr>
                        <td>Nick Name:</td>
                        <td><input type="text" name="friend_nick_name" value="<%=db_nick_name%>" ></td>
                    </tr>
                    <tr>
                        <td>DOB:</td>
                        <td><input type="text" name="date_of_birth" value="<%=db_dob%>" ></td>
                    </tr>
                    <tr>
                        <td>Category:</td>
                        <td><input type="text" name="category" value="<%=db_category%>" ></td>
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
                    <tr>
                        <td>Description:</td>
                        <td><textarea name="description"><%=db_description%></textarea> >
                        <input type="hidden" name="friend_id" value="<%=f_id %>"></td>
                    </tr>
                </table>
                    
            </fieldset>
            <p><input type="submit" name="save" value="Save"></p>
        </form>    
                <a href="Options_page.jsp">Goto Previous page</a>
                <%  
            }%>
    </div>
    <div id="footer">
        <p>Silly Guys Productions Pvt. Ltd. Copyright Product <a href="About_us.jsp"><input type="button" name="aboutus" value="About Us"></a>
        </p>
    </div>
   
</body>
</html>
