package com.hospital.action;

import com.google.gson.Gson;
import com.hospital.pojo.Department;
import com.hospital.pojo.Illness;
import com.hospital.pojo.User;
import com.hospital.service.DepartmentService;
import com.hospital.service.IllnessService;
import com.hospital.service.UserService;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.Result;

import javax.inject.Inject;
import java.io.IOException;
import java.util.List;

/**
 * Created by 海涛 on 2016/5/20.
 */
@Namespace("/set")
public class SetAllAction extends BaseAction {

    @Inject
    private DepartmentService departmentService;
    @Inject
    private IllnessService illnessService;
    @Inject
    private UserService userService;

    private List<Department> departmentList;
    private Department department;
    private String id;

    private List<Illness> illnessList;
    private Illness illness;

    private List<User> userList;
    private User user;

    //展示部门
    @Action(value = "departmentlist")
    public String showDepartment() {
        departmentList = departmentService.findAll();
        return SUCCESS;
    }

    //添加部门
    @Action(value = "departmentset")
    public String setDepartment() {
        return SUCCESS;
    }

    //添加部门
    @Action(value = "departmentadd", results = {
            @Result(type = "redirectAction", params = {"actionName", "departmentlist"})
    })
    public String addDepartment() {
        departmentService.addDepartment(department);

        return SUCCESS;
    }

    //获取某部门 json
    @Action(value = "departmentjson")
    public String departmentjson() throws IOException {
        department = departmentService.findById(Integer.valueOf(id));
        renderJSON(department);
        return NONE;
    }

    //删除某部门
    @Action(value = "departmentdel", results = {
            @Result(type = "redirectAction", params = {"actionName", "departmentlist"})
    })
    public String departmentDel() {
        departmentService.delDepartment(id);
        return SUCCESS;
    }

    //展示疾病列表
    @Action(value = "illnesslist")
    public String showIllness() {
        illnessList = illnessService.findAll();
        departmentList = departmentService.findAll();
        return SUCCESS;
    }

    //查询某疾病Json
    @Action(value = "illnessjson")
    public String illnessJson() throws IOException {
        illness = illnessService.findById(id);
        renderJSON(illness);
        return NONE;
    }

    //添加疾病
    @Action(value = "illnessset")
    public String setIllness() {
        departmentList = departmentService.findAll();
        return SUCCESS;
    }

    //添加疾病
    @Action(value = "illnessadd", results = {
            @Result(type = "redirectAction", params = {"actionName", "illnesslist"})
    })
    public String addIllness() {
        illnessService.addIllness(illness, id);
        return SUCCESS;
    }

    //删除某疾病
    @Action(value = "illnessdel", results = {
            @Result(type = "redirectAction", params = {"actiomName", "illnestlist"})
    })
    public String delIllness() {
        illnessService.delIllness(id);
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


    // 展示用户
    @Action(value = "userlist")
    public String showUser() {
        userList = userService.findAll();

        return SUCCESS;
    }

    //添加用户
    @Action(value = "userset")
    public String setUser() {
        return SUCCESS;
    }

    //添加用户
    @Action(value = "useradd",results = {
            @Result(type = "redirectAction",params = {"actionName","userlist"})
    })
    public String addUser() {
        userService.addUser(user);
        return SUCCESS;
    }

    @Action(value = "userdel",results = {
            @Result(type = "redirectAction",params = {"actionName","userlist"})
    })
    public String delUser(){
        userService.delUser(id);
        return SUCCESS;
    }

    //获取User json
    @Action(value = "userjson")
    public String userJson() throws IOException {
        user = userService.findById(id);
        renderJSON(user);
        return NONE;
    }




    //SET  GET


    public List<Department> getDepartmentList() {
        return departmentList;
    }

    public void setDepartmentList(List<Department> departmentList) {
        this.departmentList = departmentList;
    }

    public Department getDepartment() {
        return department;
    }

    public void setDepartment(Department department) {
        this.department = department;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public List<Illness> getIllnessList() {
        return illnessList;
    }

    public void setIllnessList(List<Illness> illnessList) {
        this.illnessList = illnessList;
    }

    public Illness getIllness() {
        return illness;
    }

    public void setIllness(Illness illness) {
        this.illness = illness;
    }

    public List<User> getUserList() {
        return userList;
    }

    public void setUserList(List<User> userList) {
        this.userList = userList;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    //
}
