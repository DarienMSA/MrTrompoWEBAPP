/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.mrtrompoweb.models;

/**
 *
 * @author 52811
 */
public class user {
    private String email;
    private String name;
    private String password;
    private boolean admin;
    private boolean onboarding;

    public user(String email, String name, String password, boolean admin, boolean onboarding) {
        this.email = email;
        this.name = name;
        this.password = password;
        this.admin = admin;
        this.onboarding = onboarding;
    }

    public user(String email, String name, String password) {
        this.email = email;
        this.name = name;
        this.password = password;
    }

    public user(String email, String password) {
        this.email = email;
        this.password = password;
    }

    public user(String email) {
        this.email = email;
    }

    
    
    public user() {
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

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public boolean isAdmin() {
        return admin;
    }

    public void setAdmin(boolean admin) {
        this.admin = admin;
    }

    public boolean isOnboarding() {
        return onboarding;
    }

    public void setOnboarding(boolean onboarding) {
        this.onboarding = onboarding;
    }
    
    
}
