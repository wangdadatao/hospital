package com.hospital.action;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;

/**
 * Created by 海涛 on 2016/5/20.
 */
@Namespace("/set")
public class SetAllAction extends BaseAction {

    //展示部门
    @Action(value = "departmentlist")
    public String showDepartment() {
        return SUCCESS;
    }

    //添加部门
    @Action(value = "departmentset")
    public String setDepartment() {
        return SUCCESS;
    }

    //添加部门
    @Action(value = "departmentadd")
    public String addDepartment() {
        return SUCCESS;
    }

    //展示疾病列表
    @Action(value = "illnesslist")
    public String showIllness(){
        return SUCCESS;
    }

    //添加疾病
    @Action(value = "illnessset")
    public String setIllness() {
        return SUCCESS;
    }

    //添加疾病
    @Action(value = "illnessadd")
    public String addIllness() {
        return SUCCESS;
    }

    @Action(value = "insurance")
    public String setInsurance() {
        return SUCCESS;
    }

    @Action(value = "addinsurance")
    public String addInsurance() {
        return SUCCESS;
    }

    @Action(value = "state")
    public String setState() {
        return SUCCESS;
    }

    @Action(value = "addstate")
    public String addState() {
        return SUCCESS;
    }


    //    展示、添加用户
    @Action(value = "userlist")
    public String showUser() {
        return SUCCESS;
    }

    @Action(value = "userset")
    public String setUser() {
        return SUCCESS;
    }

    @Action(value = "useradd")
    public String addUser() {
        return SUCCESS;
    }

}
