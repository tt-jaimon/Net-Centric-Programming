
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<html>
    <head>
        <title>Friend Space</title>
        <link rel="stylesheet" type=text/css href="Style.css"/>
    </head>
    <body>
        <jsp:include page="login_header.jsp" />
        <div id="friend_details">              
    <table >
        <thead>
        <th>Friends Name
        </th>
        </thead>
        <tbody>
     
            <%
                Class.forName("org.postgresql.Driver");
                Connection conn = DriverManager.getConnection("jdbc:postgresql://localhost:5432/postgres", "postgres","jaimon@tt");
                Statement stmt = conn.createStatement();
                String user_id = request.getSession().getAttribute("loggedinUserId").toString();
                String selectUser = "SELECT * FROM friend_details WHERE user_id = '"+user_id +"';";
                ResultSet rs = stmt.executeQuery(selectUser);                
                while( rs.next() ) {
                    
                    //Get user name 
                    String FirstName = rs.getString("first_name");
                    String LastName = rs.getString("last_name");
                    int friend_id = rs.getInt("friend_id");
                    String result = FirstName+" "+LastName;
                    %>
                    <tr>
                    <td><a href="http://localhost:8080/FriendSpace/View_Friends.jsp?friend_id=<%=friend_id%>"><%= result %></a></td>
                    
                    </tr><%
                } 
                            
            %>
            
        </tbody>
    </table>
          <p><a href="Options_page.jsp">Goto Previous page</a></p>      
        </div>  
        <div id="footer">
            <p>
                Silly Guys Productions Pvt. Ltd. Copyright Product <a href="About_us.jsp"><input type="button" name="aboutus" value="About Us"></a>
            </p>
        </div>  
    </body>
</html>
