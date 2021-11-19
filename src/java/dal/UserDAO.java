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
import java.util.List;
import model.User;

/**
 *
 * @author ADMIN
 */
public class UserDAO {

    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    public List<User> getUsersCRUD() {
        String query = "SELECT * FROM users";
        List<User> list = new ArrayList<>();
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new User(rs.getString(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getInt(5),
                        rs.getString(6),
                        rs.getInt(7),
                        rs.getInt(8)));
            }
            return list;
        } catch (Exception e) {
        }
        return null;

    }
    
    public void changePass(String newpassword, String username){
        String query = "UPDATE Users SET password = ?  WHERE username = ?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, newpassword);
            ps.setString(2, username);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }
    
    public void activeUser(String username){
        String query = "UPDATE users SET active = 1 WHERE (username = ?)";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, username);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }
    
    public void inactiveUser(String username){
        String query = "UPDATE users SET active = 0 WHERE (username = ?)";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, username);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }
//    public User getAcc(String uname) {
//
//        for (User a : getUsers()) {
//            if (a.getUsername().equals(uname)) {
//                return a;
//            }
//        }
//        return null;
//    }

    public List<User> getUsersByPage(List<User> list, int start, int end) {
        List<User> t = new ArrayList<>();
        for (int i = start; i < end; i++) {
            t.add(list.get(i));
        }
        return t;
    }

    public void addUser(String username, String password, String email, String name, int age, String phone) {
        String query = "insert into users(username, password, email, name, age, phone, active, admin) "
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

    public void edit(String newusername, String newpassword, String newemail, String newname, int newage, String newphone, int newrole, String username) {
        String query = "UPDATE Users SET username = ?,\n"
                + "password = ?,\n"
                + "email = ?,\n"
                + "name = ?,\n"
                + "age = ?, \n"
                + "phone = ?, \n"
                + "active = 1, \n"
                + "admin = ? \n"
                + "WHERE username = ?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, newusername);
            ps.setString(2, newpassword);
            ps.setString(3, newemail);
            ps.setString(4, newname);
            ps.setInt(5, newage);
            ps.setString(6, newphone);
            ps.setInt(7, newrole);
            ps.setString(8, username);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    public User getUsername(String username) {
        String query = "SELECT * FROM users WHERE username = ?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, username);
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

    public void delete(String username) {
        String query = "DELETE FROM Users WHERE username = ?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, username);
            ps.executeUpdate();
        } catch (Exception e) {
       
        }            
    }
    public void updatePass(User acc){
        String query = "UPDATE Users SET username = ?,\n"
                + "password = ?,\n"
                + "email = ?,\n"
                + "name = ?,\n"
                + "age = ?, \n"
                + "phone = ?, \n"
                + "active = 1, \n"
                + "admin = 0 \n"
                + "WHERE username = ?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, acc.getUsername());
            ps.setString(2, acc.getPassword());
            ps.setString(3, acc.getEmail());
            ps.setString(4, acc.getName());
            ps.setInt(5, acc.getAge());
            ps.setString(6, acc.getPhone());
            ps.setString(7, acc.getUsername());
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }
    
    public User getUsernamebyPass(String username, String pass) {
        String query = "SELECT * FROM Users WHERE username = ? and password = ?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, username);
            ps.setString(2, pass);
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
//    public static void main(String[] args) {
//        UserDAO dao = new UserDAO();
//        dao.getAcc("admin");
//        dao.update("bao1","123","bao@gmail.com","bao",21,123456789,"bao");
//
//        dao.addUser("username","123", "email", "name", 1, 123);
//        dao.addUser("1","123", "email", "name", 1, 123);
//        dao.edit("quangdx", "quang", "quangdx@gmail.com", "Đỗ Xuân Quang", 20, 1234567890, "1");
//       dao.delete("username");
//        List<Users> listA = dao.getUsers();
//        for (User o : listA) {
//            System.out.println(o);
//       }
//    }
}

