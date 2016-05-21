package com.hospital.action;

import com.google.gson.Gson;
import com.hospital.pojo.Department;
import com.hospital.service.DepartmentService;
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

    private List<Department> departmentList;
    private Department department;
    private String id;

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
        System.out.println(new Gson().toJson(department));
        renderJSON(department);
        return NONE;
    }

    //删除某部门
    @Action(value = "departmentdel", results = {
            @Result(type = "redirectAction", params = {"actionName", "departmentlist"})
    })
    public String departmentDel(){
        departmentService.delDepartment(id);
        return SUCCESS;
    }

    //展示疾病列表
    @Action(value = "illnesslist")
    public String showIllness() {
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


    // 展示用户
    @Action(value = "userlist")
    public String showUser() {
        return SUCCESS;
    }

    //添加用户
    @Action(value = "userset")
    public String setUser() {
        return SUCCESS;
    }

    //添加用户
    @Action(value = "useradd")
    public String addUser() {
        return SUCCESS;
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
}
