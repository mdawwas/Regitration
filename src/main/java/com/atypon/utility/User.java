package com.atypon.utility;

/**
 * Created by mdawwas on 5/24/17.
 */
public class User {
    int id;
    int type;
    String userName;
    String password;
    String name;

    public User(int id, int type, String userName, String password, String name) {
        this.id = id;
        this.type = type;
        this.userName = userName;
        this.password = password;
        this.name = name;
    }

    public User(int type, String userName, String password, String name) {
        this.type = type;
        this.userName = userName;
        this.password = password;
        this.name = name;
    }

    public User(int id, String name) {
        this.id = id;
        this.name = name;
    }

    public int getId() {
        return id;
    }

    public int getType() {
        return type;
    }

    public String getUserName() {
        return userName;
    }

    public String getPassword() {
        return password;
    }

    public String getName() {
        return name;
    }
}
