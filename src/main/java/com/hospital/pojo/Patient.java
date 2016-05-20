package com.hospital.pojo;

import java.io.Serializable;

/**
 * Created by 海涛 on 2016/5/20.
 * 病人
 */
public class Patient implements Serializable {

    private Integer id;
    private String sex;
    private String name;
    private String idcard;
    private Integer age;    //年龄
    private String tel;     //电话
    private Integer insuranceid;        //医保类型
    private String address;     //地址
    private String allergy;     //过敏史
    private String mark;        //备注
    private String createtime;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getIdcard() {
        return idcard;
    }

    public void setIdcard(String idcard) {
        this.idcard = idcard;
    }

    public Integer getAge() {
        return age;
    }

    public void setAge(Integer age) {
        this.age = age;
    }

    public String getTel() {
        return tel;
    }

    public void setTel(String tel) {
        this.tel = tel;
    }

    public Integer getInsuranceid() {
        return insuranceid;
    }

    public void setInsuranceid(Integer insuranceid) {
        this.insuranceid = insuranceid;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getAllergy() {
        return allergy;
    }

    public void setAllergy(String allergy) {
        this.allergy = allergy;
    }

    public String getMark() {
        return mark;
    }

    public void setMark(String mark) {
        this.mark = mark;
    }

    public String getCreatetime() {
        return createtime;
    }

    public void setCreatetime(String createtime) {
        this.createtime = createtime;
    }
}
