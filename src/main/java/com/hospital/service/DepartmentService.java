package com.hospital.service;

import com.google.gson.Gson;
import com.hospital.dao.DepartmentDAO;
import com.hospital.pojo.Department;
import org.springframework.transaction.annotation.Transactional;

import javax.inject.Inject;
import javax.inject.Named;
import java.util.List;

/**
 * Created by 海涛 on 2016/5/20.
 */
@Named
@Transactional
public class DepartmentService {

    @Inject
    private DepartmentDAO departmentDAO;

    public List<Department> findAll() {
        return departmentDAO.findAll();
    }

    //保存科室
    public void addDepartment(Department department) {
        departmentDAO.save(department);
        System.out.println(new Gson().toJson(department));

    }

    public Department findById(Integer id) {
        return departmentDAO.findById(id);
    }

    //删除某个科室
    public void delDepartment(String id) {
        departmentDAO.del(Integer.valueOf(id));
    }
}
