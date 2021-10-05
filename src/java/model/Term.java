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
public class Term {
    private int questionID,subjectID;
    private String term, definition;

    public Term() {
    }

    public Term(int questionID, int subjectID, String term, String definition) {
        this.questionID = questionID;
        this.subjectID = subjectID;
        this.term = term;
        this.definition = definition;
    }

    public int getQuestionID() {
        return questionID;
    }

    public void setQuestionID(int questionID) {
        this.questionID = questionID;
    }

    public int getSubjectID() {
        return subjectID;
    }

    public void setSubjectID(int subjectID) {
        this.subjectID = subjectID;
    }

    public String getTerm() {
        return term;
    }

    public void setTerm(String term) {
        this.term = term;
    }

    public String getDefinition() {
        return definition;
    }

    public void setDefinition(String definition) {
        this.definition = definition;
    }

    @Override
    public String toString() {
        return "SubjectDetail{" + "questionID=" + questionID + ", subjectID=" + subjectID + ", term=" + term + ", definition=" + definition + '}';
    }
}
