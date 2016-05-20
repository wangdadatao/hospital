package com.hospital.action.user;

import com.hospital.action.BaseAction;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;

/**
 * Created by 昊 on 2016/5/20.
 */

@Namespace("/user")
public class LoginAction extends BaseAction {

    @Action("index")
    public String index(){
        return "success";
    }

}
