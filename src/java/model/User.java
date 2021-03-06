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
public class User {

    private String username, password, email, phone, name;
    private int age, active, admin;
    
    public User() {
    }

    public User(String username, String password, String email, String name, int age, String phone, int active, int admin) {
        this.username = username;
        this.password = password;
        this.email = email;
        this.name = name;
        this.age = age;
        this.phone = phone;
        this.active = active;
        this.admin = admin;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getAge() {
        return age;
    }

    public void setAge(int age) {
        this.age = age;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }
    public int getActive() {
        return active;
    }

    public void setActive(int active) {
        this.active = active;
    }

    public int getAdmin() {
        return admin;
    }

    public void setAdmin(int admin) {
        this.admin = admin;
    }

    @Override
    public String toString() {
        return "Users{" + "username=" + username + ", password=" + password + ", email=" + email + ", name=" + name + ", age=" + age + ", phone=" + phone + ", active=" + active + ", admin=" + admin + '}';
    }

    
    

}
