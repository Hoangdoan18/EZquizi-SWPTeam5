/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

/**
 *
 * @author ADMIN
 */
public class Subscribe {

    private int subjectID, cateID;
    private String subjectTitle, date, username;
    private float rating;
    private String cateName;

    public Subscribe() {
    }

    public Subscribe(int subjectID, String subjectTitle, int cateID, String username, String cateName, float rating, String date) {
        this.subjectID = subjectID;
        this.cateID = cateID;
        this.subjectTitle = subjectTitle;
        this.date = date;
        this.username = username;
        this.rating = rating;
        this.cateName = cateName;
    }

    public int getSubjectID() {
        return subjectID;
    }

    public void setSubjectID(int subjectID) {
        this.subjectID = subjectID;
    }

    public int getCateID() {
        return cateID;
    }

    public void setCateID(int cateID) {
        this.cateID = cateID;
    }

    public String getSubjectTitle() {
        return subjectTitle;
    }

    public void setSubjectTitle(String subjectTitle) {
        this.subjectTitle = subjectTitle;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public float getRating() {
        return rating;
    }

    public void setRating(float rating) {
        this.rating = rating;
    }

    public String getCateName() {
        return cateName;
    }

    public void setCateName(String cateName) {
        this.cateName = cateName;
    }

    @Override
    public String toString() {
        return "Subscribe{" + "subjectID=" + subjectID + ", cateID=" + cateID + ", subjectTitle=" + subjectTitle + ", date=" + date + ", username=" + username + ", rating=" + rating + ", cateName=" + cateName + '}';
    }

    

}
