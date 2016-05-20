package com.hospital.pojo;

import java.io.Serializable;

/**
 * Created by 海涛 on 2016/5/20.
 * 医保
 */
public class Insurance implements Serializable {

    private Integer id;
    private String name;    //医保类型

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
}
