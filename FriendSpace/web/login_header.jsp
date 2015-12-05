 <% if ( request.getSession().getAttribute("loggedinUserFirstName") != null ) {
    String first_name = request.getSession().getAttribute("loggedinUserFirstName").toString();                  
 %>
 <div id="loggedin">
     <p><strong>welcome,<%= first_name %></strong>
        <img src="Jaimon.jpg" width=100 height=100 style="padding-right:10px" />
    </p>
    <p><a href="LogoutServlet">Logout</a>                         <a href="Options_page.jsp">  Home</a></p>
 </div>
 <% } %>
