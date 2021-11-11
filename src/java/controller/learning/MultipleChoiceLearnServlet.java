/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.learning;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Question;
import dal.MultiplechoiceDAO;
import javax.servlet.http.HttpSession;
import model.User;

/**
 *
 * @author USER
 */
@WebServlet(name = "MultipleChoiceLearnServlet", urlPatterns = {"/multiplechoice"})
public class MultipleChoiceLearnServlet extends HttpServlet {

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
            out.println("<title>Servlet MultipleChoiceLearnServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet MultipleChoiceLearnServlet at " + request.getContextPath() + "</h1>");
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
        int subjectID = Integer.parseInt(request.getParameter("subjectID"));
        request.setAttribute("subjectID", subjectID);

        MultiplechoiceDAO md = new MultiplechoiceDAO();
        HttpSession session = request.getSession();
        session.setAttribute("subjectID", subjectID);
        String username = "";
        if (session.getAttribute("account") != null) {
            User user = (User) session.getAttribute("account");
            username = user.getUsername();
        } else if (session.getAttribute("admin") != null) {
            User user = (User) session.getAttribute("admin");
            username = user.getUsername();
        }
        if (username != "") {
            //Add new MultiplechoiceLearn
            if (!md.isAdded(subjectID, username)) {
                md.AddMultipleChoiceLearn(md.GetAddListQuestion(subjectID), username);
                Question question = md.getQuestion(subjectID, username);
                session.setAttribute("question", question);
                int answer = question.getListanswer().indexOf(question.getAnswer());
                session.setAttribute("answer", answer);
                int count = md.GetCountQuestionbySubject(subjectID, username);
                int remain = md.GetCountQuestionNotLearned(subjectID, username);
                request.setAttribute("remain", remain);
                request.setAttribute("sum", count);
                request.getRequestDispatcher("MultiplechoiceLearn.jsp").forward(request, response);
            } else {
                int count = md.GetCountQuestionbySubject(subjectID, username);
                int remain = md.GetCountQuestionNotLearned(subjectID, username);
                request.setAttribute("remain", remain);
                request.setAttribute("sum", count);
                if (remain != 0) {
                    Question question = md.getQuestion(subjectID, username);
                    session.setAttribute("question", question);
                    int answer = question.getListanswer().indexOf(question.getAnswer());
                    session.setAttribute("answer", answer);
                    request.getRequestDispatcher("MultiplechoiceLearn.jsp").forward(request, response);
                } else {
                    response.sendRedirect("ErrorMultiplechoice.jsp");
                }
            }
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
        int b = Integer.parseInt(request.getParameter("subjectID"));
        if (request.getParameter("option") == null) {
        } else {
            int a = Integer.parseInt(request.getParameter("option"));
            MultiplechoiceDAO md = new MultiplechoiceDAO();
            HttpSession session = request.getSession();
            User user = (User) session.getAttribute("account");
            User admin = (User) session.getAttribute("admin");
            if (a == (int) session.getAttribute("answer")) {
                Question ques = (Question) session.getAttribute("question");
                if (user != null) {
                    md.updateLearned(user.getUsername(), ques.getQuestionID(), true);
                } else if (admin != null) {
                    md.updateLearned(admin.getUsername(), ques.getQuestionID(), true);
                }
            }
        }
        response.sendRedirect("multiplechoice?subjectID=" + b);
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
