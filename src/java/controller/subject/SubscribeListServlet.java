/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.subject;

import dal.SubjectDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Category;
import model.Subscribe;
import model.User;

/**
 *
 * @author Admin
 */
public class SubscribeListServlet extends HttpServlet {

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
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        HttpSession session = request.getSession();
        SubjectDAO pdao = new SubjectDAO();
        User a = (User) session.getAttribute("account");
        User b = (User) session.getAttribute("admin");
        String cate = request.getParameter("c") == null ? "0" : request.getParameter("c");
        int category = Integer.parseInt(cate);
        String s = request.getParameter("sort") == null ? "0" : request.getParameter("sort");
        int sort = Integer.parseInt(s);

        String username = request.getParameter("u") == null ? "" : request.getParameter("u");
        String search = request.getParameter("s") == null ? "" : request.getParameter("s");

//        List<Subject> listS = pdao.listQuery(category, username, search, sort);
        List<Subscribe> listF;
        if (b != null) {
            listF = pdao.getSubscribeSubject(b.getUsername());
        } else {
            listF = pdao.getSubscribeSubject(a.getUsername());
        }

        request.setAttribute("listF", listF);
        int size = listF.size();
        int numperPage = 9;
        int numPage = size / numperPage + (size % numperPage == 0 ? 0 : 1);
        String spage = request.getParameter("page");
        int page;
        if (spage == null) {
            page = 1;
        } else {
            page = Integer.parseInt(spage);
        }

        int start, end;
        start = (page - 1) * numperPage;
        end = Math.min(size, page * numperPage);
        List<Subscribe> arr = pdao.getSubscribeByPage(listF, start, end);
        List<Category> ListC = pdao.getCategory();

        request.setAttribute("num", numPage);
        request.setAttribute("ListC", ListC);
        request.setAttribute("listF", arr);
        request.setAttribute("page", page);
        request.setAttribute("c", category);
        request.setAttribute("s", search);
        request.setAttribute("sort", sort);
        request.setAttribute("u", username);

        request.getRequestDispatcher("SubscribeList.jsp").forward(request, response);
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
        processRequest(request, response);
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
