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
import model.Users;

/**
 *
 * @author ADMIN
 */
public class UsersDAO {

    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    public List<Users> getUsersCRUD() {
        String query = "SELECT * from Users";
        List<Users> list = new ArrayList<>();
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Users(rs.getString(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getInt(5),
                        rs.getInt(6),
                        rs.getInt(7)));
            }
            return list;
        } catch (Exception e) {
        }
        return null;

    }
    
    public void changePass(String newpassword, String username){
        String query = "  UPDATE dbo.[Users] SET [password] = ?  WHERE [username]= ?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, newpassword);
            ps.setString(2, username);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }
//    public Users getAcc(String uname) {
//
//        for (Users a : getUsers()) {
//            if (a.getUsername().equals(uname)) {
//                return a;
//            }
//        }
//        return null;
//    }

    public List<Users> getUsersByPage(List<Users> list, int start, int end) {
        List<Users> t = new ArrayList<>();
        for (int i = start; i < end; i++) {
            t.add(list.get(i));
        }
        return t;
    }

    public void addUser(String username, String password, String email, String name, int age, int phone) {
        String query = "insert into Users\n"
                + "values(?,?,?,?,?,?,0)";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, username);
            ps.setString(2, password);
            ps.setString(3, email);
            ps.setString(4, name);
            ps.setInt(5, age);
            ps.setInt(6, phone);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    public void edit(String newusername, String newpassword, String newemail, String newname, int newage, int newphone, String username) {
        String query = "UPDATE Users \n"
                + "SET [username] = ?,\n"
                + "[password] = ?,\n"
                + "email = ?,\n"
                + "name = ?,\n"
                + "age = ?, \n"
                + "phone = ?, \n"
                + "admin = 0 \n"
                + "WHERE username =?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, newusername);
            ps.setString(2, newpassword);
            ps.setString(3, newemail);
            ps.setString(4, newname);
            ps.setInt(5, newage);
            ps.setInt(6, newphone);
            ps.setString(7, username);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    public Users getUsername(String username) {
        String query = "SELECT * FROM dbo.Users WHERE username = ?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, username);
            rs = ps.executeQuery();
            while (rs.next()) {
                return new Users(rs.getString(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getInt(5),
                        rs.getInt(6),
                        rs.getInt(7));
            }
        } catch (Exception e) {
        }
        return null;
    }

    public void delete(String username) {
        String query = "DELETE FROM dbo.Users WHERE username = ?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, username);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }
    

//    public static void main(String[] args) {
//        UsersDAO dao = new UsersDAO();
//        dao.getAcc("admin");
//        dao.update("bao1","123","bao@gmail.com","bao",21,123456789,"bao");
//
//        dao.addUser("username","123", "email", "name", 1, 123);
//        dao.addUser("1","123", "email", "name", 1, 123);
//        dao.edit("quangdx", "quang", "quangdx@gmail.com", "Đỗ Xuân Quang", 20, 1234567890, "1");
//       dao.delete("username");
//        List<Users> listA = dao.getUsers();
//        for (Users o : listA) {
//            System.out.println(o);
//       }
//    }
}

