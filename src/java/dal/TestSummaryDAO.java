/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dal;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Question;
import model.Test;

/*
 *
 * @author USER
 */
public class TestSummaryDAO {

    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;
    
    public void AddTest(String username, int subjectID){
        String query = "insert into SubjectDetail ([username],[subjectID]) values (?,?,?)";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, username);
            ps.setInt(2, subjectID);
            ps.executeUpdate();
        } catch (Exception SQLException) {
        }
    }
    
    public void AddTestSummary(ArrayList<Test> list, int TestID){
        for (Test item : list) {
            String query = "INSERT INTO [dbo].[TestSummary] ([TestID],[questionID],[TestCheck],[TestResult]) \n"
                    + "VALUES (?,?,?,?)";
             try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1, item.getTestid());
            ps.setInt(2, item.getQuestionid());
            ps.setString(3, item.getMyanswer());
            ps.setBoolean(4, item.isStatus());
            ps.executeUpdate();
        } catch (Exception SQLException) {
        }
        }
    }
    
    public ArrayList<Test> getTestSummary(int TestID){
        String query = "select * from [TestSummary] \n"
                + "where [TestID] = ?";
        ArrayList<Test> list = new ArrayList<Test>();
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1, TestID);
            rs = ps.executeQuery();
            while (rs.next()) {
               list.add(new Test(rs.getInt(1),rs.getInt(2), rs.getString(3), rs.getBoolean(4)));
            }
        } catch (Exception e) {
        } finally {
            try {
                if (rs != null) {
                    rs.close();
                }
                if (ps != null) {
                    ps.close();
                }
                if (conn != null) {
                    conn.close();
                }
            } catch (SQLException ex) {
                Logger.getLogger(MultiplechoiceDAO.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return list;
    }
    
    public int getLastTestID(){
        String query = "select COUNT([TestID]) from [Test]";
        int count = 0;
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
               count=rs.getInt(1) + 1;
            }
        } catch (Exception e) {
        } finally {
            try {
                if (rs != null) {
                    rs.close();
                }
                if (ps != null) {
                    ps.close();
                }
                if (conn != null) {
                    conn.close();
                }
            } catch (SQLException ex) {
                Logger.getLogger(MultiplechoiceDAO.class.getName()).log(Level.SEVERE, null, ex);
            }
        }       
        return count;
    }
    
    public static void main(String[] args) {
        
    }
}
