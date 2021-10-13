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
import model.Category;
import model.Subject;

/**
 *
 * @author Admin
 */
public class SubjectDAO {

    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    public List<Subject> getSubjectCRUD() {
        String query = "SELECT * from Subject";
        List<Subject> list = new ArrayList<>();
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Subject(rs.getInt(1), rs.getString(2),
                        rs.getInt(3),
                        rs.getString(4),
                        rs.getString(5)));
            }
            return list;
        } catch (Exception e) {
        }
        return null;

    }

    public List<Subject> getSubjectByDate(String username) {
        String query1 = "select * from Subject where username = ? order by date desc ";
        String query2 = "select * from Subject order by date desc ";
        List<Subject> list = new ArrayList<>();
        if (username == null || username.trim().length() == 0) {
            try {
                conn = new DBContext().getConnection();
                ps = conn.prepareStatement(query2);
                rs = ps.executeQuery();
                while (rs.next()) {
                    list.add(new Subject(rs.getInt(1), rs.getString(2),
                            rs.getInt(3),
                            rs.getString(4),
                            rs.getString(5)));
                }
                return list;
            } catch (Exception e) {
            }
        } else {
            try {
                conn = new DBContext().getConnection();
                ps = conn.prepareStatement(query1);
                ps.setString(1, username);
                rs = ps.executeQuery();
                while (rs.next()) {
                    list.add(new Subject(rs.getInt(1), rs.getString(2),
                            rs.getInt(3),
                            rs.getString(4),
                            rs.getString(5)));
                }
                return list;
            } catch (Exception e) {
            }
        }
        return null;

    }

    public static void main(String[] args) {
        SubjectDAO sdao = new SubjectDAO();
        List<Subject> list = sdao.getSubjectByDate("");
        for (Subject o : list) {
            System.out.println(o);
        }
    }

    public List<Subject> getSubjectByUsername(String username) {
        String query = "SELECT * from Subject where username= ? ";
        List<Subject> list = new ArrayList<>();
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, username);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Subject(rs.getInt(1), rs.getString(2),
                        rs.getInt(3),
                        rs.getString(4),
                        rs.getString(5)));
            }
            return list;
        } catch (Exception e) {
        }
        return null;

    }

    public List<Subject> getSubjectByCategory(String cid, String username) {
        String query1 = "SELECT * from Subject where cateID = ? and username = ?";
        String query2 = "SELECT * from Subject where cateID = ?";
        List<Subject> list = new ArrayList<>();
        if (username == null || username.trim().length() == 0) {
            try {
                conn = new DBContext().getConnection();
                ps = conn.prepareStatement(query2);
                ps.setString(1, cid);
                rs = ps.executeQuery();
                while (rs.next()) {
                    list.add(new Subject(rs.getInt(1), rs.getString(2),
                            rs.getInt(3),
                            rs.getString(4),
                            rs.getString(5)));
                }
                return list;
            } catch (Exception e) {
            }
        } else {
            try {
                conn = new DBContext().getConnection();
                ps = conn.prepareStatement(query1);
                ps.setString(1, cid);
                ps.setString(2, username);
                rs = ps.executeQuery();
                while (rs.next()) {
                    list.add(new Subject(rs.getInt(1), rs.getString(2),
                            rs.getInt(3),
                            rs.getString(4),
                            rs.getString(5)));
                }
                return list;
            } catch (Exception e) {
            }
        }
        return null;

    }
//    public List<Subject> getSubjectByCategory(String cid, String username) {
//        String query1 = "SELECT * from Subject where cateID = ? and username = ?";
//        String query2 = "SELECT * from Subject where cateID = ?";
//        List<Subject> list = new ArrayList<>();
//        try {
//            conn = new DBContext().getConnection();
//             if(username == null || username.trim().length()==0){
//                ps = conn.prepareStatement(query2);
//                username = "linhtinh";
//            }else{
//                ps = conn.prepareStatement(query1);
//             }
//            
//            ps.setString(1, cid);
//            ps.setString(2, username);
//            
//            rs = ps.executeQuery();
//            while (rs.next()) {
//                list.add(new Subject(rs.getInt(1),rs.getString(2),
//                        rs.getInt(3),
//                        rs.getString(4),
//                        rs.getString(5)));
//            }
//            return list;
//        } catch (Exception e) {
//        }
//        return null;
//
//    }
//    public static void main(String[] args) {
//        SubjectDAO sdao = new SubjectDAO();
//        List<Subject> list = sdao.getSubjectByCategory("1", null);
//            for (Subject o : list) {
//                System.out.println(o);
//        
//    }
//    }

    public List<Subject> searchSubject(String searchValue) {
        String query = "   select * from Subject\n"
                + "  where subjectTitle like ? or username like ? ";
        List<Subject> list = new ArrayList<>();
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, "%" + searchValue + "%");
            ps.setString(2, "%" + searchValue + "%");
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Subject(rs.getInt(1), rs.getString(2),
                        rs.getInt(3),
                        rs.getString(4),
                        rs.getString(5)));
            }
            return list;
        } catch (Exception e) {
        }
        return null;

    }
