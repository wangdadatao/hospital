package com.hospital.action;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;

/**
 * Created by 海涛 on 2016/5/20.
 */
@Namespace("/set")
public class SetAllAction {

    @Action(value = "department")
    public String showDepartment(){
        return "success";
    }

    @Action(value = "adddepartment")
    public String addDepartment(){
        return "success";
    }


}
