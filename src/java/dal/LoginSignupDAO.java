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
import java.util.logging.Level;
import java.util.logging.Logger;
import model.User;

/**
 *
 * @author Admin
 */
public class LoginSignupDAO {

    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    public User login(String username, String password) {
        String query = "select * from users where username= ? and password = ? and active=1";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, username);
            ps.setString(2, password);
            rs = ps.executeQuery();
            while (rs.next()) {
                return new User(rs.getString(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getInt(5),
                        rs.getString(6),
                        rs.getInt(7),
                        rs.getInt(8));
            }
        } catch (Exception e) {
        }
        return null;
    }

    public boolean check(String username) {
        String query = "SELECT * from users WHERE username=?";
            try {
                conn = new DBContext().getConnection();
                ps = conn.prepareStatement(query);
                ps.setString(1, username);
                rs = ps.executeQuery();
                while(rs.next())
                {
                    return true;        
                }
            } catch (Exception ex) {
                Logger.getLogger(LoginSignupDAO.class.getName()).log(Level.SEVERE, null, ex);
            }
            return false;
//        User user=null;
//            try {
//                conn = new DBContext().getConnection();
//                ps = conn.prepareStatement("SELECT * from dbo.[User] WHERE [username]=?");
//                ps.setString(1, username);
//                rs = ps.executeQuery();
//                while(rs.next())
//                {
//                    return true;        
//                }
//            } catch (SQLException ex) {
//                Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
//            } finally{
//                DBConnection.close(conn, ps,rs);
//            }
//        return false;
    }
    
    public void addUser(String username, String password, String email, String name, int age, String phone) {
        String query = "insert into users(username, password, email, name, age, phone, active, admin)"
                + "values(?,?,?,?,?,?,1,0)";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, username);
            ps.setString(2, password);
            ps.setString(3, email);
            ps.setString(4, name);
            ps.setInt(5, age);
            ps.setString(6, phone);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }
    
     public static void main(String[] args) {
        UserDAO dao = new UserDAO();

  //      dao.addUser("username","123", "email", "name", 1, 123);
 //       dao.addUser("1","123", "email", "name", 1, 123);
  //      dao.edit("quangdx", "quang", "quangdx@gmail.com", "Đỗ Xuân Quang", 20, 1234567890, "1");
     dao.delete("username");
 //       List<Users> listA = dao.getUsersCRUD();
 //       for (User o : listA) {
  //          System.out.println(o);
 //       }
    }
}
