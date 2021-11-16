/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.learning;

import dal.TestSummaryDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Question;
import model.Test;
import model.User;

/**
 *
 * @author USER
 */
@WebServlet(name = "TestSummaryServlet", urlPatterns = {"/testsummary"})
public class TestSummaryServlet extends HttpServlet {

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
            out.println("<title>Servlet TestSummaryServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet TestSummaryServlet at " + request.getContextPath() + "</h1>");
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
        int testid = Integer.parseInt(request.getParameter("testid"));
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
        HttpSession session = request.getSession();
        TestSummaryDAO td = new TestSummaryDAO();
        int testid = td.getLastTestID();
        int subjectID = Integer.parseInt(request.getParameter("subjectID"));
        request.setAttribute("subjectID", subjectID);
        User admin = (User) session.getAttribute("admin");
        User user = (User) session.getAttribute("account");
        ArrayList<Question> list = (ArrayList<Question>) session.getAttribute("test");
        ArrayList<Test> testlist = new ArrayList<Test>();
        String[] listanswer = new String[10];
        
        for (int i = 0; i < 10; i++) {
            listanswer[i] = request.getParameter("answer" + i);
        }
        request.setAttribute("listanswer", listanswer);
        int i = 0;
        int point = 0;
        for (Question item : list) {
            if(item.getAnswer().equalsIgnoreCase(listanswer[i])){
                testlist.add(new Test(testid, item.getQuestionID(), listanswer[i], true));
                point++;
            }else{
                testlist.add(new Test(testid, item.getQuestionID(), listanswer[i], false));
            }
            i++;
        }
        request.setAttribute("point", point);
        if (admin != null) {
            td.AddTest(admin.getUsername(), testid);
            td.AddTestSummary(testlist, testid);
        } else if (user != null) {
            td.AddTest(user.getUsername(), testid);
            td.AddTestSummary(testlist, testid);
        }
        request.getRequestDispatcher("TestSummary.jsp").forward(request, response);
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
