package com.hospital.service.user;

import com.hospital.dao.UserDAO;
import com.hospital.pojo.User;
import org.springframework.transaction.annotation.Transactional;

import javax.inject.Inject;
import javax.inject.Named;

/**
 * Created by 昊 on 2016/5/20.
 */

@Named
@Transactional
public class UserService {
    @Inject
    private UserDAO userDAO;

    
    public User findByName(String name){
        System.out.println(userDAO);
        return userDAO.findByName(name);
    }

}
