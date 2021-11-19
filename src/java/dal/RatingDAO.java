/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dal;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Rating;

/**
 *
 * @author USER
 */
public class RatingDAO {

    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    public void AđdRating(String username, int subjectID, int rating) {

        String query = "insert into Rating(username, subjectID, rating) \n"
                + "values(?, ? ,?)";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, username);
            ps.setInt(2, subjectID);
            ps.setInt(3, rating);
            ps.executeUpdate();
        } catch (Exception e) {
            System.out.println("Error");
        }
    }

    public void UpdateRating(String username, int subjectID, int rating) {
        String query = "  UPDATE Rating SET rating = ?  WHERE username= ? and subjectID = ?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1, rating);
            ps.setString(2, username);
            ps.setInt(3, subjectID);
            ps.executeUpdate();
        } catch (Exception e) {
            
        }
    }
    
    public int GetLastRating(String username, int subjectID) {
        String query = "SELECT * from Rating WHERE username= ? AND subjectID = ?";
        int rate = 0;
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, username);
            ps.setInt(2, subjectID);
            rs = ps.executeQuery();
            while (rs.next()) {
                rate = rs.getInt(3);
            }
        } catch (Exception e) {
        }
        return rate;
    }
    
    public boolean IsRatedbyUser(String username, int subjectID){
        String query = "SELECT * from Rating WHERE username= ? AND subjectID = ?";
        Rating rate = new Rating();
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, username);
            ps.setInt(2, subjectID);
            rs = ps.executeQuery();
            while (rs.next()) {
                return true;
            }
        } catch (Exception ex) {
            Logger.getLogger(LoginSignupDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }
    
    public static void main(String[] args) {
        RatingDAO rt = new RatingDAO();
        System.out.println(rt.IsRatedbyUser("bao", 5));
        
    }
}
