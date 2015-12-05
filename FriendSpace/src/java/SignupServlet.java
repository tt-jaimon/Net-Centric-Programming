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
@WebServlet(urlPatterns = {"/SignupServlet"})
public class SignupServlet extends HttpServlet {

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
             System.out.println("aaaaaa");
                    String new_first_name= request.getParameter("first_name");
                    String new_last_name = request.getParameter("last_name");
                      System.out.println("bbbbb");
                    String new_username = request.getParameter("username");
                    String new_pass = request.getParameter("pass");
                    String new_address = request.getParameter("address");
                    String new_mobile_no = request.getParameter("mobile_no");
                    String new_email = request.getParameter("email");
                    String new_user_id =request.getParameter("user_id");
                      System.out.println("cccc");
                    String selectUser = "insert into user_details (first_name,last_name,address,mobile_no,email,user_id,username,pass) values('"+new_first_name+"','"+new_last_name+"','"+new_address+"','"+new_mobile_no+"','"+new_email+"','"+new_user_id+"','"+new_username+"','"+new_pass+"');";
                    stmt.executeUpdate(selectUser);  
                      System.out.println("ddddd");
                   response.sendRedirect("http://localhost:8080/FriendSpace/index.jsp");
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
