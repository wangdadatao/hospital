package com.hospital.service;

import com.hospital.dao.UserDAO;
import com.hospital.pojo.User;
import org.apache.commons.lang3.StringUtils;
import org.joda.time.DateTime;
import org.springframework.transaction.annotation.Transactional;

import javax.inject.Inject;
import javax.inject.Named;
import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * Created by 昊 on 2016/5/20.
 */

@Named
@Transactional
public class UserService {
    @Inject
    private UserDAO userDAO;


    //根据用户名查找用户
    public User findByName(String name) {
        System.out.println(userDAO);
        return userDAO.findByName(name);
    }

    //查找所有的用户
    public List<User> findAll() {
        return userDAO.findAll();
    }

    //保存或修改用户资料
    public void addUser(User user) {
        if (user != null) {
            if (StringUtils.isNotEmpty(user.getUsername()) &&
                    StringUtils.isNotEmpty(user.getPassword()) &&
                    StringUtils.isNotEmpty(user.getRealname())) {

                if (user.getId() != null) {
                    //修改用户资料
                    User dbUser = userDAO.findById(user.getId());

                    dbUser.setUsername(user.getUsername());
                    dbUser.setPassword(user.getPassword());
                    dbUser.setRealname(user.getRealname());
                    dbUser.setRole(user.getRole());
                    dbUser.setTel(user.getTel());

                    userDAO.save(dbUser);
                } else {
                    //新增用户
                    user.setCreatetime(DateTime.now().toString("yyyy-MM-dd HH:mm:ss"));
                    user.setState(User.NORMAL);
                    userDAO.save(user);
                }
            }
        }
    }

    //根据id查找用户
    public User findById(String id) {
        if (StringUtils.isNotEmpty(id)) {
            return userDAO.findById(Integer.valueOf(id));
        }
        return null;
    }

    //删除用户
    public void delUser(String id) {
        userDAO.del(Integer.valueOf(id));
    }
}
