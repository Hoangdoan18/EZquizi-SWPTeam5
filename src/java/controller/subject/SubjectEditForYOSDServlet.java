/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.subject;

import dal.CategoryDAO;
import dal.SubjectDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Category;
import model.Subject;

/**
 *
 * @author ADMIN
 */
@WebServlet(name = "SubjectEditForYOSDServlet", urlPatterns = {"/SubjectEditForYOSD"})
public class SubjectEditForYOSDServlet extends HttpServlet {

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
            out.println("<title>Servlet SubjectEditForYOSDServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet SubjectEditForYOSDServlet at " + request.getContextPath() + "</h1>");
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
        String subjectID = request.getParameter("subjectID");
        Object u = session.getAttribute("account");
        Object a = session.getAttribute("admin");
        if (u != null || a != null ) {
            CategoryDAO cdao = new CategoryDAO();
            List<Category> list = cdao.getAllCategory();
            request.setAttribute("listC", list);
            request.getRequestDispatcher("SubjectEditForYOSD.jsp?subjectID="+subjectID).forward(request, response);
        } else {
            response.sendRedirect("login.jsp");
        }
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
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        String subjectID = request.getParameter("subjectID");
        String subjectTitle = request.getParameter("subjectTitle");
        String cateID = request.getParameter("cateID");
        String username = request.getParameter("username");
        SubjectDAO sdao = new SubjectDAO();
        sdao.editSubject(Integer.parseInt(subjectID),subjectTitle, Integer.parseInt(cateID), username);
        response.sendRedirect("UserOwnSubjectDetailServlet?subjectID="+subjectID+"&termsort=0");
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
