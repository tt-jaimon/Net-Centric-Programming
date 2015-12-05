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

/**
 *
 * @author Jai
 */
@WebServlet(urlPatterns = {"/EditFriends"})
public class EditFriends extends HttpServlet {

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
             try {
                Class.forName("org.postgresql.Driver");
                Connection conn = DriverManager.getConnection("jdbc:postgresql://localhost:5432/postgres", "postgres","jaimon@tt");
                Statement stmt = conn.createStatement();
                    String new_friend_id= request.getParameter("friend_id");
                    String new_first_name= request.getParameter("first_name");
                    String new_last_name = request.getParameter("last_name");
                    String new_nick_name = request.getParameter("friend_nick_name");
                    String new_dob = request.getParameter("date_of_birth");
                    String new_category = request.getParameter("category");
                    String new_address = request.getParameter("address");
                    String new_mobile_no = request.getParameter("mobile_no");
                    String new_email = request.getParameter("email");
                    String new_description =request.getParameter("description");
                    String selectUser ="update friend_details set first_name='"+new_first_name+"' where friend_id="+new_friend_id+";";
                    stmt.executeUpdate(selectUser);
                    selectUser ="update friend_details set last_name='" +new_last_name+"' where friend_id="+new_friend_id+";";
                    stmt.executeUpdate(selectUser);
                    selectUser ="update friend_details set friend_nick_name='" + new_nick_name+"' where friend_id="+new_friend_id+";";
                    stmt.executeUpdate(selectUser);
                    selectUser ="update friend_details set date_of_birth='"+new_dob+"' where friend_id="+new_friend_id+";";
                    stmt.executeUpdate(selectUser);
                    selectUser ="update friend_details set category='"+ new_category +"' where friend_id="+new_friend_id+";";
                    stmt.executeUpdate(selectUser);
                    selectUser ="update friend_details set address='"+new_address+"' where friend_id="+new_friend_id+";";
                    stmt.executeUpdate(selectUser);
                    selectUser ="update friend_details set mobile_no='"+new_mobile_no+"' where friend_id="+new_friend_id+";";
                    stmt.executeUpdate(selectUser);
                    selectUser ="update friend_details set email='"+new_email+"' where friend_id="+new_friend_id+";";
                    stmt.executeUpdate(selectUser);
                    selectUser ="update friend_details set description='"+new_description+"' where friend_id="+new_friend_id+";";
                    stmt.executeUpdate(selectUser);                   
                    response.sendRedirect("http://localhost:8080/FriendSpace/Options_page.jsp");
                }
            catch( Exception E ) {
                System.out.println(E);
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
