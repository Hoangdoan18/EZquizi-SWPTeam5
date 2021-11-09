/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dal;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import model.Term;

/**
 *
 * @author ADMIN
 */
public class TermDAO {

    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    public List<Term> getTermByID(int subjectID) {
        String query = "SELECT * from SubjectDetail where subjectID = ?";
        List<Term> list = new ArrayList<>();
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1, subjectID);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Term(rs.getInt(1),
                        rs.getInt(2),
                        rs.getString(3),
                        rs.getString(4)));
            }
            return list;
        } catch (Exception e) {
        }
        return null;

    }

    public List<Term> getTermByIDsorted(int subjectID) {
        String query = "SELECT * from SubjectDetail where subjectID = ? order by term asc";
        List<Term> list = new ArrayList<>();
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1, subjectID);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Term(rs.getInt(1),
                        rs.getInt(2),
                        rs.getString(3),
                        rs.getString(4)));
            }
            return list;
        } catch (Exception e) {
        }
        return null;

    }
    
    public void addTerm(int subjectID, String term, String definition) {
        String query = "insert into SubjectDetail (subjectID,term,[definition]) values (?,?,?)";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1, subjectID);
            ps.setString(2, term);
            ps.setString(3, definition);
            ps.executeUpdate();
        } catch (Exception SQLException) {
        }
    }
    public void editTerm(int questionID, int subjectID, String term, String definition) {
        String query = "UPDATE SubjectDetail \n"
                + "SET subjectID = ?,\n"
                + "term = ?,\n"
                + "[definition] = ? \n"
                + "WHERE questionID =?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1, subjectID);
            ps.setString(2, term);
            ps.setString(3, definition);
            ps.setInt(4, questionID);
            ps.executeUpdate();
        } catch (Exception SQLException) {
        }
    }
    public void deleteTerm(int questionID) {
        String query = "DELETE FROM dbo.SubjectDetail WHERE questionID = ?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1, questionID);
            ps.executeUpdate();
        } catch (Exception e) {
       
        }            
    }
    
    public Term getTermByQuestionID(int questionID) {
        String query = "SELECT * from SubjectDetail where questionID = ?";
        Term t = new Term();
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1, questionID);
            rs = ps.executeQuery();
            while (rs.next()) {
                t.setQuestionID(rs.getInt(1));
                t.setSubjectID(rs.getInt(2));
                t.setTerm(rs.getString(3));
                t.setDefinition(rs.getString(4));
            }
        } catch (Exception e) {
        }
        return t;
    }
    public List<Term> getTermByPage(List<Term> listT, int start, int end) {
        List<Term> t = new ArrayList<>();
        for (int i = start; i < end; i++) {
            t.add(listT.get(i));
        }
        return t;
    }
    
    public static void main(String[] args) {
        TermDAO dao = new TermDAO();
        dao.editTerm(1, 3, "human", "con người");


    }
}
