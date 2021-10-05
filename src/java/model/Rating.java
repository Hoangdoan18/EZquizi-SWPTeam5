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
public class Rating {
    private String username;
    private int subjectID;
    private int rating;

    public Rating() {
    }

    public Rating(String username, int subjectID, int rating) {
        this.username = username;
        this.subjectID = subjectID;
        this.rating = rating;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public int getSubjectID() {
        return subjectID;
    }

    public void setSubjectID(int subjectID) {
        this.subjectID = subjectID;
    }

    public int getRating() {
        return rating;
    }

    public void setRating(int rating) {
        this.rating = rating;
    }

    @Override
    public String toString() {
        return "Rating{" + "username=" + username + ", subjectID=" + subjectID + ", rating=" + rating + '}';
    }
    
    
    
}
