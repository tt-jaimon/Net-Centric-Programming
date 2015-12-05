/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Jai
 */
@WebServlet(urlPatterns = {"/AddFriends"})
public class AddFriends extends HttpServlet {

    /**
     * Processes requests for both HTTP
     * <code>GET</code> and
     * <code>POST</code> methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet AddFriends</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AddFriends at " + request.getContextPath() + "</h1>");            
              try {
                Class.forName("org.postgresql.Driver");
                Connection conn = DriverManager.getConnection("jdbc:postgresql://localhost:5432/postgres", "postgres","jaimon@tt");
                Statement stmt = conn.createStatement();
                String user_id = request.getSession().getAttribute("loggedinUserId").toString();
                String selectfriendId = "SELECT * FROM friend_details WHERE user_id = '"+user_id +"';";
                ResultSet rs = stmt.executeQuery(selectfriendId);
                int friend_id=-1;
                while(rs.next()) {
                     int temp=rs.getInt("friend_id");
                     if(friend_id<temp)
                         friend_id=temp;
                } 
                friend_id++;
                    String new_first_name= request.getParameter("first_name");
                    String new_last_name = request.getParameter("last_name");
                    String new_nick_name = request.getParameter("friend_nick_name");
                    String new_dob = request.getParameter("date_of_birth");
                    String new_category = request.getParameter("category");
                    String new_address = request.getParameter("address");
                    String new_mobile_no = request.getParameter("mobile_no");
                    String new_email = request.getParameter("email");
                    String new_description =request.getParameter("description");
                    String selectUser = "insert into friend_details(friend_id,first_name,last_name,friend_nick_name,date_of_birth,category,address,mobile_no,email,description,user_id) values("+friend_id+",'"+new_first_name+"','"+new_last_name+"','"+new_nick_name+"','"+new_dob+"','"+new_category+"','"+new_address+"','"+new_mobile_no+"','"+new_email+"','"+new_description+"','"+user_id+"');";
                    stmt.executeUpdate(selectUser);                
                   response.sendRedirect("http://localhost:8080/FriendSpace/Options_page.jsp");
                }
            catch( Exception E ) {
                out.println(E);
            }
            
            out.println("</body>");
            out.println("</html>");
        } finally {            
            out.close();
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP
     * <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP
     * <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
}
