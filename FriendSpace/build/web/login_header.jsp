 
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%if ( request.getSession().getAttribute("loggedinUserId") == null ){
                    response.sendRedirect("index.jsp");
}
else{
   try {
     Class.forName("org.postgresql.Driver");
                Connection conn = DriverManager.getConnection("jdbc:postgresql://localhost:5432/postgres", "postgres","jaimon@tt");
                Statement stmt = conn.createStatement();                
                String user_id = request.getSession().getAttribute("loggedinUserId").toString();
                String selectUser = "SELECT * FROM user_details WHERE user_id = '" +user_id+ "';";
                ResultSet rs = stmt.executeQuery(selectUser);
                String first_name="" ;
                if( rs.next() ) {
                    first_name = rs.getString("first_name");
                }
 %>
 <div id="loggedin">
     <p><strong>welcome,<%= first_name %></strong>
        <img src="Jaimon.jpg" width=100 height=100 style="padding-right:10px" />
    </p>
    <p><a href="LogoutServlet">Logout</a>                         <a href="Options_page.jsp">  Home</a></p>
 </div>
 <% } catch( Exception E ) {
        out.println(E);
            }} %>
