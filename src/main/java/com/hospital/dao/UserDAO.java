package com.hospital.dao;

import com.hospital.pojo.User;
import org.hibernate.Criteria;
import org.hibernate.criterion.Restrictions;

/**
 * Created by 昊 on 2016/5/20.
 */
public class UserDAO extends BaseDAO<User, String> {

    public User findByName(String name){
        Criteria criteria = getSession().createCriteria(User.class);
        criteria.add(Restrictions.eq("username", name));
        return (User) criteria.uniqueResult();
    }



}
