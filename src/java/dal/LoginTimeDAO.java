/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dal;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import model.User;

/**
 *
 * @author USER
 */
public class LoginTimeDAO {

    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;
    //Count number of Login time of USER by Month and Year
    public int CountAllUserLoginbyMonthInYear(int month, int year) {
        int a = 0;
        String check = year + "-" + month;
        String query = "SELECT COUNT(LoginID)\n"
                + "  FROM [SWP391].[dbo].[LoginTime] l inner join [Users] u \n"
                + "on l.[username] = u.[username]\n"
                + "  Where u.admin = 0"
                + "  and [Date] like '%" + check + "%'";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                a = rs.getInt(1);
            }
        } catch (Exception e) {
        }
        return a;
    }

    public int CountAllUserLoginbyYear(int year) {
        int a = 0;
        String check = "" + year;
        String query = "SELECT COUNT(LoginID)\n"
                + "  FROM [SWP391].[dbo].[LoginTime] l inner join "
                + "[Users] u on l.[username] = u.[username]\n"
                + "  Where u.admin = 0"
                + "  and [Date] like '%" + check + "%'";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                a = rs.getInt(1);
            }
        } catch (Exception e) {
        }
        return a;
    }

    public int CountUserLoginbyMonthofYear(String username, int year, int month) {
        int a = 0;
        String check = year + "-" + month;
        String query = "SELECT COUNT(LoginID)\n"
                + " FROM [SWP391].[dbo].[LoginTime]"
                + " where [Date] like '%" + check + "%'"
                + " and [username] = ?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, username);
            rs = ps.executeQuery();
            while (rs.next()) {
                a = rs.getInt(1);
            }
        } catch (Exception e) {
        }
        return a;
    }

    public boolean AddLoginTime(String username) {
        String query = "INSERT INTO [LoginTime](username, [Date]) "
                + "VALUES(?,CAST(GETDATE() AS date))";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, username);
            ps.executeUpdate();
            return true;
        } catch (Exception e) {
            return false;
        }
    }

    public int CountUserLoginbyDate(String username, int date, int month, int year) {
        int a = 0;
        String check = year + "-" + month + "-" + date;
        String query = "SELECT COUNT(LoginID)\n"
                + "  FROM [SWP391].[dbo].[LoginTime]\n"
                + "  WHERE [Date] like '%" + check + "%'"
                + "and [username] = ?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, username);
            rs = ps.executeQuery();
            while (rs.next()) {
                a = rs.getInt(1);
            }
        } catch (Exception e) {
        }
        return a;
    }

    public static void main(String[] args) {
        LoginTimeDAO ltDAO = new LoginTimeDAO();
        System.out.println(ltDAO.CountUserLoginbyDate("hoang", 26, 10, 2021));
        System.out.println(ltDAO.CountUserLoginbyMonthofYear("hoang", 2021, 10));
        System.out.println(ltDAO.CountAllUserLoginbyMonthInYear(10, 2021));
    }
}
