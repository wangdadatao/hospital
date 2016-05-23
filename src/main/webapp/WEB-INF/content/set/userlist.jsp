<%--
  Created by IntelliJ IDEA.
  User: 海涛
  Date: 2016/5/20
  Time: 14:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>员工列表</title>
    <link rel="stylesheet" href="http://cdn.staticfile.org/twitter-bootstrap/2.3.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="http://cdn.staticfile.org/font-awesome/4.1.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="/statics/css/style.css">
</head>
<body>

<%@include file="../../public/public.jsp" %>

<div class="container-fluid">
    <div class="row-fluid">
        <div class="span12">

            <div class="box">
                <div class="box-header">
                    <span class="title"><i class="fa fa-user-md"></i> 系统账号列表</span>
                    <ul class="unstyled inline pull-right">
                        <li><a href="/set/userset"><i class="fa fa-plus"></i> 新建</a></li>
                    </ul>
                </div>
                <div class="box-body">
                    <table class="table">
                        <thead>
                        <tr>
                            <th width="200">账户名称</th>
                            <th width="200">员工姓名</th>
                            <th>电话</th>
                            <th>角色</th>
                            <th>最后登录时间</th>
                            <th>最后登录IP</th>
                            <th>#</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${userList}" var="user">
                            <tr>
                                <td>${user.username}</td>
                                <td>${user.realname}</td>
                                <td>${user.tel}</td>
                                <td>${user.role}</td>
                                <td>${user.logtime}</td>
                                <td>${user.ip}</td>
                                <td>
                                    <a class="a-exituser" href="javaScript:;" index="${user.id}">修改</a>
                                    <a class="a-prohibituser" href="javaScript:;" index="${user.id}">禁用</a>
                                    <a class="a-deluser" href="javaScript:;" index="${user.id}">删除</a>
                                </td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>

<%--编辑用户--%>
<div class="modal hide fade" id="newDepartment_Modal">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                        aria-hidden="true">&times;</span></button>
                <h4 class="modal-title"><i class="fa fa-plus"></i> 编辑疾病</h4>
            </div>
            <div class="modal-body">
                <form id="form-edituser" action="/set/useradd" method="post">
                    <input type="hidden" name="user.id" id="input-id">
                    <label>员工姓名</label>
                    <input name="user.realname" type="text" id="realname">
                    <label>账号 <span class="muted">(用于登录系统)</span></label>
                    <input name="user.username" type="text" id="username">
                    <label>密码 <span class="muted">(默认123456)</span></label>
                    <input name="user.password" id="password" type="password" value="123456">
                    <label>联系电话</label>
                    <input name="user.tel" type="text" id="tel">
                    <label>请选择角色</label>
                    <select name="user.role">
                        <option value="管理员">管理员</option>
                        <option value="普通员工">普通员工</option>
                    </select>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                <button id="btn-save-illness" type="button" class="btn btn-primary">保存</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div><!-- /.modal -->

<script src="http://cdn.staticfile.org/jquery/1.11.1/jquery.min.js"></script>
<script src="http://cdn.staticfile.org/twitter-bootstrap/3.0.0/js/bootstrap.min.js"></script>
<script src="/statics/js/jquery.validate.js"></script>
<script>
    $(function () {

        $(".a-exituser").click(function () {
            var id = $(this).attr("index");
            $.ajax({
                url: "/set/userjson?id=" + id,
                type: "post",
                success: function (json) {
                    if (json.status == "error") {
                        alert("服务器异常,请稍后再试!");
                    } else {
                        $("#newDepartment_Modal").modal("show");

                        $("#input-id").val(json.id);
                        $("#username").val(json.username);
                        $("#realname").val(json.realname);
                        $("#password").val(json.password);
                        $("#tel").val(json.tel);
                    }
                },
                error: function () {
                    alert("服务器异常,请稍后再试!")
                }
            });
        });

//        修改用户表单验证
        $("#form-edituser").validate({
            errorElement: "span",
            errorClass: "text-error",
            rules: {
                "user.realname": {
                    required: true
                },
                "user.password": {
                    required: true
                },
                "user.username": {
                    required: true
                },
                "user.tel": {
                    required: true
                }
            },
            messages: {
                "user.realname": {
                    required: "请输入员工姓名"
                },
                "user.password": {
                    required: "请输入员工密码"
                },
                "user.username": {
                    required: "请输入登录账号"
                },
                "user.tel": {
                    required: "请输入员工手机号"
                }
            }
        })

        $("#btn-save-illness").click(function () {
            $("#form-edituser").submit();
        })

//        删除用户
        $(".a-deluser").click(function () {
            var id = $(this).attr("index");
            if(confirm("你确定要删除吗？")){
                window.location.href = "/set/userdel?id=" + id;
            }
        })

    })
</script>
</body>
</html>