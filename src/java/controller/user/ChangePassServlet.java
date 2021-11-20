/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.user;

import dal.UserDAO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.User;

/**
 *
 * @author Admin
 */
public class ChangePassServlet extends HttpServlet {

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
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ChangePassServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ChangePassServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
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
        HttpSession session = request.getSession();
        User acc = (User) session.getAttribute("account");
        User ad = (User) session.getAttribute("admin");
        request.getRequestDispatcher("UsersProfile.jsp").forward(request, response);
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
        UserDAO udao = new UserDAO();
        HttpSession session = request.getSession();
        User acc = (User) session.getAttribute("account");
        User ad = (User) session.getAttribute("admin");
//        String username = request.getParameter("username");
        String oldpass = request.getParameter("oldpass");
        String newpass = request.getParameter("newpass");
        String confirm = request.getParameter("confirm");
        User term;
        if (ad!=null)   {
            term = ad;     
        } else term = acc;
        if (oldpass.equals(term.getPassword())) {
            if (!newpass.matches("^(?=.*\\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[a-zA-Z]).{3,}$")) {
                request.setAttribute("mess", "Password must contain one uppercase, one lowercase, one digit and have more than 3 letter");
                request.getRequestDispatcher("UserProfile.jsp").forward(request, response);
            } else if (newpass.equals(confirm)) {
                udao.changePass(newpass, term.getUsername());
            } else {
                request.setAttribute("mess", "Password does not match");
                request.getRequestDispatcher("UserProfile.jsp").forward(request, response);
            }
        } else {
            request.setAttribute("mess", "Wrong Password");
            request.getRequestDispatcher("UserProfile.jsp").forward(request, response);
        }
        request.setAttribute("mess", "Password changed");
        if (ad != null) {
            ad = udao.getUsername(ad.getUsername());
            session.setAttribute("admin", ad);
        } else {
            acc = udao.getUsername(acc.getUsername());
            session.setAttribute("account", acc);
        }
        request.getRequestDispatcher("UserProfile.jsp").forward(request, response);
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
