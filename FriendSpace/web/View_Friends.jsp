
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="javax.servlet.http.HttpSession"%>
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
                String friend_id=request.getParameter("friend_id");
                String selectUser = "SELECT * FROM friend_details WHERE user_id = '"+user_id +"' and friend_id="+friend_id+";";
                ResultSet rs = stmt.executeQuery(selectUser);
                if( rs.next() ) {
                    int db_friend_id= rs.getInt("friend_id");
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
        <img src="rpk.jpg" width=200 height=200 style="padding-right:10px" /></h1>
        <form autocomplete="on">            
            <fieldset>
                <legend>Personal Details</legend>
                <table>
                    <tr>
                        <td>First Name:</td>
                        <td><%= db_first_name %></td>
                    </tr>
                    <tr>
                        <td>Last Name:</td>
                        <td><%=db_last_name%></td>
                    </tr>
                    <tr>
                        <td>Nick Name:</td>
                        <td><%=db_nick_name%></td>
                    </tr>
                    <tr>
                        <td>DOB:</td>
                        <td><%=db_dob%></td>
                    </tr>
                    <tr>
                        <td>Category:</td>
                        <td><%=db_category%></td>
                    </tr>
                </table>
            </fieldset>
        </form>
        <p>  </p>
        <form autocomplete="on">
            <fieldset>
                <legend>Contact Details</legend>
                <table>
                    <tr>
                        <td>Phone No:</td>
                        <td><%=db_mobile_no%></td>
                    </tr>
                    <tr>
                        <td>Email:</td>
                        <td><%=db_email%></td>
                    </tr>
                    <tr>
                        <td>Address:</td>
                        <td><%=db_address%></td>
                    </tr>
                    <tr>
                        <td>Description:</td>
                        <td><%=db_description%></td>
                    </tr>
                </table>
            </fieldset>
        </form>
                <p>
                    <a href="http://localhost:8080/FriendSpace/Edit_Profile.jsp?friend_id=<%=friend_id%>"><input type="button" name="edit" value=" Edit"></a>
                    <a href="Options_page.jsp"><input type="button" name="remove" value="Remove" onclick="remove()" ></a>
                </p>
                <a href="Options_page.jsp">Goto Previous page</a>
               
    </div>
    <div id="footer">
        <p>
            Silly Guys Productions Pvt. Ltd. Copyright Product <a href="About_us.jsp"><input type="button" name="aboutus" value="About Us"></a>
        </p>
    </div>
   <script>
        function remove(){
          <%String friend_remove = "delete from friend_details WHERE friend_id = '"+ db_friend_id +"';";
                 stmt.executeUpdate(friend_remove);%>
        }
         <%}%>
    </script>
</body>
</html>
