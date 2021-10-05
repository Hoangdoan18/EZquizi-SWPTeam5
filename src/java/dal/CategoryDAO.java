/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dal;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import model.Category;

/**
 *
 * @author ADMIN
 */
public class CategoryDAO {

    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    public Category getCateName(int cateID) {
        String query = "SELECT * FROM Category\n"
                + "WHERE cateID=?";
        Category nc = new Category();
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1, cateID);
            rs = ps.executeQuery();
            while (rs.next()) {
                nc.setCateID(rs.getInt(1));
                nc.setCateName(rs.getString(2));
            }
        } catch (Exception e) {
        }
        return nc;
    }
}
