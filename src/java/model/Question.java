/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author USER
 */
public class Question {
    private int subjectID;
    private int questionID;
    private String Question;
    private ArrayList<String> listanswer;
    private String answer;
    private boolean rightanswer;
    
    public Question() {
    }

    public Question(String Question, String answer) {
        this.Question = Question;
        this.answer = answer;
        rightanswer = false;
        ArrayList<String> listanswer = new ArrayList<>();
    }

    public Question(int subjectID, int questionID, String Question, ArrayList<String> listanswer, String answer, boolean rightanswer) {
        this.subjectID = subjectID;
        this.questionID = questionID;
        this.Question = Question;
        this.listanswer = listanswer;
        this.answer = answer;
        this.rightanswer = rightanswer;
    }

    public int getSubjectID() {
        return subjectID;
    }

    public void setSubjectID(int subjectID) {
        this.subjectID = subjectID;
    }

    public int getQuestionID() {
        return questionID;
    }

    public void setQuestionID(int questionID) {
        this.questionID = questionID;
    }

    public String getQuestion() {
        return Question;
    }

    public void setQuestion(String Question) {
        this.Question = Question;
    }

    public ArrayList<String> getListanswer() {
        return listanswer;
    }

    public void setListanswer(ArrayList<String> listanswer) {
        this.listanswer = listanswer;
    }

    public String getAnswer() {
        return answer;
    }

    public void setAnswer(String answer) {
        this.answer = answer;
    }

    public boolean isRightanswer() {
        return rightanswer;
    }

    public void setRightanswer(boolean rightanswer) {
        this.rightanswer = rightanswer;
    }

    @Override
    public String toString() {
        int i = 1;
        String ques = "Question " + this.questionID+": "+this.Question+"\n";
        for (String item : this.listanswer) {
            ques += "" + i +". " + item + "\n";
            i++;
        }
        ques += "Answer is : " + this.answer + "\n";
        ques += "---------------------------";
        return ques;
    }
    

    
}
