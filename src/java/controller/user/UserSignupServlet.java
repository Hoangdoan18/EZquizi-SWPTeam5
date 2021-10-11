/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.user;

import dal.LoginSignupDAO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.User;

/**
 *
 * @author Admin
 */
@WebServlet(name = "UsersSignupServlet", urlPatterns = {"/signup"})
public class UserSignupServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("signup.jsp").forward(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String user = request.getParameter("newuser");
        String pass = request.getParameter("newpass");
        String repass = request.getParameter("repass");
        String name = request.getParameter("newname");
        int age = Integer.parseInt(request.getParameter("newage"));
        String email = request.getParameter("newemail");
        //int phone = Integer.parseInt(request.getParameter("newphone").toString());
        String phone = request.getParameter("newphone");

        LoginSignupDAO udao = new LoginSignupDAO();
        if (user.length() < 3) {
            request.setAttribute("mess1", "Username must have more than 3 letter");
            request.getRequestDispatcher("signup.jsp").forward(request, response);
        } else if (!pass.matches("^(?=.*\\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[a-zA-Z]).{3,}$")) {
            //mật khẩu bao gồm chữ thường, chữ hoa và 3 kí tự trở lên 
            request.setAttribute("mess2", "Password must contain one uppercase, one lowercase, one digit and have more than 3 letter");
            request.getRequestDispatcher("signup.jsp").forward(request, response);
        } else if (udao.check(user)) {
            request.setAttribute("mess1", "Username taken");
            request.getRequestDispatcher("signup.jsp").forward(request, response);
        } else if (!pass.equals(repass)) {
            request.setAttribute("mess3", "Password does not match!");
            request.getRequestDispatcher("signup.jsp").forward(request, response);
        } else {
            udao.addUser(user, pass, email, name, age, phone);
            User a = udao.login(user, pass);
            HttpSession session = request.getSession();
            session.setAttribute("account", a);
            response.sendRedirect("index.jsp");
        }
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

