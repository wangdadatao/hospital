<%--
  Created by IntelliJ IDEA.
  User: 海涛
  Date: 2016/5/20
  Time: 14:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>新增用户</title>
    <link rel="stylesheet" href="http://cdn.staticfile.org/twitter-bootstrap/2.3.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="http://cdn.staticfile.org/font-awesome/4.1.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="/statics/css/style.css">
</head>
<body>

<%@include file="../../public/public.jsp"%>

<div class="container-fluid">
    <div class="row-fluid">
        <div class="span12">

            <div class="box">
                <div class="box-header">
            <span class="title">
              <i class="fa fa-plus"></i>
              <a href="/set/userlist"> 系统账户列表</a>  /  新增账号
            </span>
                </div>
                <div class="box-body form">
                    <form id="form-adduser" action="/set/useradd" method="post">
                        <label>员工姓名</label>
                        <input name="user.realname" type="text" id="name">
                        <label>账号 <span class="muted">(用于登录系统)</span></label>
                        <input name="user.username" type="text" id="account" >
                        <label>密码 <span class="muted">(默认123456)</span></label>
                        <input name="user.password" type="password" value="123456">
                        <label>联系电话</label>
                        <input name="user.tel" type="text" >
                        <label>请选择角色</label>
                        <select name="user.role">
                            <option value="管理员">管理员</option>
                            <option value="普通员工">普通员工</option>
                        </select>

                        <div class="form-actions">
                            <button id="btn-commit" type="button" class="button button-flat-action button-pill">保存</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>



<script src="http://cdn.staticfile.org/jquery/1.11.1/jquery.min.js"></script>
<script src="http://cdn.staticfile.org/twitter-bootstrap/3.0.0/js/bootstrap.min.js"></script>
<script src="/statics/js/jquery.validate.js"></script>
<script>
    $(function () {

        $("#form-adduser").validate({
            errorElement:"span",
            errorClass:"text-error",
            rules:{
                "user.realname":{
                    required:true
                },
                "user.password":{
                    required:true
                },
                "user.username":{
                    required:true
                },
                "user.tel":{
                    required:true
                }
            },
            messages:{
                "user.realname":{
                    required:"请输入员工姓名"
                },
                "user.password":{
                    required:"请输入员工密码"
                },
                "user.username":{
                    required:"请输入登录账号"
                },
                "user.tel":{
                    required:"请输入员工手机号"
                }
            }
        })

        $("#btn-commit").click(function () {
            $("#form-adduser").submit();
        })


    })
</script>

</body>
</html>