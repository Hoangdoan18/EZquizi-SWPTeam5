/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.subject;

import dal.SubjectDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Category;
import model.Subject;

/**
 *
 * @author Admin
 */
@WebServlet(name = "SortController", urlPatterns = {"/sort"})
public class SortController extends HttpServlet {

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
            String username = request.getParameter("username");
            SubjectDAO sdao = new SubjectDAO();
            String cateID = request.getParameter("cateID") == null ? "":request.getParameter("cateID");
            String sortDate = request.getParameter("sortDate") == null ? "": request.getParameter("sortDate");
            String sortRatting = request.getParameter("sortRatting")== null ? "": request.getParameter("sortRatting"); 
            List<Subject> listS = new ArrayList<>();
            
                if (cateID == null || cateID.length() == 0){
                    if(Integer.parseInt(sortDate) == 1){
                        listS = sdao.getSubjectByDate(username);
                    }else if (Integer.parseInt(sortRatting) == 1){
                        listS = sdao.SortRatting(username);
                    }
                }else{
                    if(Integer.parseInt(sortDate) == 1){
                        listS = sdao.SortCateDate(cateID, username);
                    }else if (Integer.parseInt(sortRatting) == 1){
                        listS = sdao.SortCateRatting(cateID, username);
                    }
                }
            
            
           
           
            
            
             int size = listS.size();
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
        List<Subject> arr = sdao.getSubjectByPage(listS, start, end);  
        
        List<Category> ListC = sdao.getCategory();
        String sortPage = "true";
        String catePage = "true";
        request.setAttribute("num", numPage);
        request.setAttribute("ListC", ListC);
        request.setAttribute("listS", arr);
        request.setAttribute("page", page);
        
        request.setAttribute("cateID", cateID);
       
            request.setAttribute("sortDate", sortDate);
        if(cateID.length() > 0){
            request.setAttribute("catePage", catePage);
        }
  
            request.setAttribute("sortRatting", sortRatting);
 
        
        request.setAttribute("sortPage", sortPage);
        
        
        
        if(username == null || username.trim().length()==0){
            request.getRequestDispatcher("SubjectList.jsp").forward(request, response);
        }else{
            request.getRequestDispatcher("UserList.jsp").forward(request, response);
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
