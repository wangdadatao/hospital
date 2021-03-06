package com.hospital.pojo;

import java.io.Serializable;

/**
 * Created by 海涛 on 2016/5/20.
 * 疾病种类
 */
public class Illness implements Serializable {

    private Integer id;
    private String name;
    private Department department;

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

    public Department getDepartment() {
        return department;
    }

    public void setDepartment(Department department) {
        this.department = department;
    }
}
