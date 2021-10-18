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
        String query = "insert into SubjectDetail (subjectID,term,definition) values (?,?,?)";
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

    public static void main(String[] args) {
        TermDAO dao = new TermDAO();
        List<Term> s = dao.getTermByID(3);
        System.out.println(s);

    }
}
