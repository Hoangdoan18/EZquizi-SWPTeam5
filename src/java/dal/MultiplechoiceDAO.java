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
import java.util.Collections;
import java.util.HashMap;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Question;

/**
 *
 * @author USER
 */
public class MultiplechoiceDAO {

    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;
    HashMap<String, String> a;

    public boolean isAdded(int subjectID, String username) {
        boolean added = true;
        String query = "SELECT COUNT(questionID) FROM [SWP391].[dbo].[MultipleChoice] WHERE subjectID = ? AND [username] = ?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1, subjectID);
            ps.setString(2, username);
            rs = ps.executeQuery();
            while (rs.next()) {                
                if(rs.getInt(1) == 0) added = false;
            }
        } catch (Exception e) {
            
        }
        return added;
    }

    public void AddMultipleChoiceLearn(ArrayList<Question> list, String username) {
        for (Question item : list) {
            String query = "INSERT INTO [dbo].[MultipleChoice] ([username],[questionID],[subjectID],[Learned]) \n"
                    + "VALUES (?,?,?,?)";
            try {

                conn = new DBContext().getConnection();
                ps = conn.prepareStatement(query);
                ps.setString(1, username);
                ps.setInt(2, item.getQuestionID());
                ps.setInt(3, item.getSubjectID());
                ps.setBoolean(4, false);
                ps.executeUpdate();
            } catch (Exception e) {
            }
        }
    }


    public void updateLearned(String username, int questionID, boolean Learned) {
        String query = "UPDATE dbo.[MultipleChoice] SET [Learned] = ?  WHERE [username]= ? and [questionID] = ?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
           
            ps.setBoolean(1, Learned);
            ps.setString(2, username);
            ps.setInt(3, questionID);
            ps.executeUpdate();
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
    }
    
     public void updateLearnedAll(ArrayList<Question> list, String username){
         for (Question item : list) {
            String query = "UPDATE dbo.[MultipleChoice] SET [Learned] = 0  WHERE [username]= ? and [questionID] = ?";
            try {
                conn = new DBContext().getConnection();
                ps = conn.prepareStatement(query);
                ps.setString(1, username);
                ps.setInt(2, item.getQuestionID());
                ps.executeUpdate();
            } catch (Exception e) {
            }
        }
     }

    public ArrayList<String> GetListAnswer(int SubjectId, int questionID) {
        String query = "select top 3 [term] from [SubjectDetail] "
                + "where [subjectID] = ? and NOT [questionID] = ? order by NEWID()";
        ArrayList<String> answer = new ArrayList<String>();
        try {

            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1, SubjectId);
            ps.setInt(2, questionID);
            rs = ps.executeQuery();
            while (rs.next()) {
                answer.add(rs.getString(1));
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
        return answer;
    }

    public ArrayList<Question> GetAddListQuestion(int SubjectId) {

        String query = "select [questionID],[definition],[term] from [SubjectDetail] \n"
                + "where [subjectID] = ?";
        ArrayList<Question> ques = new ArrayList<Question>();
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1, SubjectId);
            rs = ps.executeQuery();
            while (rs.next()) {
                ques.add(new Question(SubjectId, rs.getInt(1), rs.getString(2),new ArrayList<String>(), rs.getString(3),false));
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
        return ques;
    }
    
    public Question getQuestion(int subjectID, String username){
        String query = "select top 1 m.[questionID],[term],[definition] from [MultipleChoice] m inner join [SubjectDetail] s \n" +
                        "on m.questionID = s.questionID where m.[subjectID] = ? and m.[username] = ? and m.[Learned] = 0 "
                        + "order by NEWID()";
        Question ques = new Question();
        MultiplechoiceDAO md = new MultiplechoiceDAO();
        try{
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1, subjectID);
            ps.setString(2, username);
            rs = ps.executeQuery();
            while (rs.next()) {
                ArrayList<String> list = md.GetListAnswer(subjectID, rs.getInt(1));
                list.add(rs.getString(2));
                Collections.shuffle(list);
                ques = new Question(subjectID, rs.getInt(1), rs.getString(3), list , rs.getString(2),false);
            }
        }catch(Exception e){
            
        }
        return ques;
    }

    public int GetCountQuestionNotLearned(int SubjectId, String username) {

        String query = "select COUNT([questionID]) from [MultipleChoice] \n"
                + "where [subjectID] = ? and [Learned] = 0 and [username] = ?";
        int number = 0;
        try {

            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1, SubjectId);
            ps.setString(2, username);
            rs = ps.executeQuery();
            while (rs.next()) {
                number = rs.getInt(1);
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
        return number;
    }
    
    public int GetCountQuestionbySubject(int SubjectId, String username) {

        String query = "select COUNT([questionID]) from [MultipleChoice] \n"
                + "where [subjectID] = ? and [username] = ?";
        int number = 0;
        try {

            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1, SubjectId);
            ps.setString(2, username);
            rs = ps.executeQuery();
            while (rs.next()) {
                number = rs.getInt(1);
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
        return number;
    }

    public static void main(String[] args) {
        MultiplechoiceDAO md = new MultiplechoiceDAO();
        md.updateLearnedAll(md.GetAddListQuestion(3), "bao");
    }
}
