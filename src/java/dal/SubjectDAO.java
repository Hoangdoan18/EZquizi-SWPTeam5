/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dal;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Category;
import model.Subject;
import model.Subscribe;

/**
 *
 * @author Admin
 */
public class SubjectDAO {

    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    public List<Subject> listQuery(int category, String username, String search, int sort) {
        List<Subject> subjects = new ArrayList<>();
        try {
            int count = 1;
            conn = new DBContext().getConnection();
            String Statement = "select \n"
                    + "	s.subjectID,\n"
                    + "	s.subjectTitle, \n"
                    + "	s.username,\n"
                    + "	s.cateID,\n"
                    + "	s.[date],\n"
                    + "	c.cateName,\n"
                    + "	cast(sum(r.rating)/count(r.rating) as decimal(10,2)) as rating\n"
                    + "from Subject s\n"
                    + "inner join \n"
                    + "Category c on s.cateID = c.cateID\n"
                    + "left join Rating r\n"
                    + "on s.subjectID = r.subjectID\n"
                    + "where 1=1 ";
            switch (category) {
                case 0:
                    break;
                default:
                    Statement += " AND s.cateID = ? ";
                    break;
            }

            if (username.length() > 0) {
                Statement += " AND s.username = ? ";
            }
            if (search.length() > 0) {
                Statement += " AND s.subjectTitle like ? or s.username like ?";
            }
            Statement += " group by\n"
                    + "	s.subjectID,\n"
                    + "	s.subjectTitle, \n"
                    + "	s.username,\n"
                    + "	s.cateID,\n"
                    + "	s.[date],\n"
                    + "	c.cateName";
            switch (sort) {
                case 1:
                    Statement += " order by s.date desc ";
                    break;
                case 2:
                    Statement += " order by rating desc ";
                    break;
                default:
                    break;
            }

            ps = conn.prepareStatement(Statement);
            switch (category) {
                case 0:
                    break;
                default:
                    ps.setInt(count++, category);
                    break;
            }
            if (username.length() > 0) {
                ps.setString(count++, username);
            }
            if (search.length() > 0) {
                ps.setString(count++, "%" + search + "%");
                ps.setString(count++, "%" + search + "%");

            }
            rs = ps.executeQuery();
            while (rs.next()) {
                Subject s = new Subject();
                s.setSubjectID(rs.getInt("subjectID"));
                s.setSubjectTitle(rs.getString("subjectTitle"));
                s.setUsername(rs.getString("username"));
                s.setCateID(rs.getInt("cateID"));
                s.setCateName(rs.getString("cateName"));
                s.setRating(rs.getDouble("rating"));

                String date1 = rs.getString("date");
                DateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
                Date date = (Date) formatter.parse(date1);
                SimpleDateFormat newFormat = new SimpleDateFormat("dd-MMM-yyyy");
                String finaldate = newFormat.format(date);

                s.setDate(finaldate);

                subjects.add(s);
            }
        } catch (Exception ex) {

        }
        return subjects;
    }

    public List<Subject> listDoing(int category, String username, int Subscribe, int Doing, int sort) {
        List<Subject> subjects = new ArrayList<>();
        try {
            int count = 1;
            conn = new DBContext().getConnection();
            String Statement = "select \n"
                    + "	s.subjectID,\n"
                    + "	s.subjectTitle, \n"
                    + "	s.username,\n"
                    + "	s.cateID,\n"
                    + "	s.[date],\n"
                    + "	c.cateName,\n"
                    + "	cast(sum(r.rating)/count(r.rating) as decimal(10,2)) as rating\n"
                    + "from Subject s\n"
                    + "inner join \n"
                    + "Category c on s.cateID = c.cateID\n"
                    + "left join Rating r\n"
                    + "on s.subjectID = r.subjectID ";
            switch (Subscribe) {
                case 1:
                    Statement += " right join Subscribe sub\n"
                            + "on s.subjectID = sub.subjectID ";
                    break;
                case 2:
                    Statement += " left join Subscribe sub\n "
                            + " on s.subjectID = sub.subjectID ";
                    break;
                default:
                    break;
            }

            switch (Doing) {
                case 1:
                    Statement += " right join Progress p\n"
                            + " on s.subjectID = p.subjectID ";
                    break;
                case 2:
                    Statement += " left join Progress p\n"
                            + " on s.subjectID = p.subjectID ";
                    break;
                default:
                    break;
            }

            Statement += " where 1=1 ";

            switch (category) {
                case 0:
                    break;
                default:
                    Statement += " AND s.cateID = ? ";
                    break;
            }

            switch (Subscribe) {

                case 1:
                    Statement += " and sub.username = ? ";
                    break;
                case 2:
                    Statement += " and sub.username != ? or sub.username is null ";
                    break;
                default:
                    break;

            }
            switch (Doing) {
                case 1:
                    Statement += " and p.username = ? ";
                    break;
                case 2:
                    Statement += " and p.username != ? or p.username is null ";
                    break;
                default:
                    break;
            }

            Statement += " group by\n"
                    + "	s.subjectID,\n"
                    + "	s.subjectTitle, \n"
                    + "	s.username,\n"
                    + "	s.cateID,\n"
                    + "	s.[date],\n"
                    + "	c.cateName";
            switch (sort) {
                case 1:
                    Statement += " order by s.date desc ";
                    break;
                case 2:
                    Statement += " order by rating desc ";
                    break;
                default:
                    break;
            }

            ps = conn.prepareStatement(Statement);

            switch (category) {
                case 0:
                    break;
                default:
                    ps.setInt(count++, category);
                    break;
            }

            switch (Subscribe) {
                case 1:
                    ps.setString(count++, username);
                    break;
                case 2:
                    ps.setString(count++, username);
                    break;

                default:
                    break;
            }
            switch (Doing) {
                case 1:
                    ps.setString(count++, username);
                    break;
                case 2:
                    ps.setString(count++, username);
                    break;
                default:
                    break;
            }

            rs = ps.executeQuery();
            while (rs.next()) {
                Subject s = new Subject();
                s.setSubjectID(rs.getInt("subjectID"));
                s.setSubjectTitle(rs.getString("subjectTitle"));
                s.setUsername(rs.getString("username"));
                s.setCateID(rs.getInt("cateID"));
                s.setCateName(rs.getString("cateName"));
                s.setRating(rs.getDouble("rating"));

                String date1 = rs.getString("date");
                DateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
                Date date = (Date) formatter.parse(date1);
                SimpleDateFormat newFormat = new SimpleDateFormat("dd-MMM-yyyy");
                String finaldate = newFormat.format(date);

                s.setDate(finaldate);

                subjects.add(s);
            }
        } catch (Exception ex) {

        }
        return subjects;
    }

