package com.hospital.pojo;

import javax.persistence.*;
import java.io.Serializable;

/**
 * Created by 海涛 on 2016/5/20.
 * 疾病种类
 */
@Entity
@Table(name = "t_illness")
public class Illness implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;
    private String name;

    @ManyToOne(targetEntity = Department.class)
    @JoinColumn(name = "departmentid")
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
