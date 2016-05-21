package com.hospital.action;


import com.hospital.pojo.User;
import com.hospital.service.UserService;
import com.sun.net.httpserver.Authenticator;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;

/**
 * Created by 昊 on 2016/5/20.
 */

@Namespace("/user")
public class UserAction extends BaseAction {

    private UserService userService = new UserService();
    private User user;


    @Action("index")
    public String execute(){
        return "success";
    }

    @Action("login")
    public String login(){
        User dbUser = userService.findByName(user.getUsername());
        if(dbUser != null && user.getPassword().equals(dbUser.getPassword())){
            putSession("curr_user", dbUser);
            return "success";
        }else {
            return "error";
        }
    }



    //get/set


    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }
}