    public static void main(String[] args) {
        SubjectDAO sdao = new SubjectDAO();

        List<Subject> list = sdao.listQuery(0, "", "", 1);

        for (Subject o : list) {
            System.out.println(o);
        }

    }

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
                + "(?,?,?,CAST( GETDATE() AS Date ))";
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
    
    public void editSubject(int subjectID, String subjectTitle, int cateID, String username) {
         String query = "UPDATE Subject \n"
                + "SET [subjectTitle] = ?,\n"
                + "[cateID] = ?,\n"
                + "username = ?,\n"
                + "[date] = CAST( GETDATE() AS Date) \n"
                + "WHERE subjectID =?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, subjectTitle);
            ps.setInt(2, cateID);
            ps.setString(3, username);
            ps.setInt(4, subjectID);
            ps.executeUpdate();
        } catch (Exception SQLException) {
        }
    }
    
    public void deleteSubject(int subjectID) {
        String query = "DELETE FROM dbo.Subject WHERE subjectID = ?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1, subjectID);
            ps.executeUpdate();
        } catch (Exception e) {
       
        }            
    }
    
        public void deleSubject2(String sid) {
        String query = "delete from [Subject] where subjectID = ?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, sid);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

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
                String date1 = rs.getString(5);
                DateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
                Date date = (Date) formatter.parse(date1);
                SimpleDateFormat newFormat = new SimpleDateFormat("dd-MMM-yyyy");
                String finaldate = newFormat.format(date);
                s.setDate(finaldate);
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
        String query = "SELECT cast(AVG(rating) as decimal(10,2)) FROM Rating WHERE SubjectID =? group by subjectID";
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

    public void getSubscribe(String username, String sid) {
        String query = "insert into [Subscribe]\n"
                + "values(?,?)";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, username);
            ps.setString(2, sid);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    public void unSubscribe(String username, String sid) {
        String query = "delete from [Subscribe]\n"
                + "where Username =? and SubjectID=?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, username);
            ps.setString(2, sid);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    public Subject getLastSubject() {
        String query = "SELECT top 1 * from Subject order by subjectID desc";
        Subject s = new Subject();
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
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
    
    public List<Subscribe> getSubscribeByPage(List<Subscribe> list, int start, int end) {
        List<Subscribe> s = new ArrayList<>();
        for (int i = start; i < end; i++) {
            s.add(list.get(i));
        }
        return s;
    }


    public List<Subscribe> getSubscribeSubject(String username) {
        String query = "Select s.subjectID, s.subjectTitle, s.cateID, s.username, c.cateName, r.rating, [date] from Subject s \n"
                + "INNER JOIN Category c on s.cateID = c.cateID LEFT JOIN Rating r on s.subjectID = r.subjectID LEFT JOIN [Subscribe] f ON f.subjectID = s.subjectID\n"
                + "WHERE f.username = ?";

        List<Subscribe> list = new ArrayList<>();
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, username);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Subscribe(rs.getInt(1), rs.getString(2), rs.getInt(3), rs.getString(4), rs.getString(5), rs.getFloat(6), rs.getString(7)));
            }
            return list;
        } catch (Exception e) {
        }
        return null;
    }
}