//    public static void main(String[] args) {
//        SubjectDAO pdao = new SubjectDAO();
//        List<Subject> list = pdao.getSubjectByUsername("bao");
//        for (Subject o : list) {
//            System.out.println(o);
//        }
//    }

    public List<Category> getCategory() {
        String query = "SELECT * from Category";
        List<Category> list = new ArrayList<>();
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Category(rs.getInt(1),
                        rs.getString(2)));
            }
            return list;
        } catch (Exception e) {
        }
        return null;

    }

    public List<Subject> getSubjectByPage(List<Subject> list, int start, int end) {
        List<Subject> t = new ArrayList<>();
        for (int i = start; i < end; i++) {
            t.add(list.get(i));
        }
        return t;
    }

    public void addSubject(String subjectTitle, int cateID, String username) {
        String query = "insert into Subject(subjectTitle,cateID,username,[date]) values"
                + "(N?,?,?,CAST( GETDATE() AS Date ))";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, subjectTitle);
            ps.setInt(2, cateID);
            ps.setString(3, username);
            ps.executeUpdate();
        } catch (Exception SQLException) {
        }
    }

//    public void edit(String NewProjectName, String NewAuthor, String NewDate, int NewSubscribe, String ProjectName) {
//        String query = "Update Projects set "
//                + "ProjectName = N?, "
//                + "Author = ?, "
//                + "[date] = ?, "
//                + "Subscribe = ? \n" +
//                "where ProjectName =?";
//        try {
//            conn = new DBContext().getConnection();
//            ps = conn.prepareStatement(query);
//            ps.setString(1, NewProjectName);
//            ps.setString(2, NewAuthor);
//            ps.setString(3, NewDate);
//            ps.setInt(4, NewSubscribe);
//            ps.setString(5, ProjectName);
//            ps.executeUpdate();
//        } catch (Exception e) {
//        }
//    }
//
//    public Subject getProjectName(String ProjectName) {
//        String query = "SELECT * FROM dbo.Projects WHERE ProjectName = N?";
//        try {
//            conn = new DBContext().getConnection();
//            ps = conn.prepareStatement(query);
//            ps.setString(1, ProjectName);
//            rs = ps.executeQuery();
//            while (rs.next()) {
//                return new Subject(rs.getString(2),
//                        rs.getString(3),
//                        rs.getString(4),
//                        rs.getInt(5));
//            }
//        } catch (Exception e) {
//        }
//        return null;
//    }
//
//    public void delete(String ProjectName) {
//        String query = "DELETE FROM dbo.Projects WHERE ProjectName = N?";
//        try {
//            conn = new DBContext().getConnection();
//            ps = conn.prepareStatement(query);
//            ps.setString(1, ProjectName);
//            ps.executeUpdate();
//        } catch (Exception e) {
//        }
//    }
    public Subject getSubjectByID(int subjectID) {
        String query = "SELECT * from Subject where subjectID = ?";
        Subject s = new Subject();
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1, subjectID);
            rs = ps.executeQuery();
            while (rs.next()) {
                s.setSubjectID(rs.getInt(1));
                s.setSubjectTitle(rs.getString(2));
                s.setCateID(rs.getInt(3));
                s.setUsername(rs.getString(4));
                s.setDate(rs.getString(5));
            }
        } catch (Exception e) {
        }
        return s;

    }

    public List<Subject> getSubjectByCategory(String cid) {
        String query = "SELECT * from Subject where cateID = ? ";
        List<Subject> list = new ArrayList<>();
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, cid);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Subject(rs.getInt(1), rs.getString(2),
                        rs.getInt(3),
                        rs.getString(4),
                        rs.getString(5)));
            }
            return list;
        } catch (Exception e) {
        }
        return null;

    }

    public Subject getNumOfTerm(int subjectID) {
        String query = "SELECT COUNT(Term) AS numOfTerm FROM Subjectdetail\n"
                + "WHERE subjectID=?;";
        Subject n = new Subject();
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1, subjectID);
            rs = ps.executeQuery();
            while (rs.next()) {
                n.setNumOfTerm(rs.getInt(1));
            }
        } catch (Exception e) {
        }
        return n;
    }

    public Subject getRating(int subjectID) {
        String query = "SELECT cast(AVG(rating) as decimal(2,1))\n"
                + "FROM Rating\n"
                + "WHERE SubjectID = ?";
        Subject r = new Subject();
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1, subjectID);
            rs = ps.executeQuery();
            while (rs.next()) {
                r.setRating(rs.getFloat(1));
            }
        } catch (Exception e) {
        }
        return r;
    }
}
