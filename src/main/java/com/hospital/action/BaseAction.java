package com.hospital.action;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import org.apache.struts2.ServletActionContext;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.Map;

public abstract class BaseAction extends ActionSupport {

    public HttpServletRequest getHttpRequest() {
        return ServletActionContext.getRequest();
    }

    public HttpServletResponse getHttpResponse(){
        return ServletActionContext.getResponse();
    }

    public Map<String,Object> getSession() {
        return ActionContext.getContext().getSession();
    }

    public void putSession(String key,Object value) {
        getSession().put(key,value);
    }

}
