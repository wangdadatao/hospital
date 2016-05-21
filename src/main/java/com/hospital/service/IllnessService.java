package com.hospital.service;

import com.google.gson.Gson;
import com.hospital.dao.DepartmentDAO;
import com.hospital.dao.IllnessDAO;
import com.hospital.pojo.Department;
import com.hospital.pojo.Illness;
import org.apache.commons.lang3.StringUtils;
import org.springframework.transaction.annotation.Transactional;

import javax.inject.Inject;
import javax.inject.Named;
import java.util.List;

/**
 * Created by 海涛 on 2016/5/21.
 * IllnessService
 */
@Named
@Transactional
public class IllnessService {

    @Inject
    private IllnessDAO illnessDAO;

    @Inject
    private DepartmentDAO departmentDAO;

    //查找所有疾病
    public List<Illness> findAll() {
        return illnessDAO.findAll();
    }

    //添加或修改疾病
    public void addIllness(Illness illness, String d) {
        if (StringUtils.isNotEmpty(d) && illness != null) {
            Integer id = Integer.valueOf(d);
            if (id != 0) {
                Department department = departmentDAO.findById(id);
                illness.setDepartment(department);
                illnessDAO.save(illness);
            }
        }
    }

    //根据id查找疾病
    public Illness findById(String id) {
        return illnessDAO.findById(Integer.valueOf(id));
    }

    //删除疾病
    public void delIllness(String id) {
        if(StringUtils.isNotEmpty(id)){
            illnessDAO.del(Integer.valueOf(id));
        }
    }
}
