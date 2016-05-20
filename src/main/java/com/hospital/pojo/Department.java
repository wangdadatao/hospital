package com.hospital.pojo;

import java.io.Serializable;

/**
 * Created by 海涛 on 2016/5/20.
 */
public class Department implements Serializable {

    private Integer id;
    private String name;
    private String admin;


    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getAdmin() {
        return admin;
    }

    public void setAdmin(String admin) {
        this.admin = admin;
    }
}
