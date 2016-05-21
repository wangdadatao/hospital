<%--
  Created by IntelliJ IDEA.
  User: 海涛
  Date: 2016/5/20
  Time: 14:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>科室列表</title>
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
                    <span class="title"><i class="fa fa-sitemap"></i> 科室列表</span>
                    <ul class="unstyled inline pull-right">
                        <li><a href="/set/departmentset"><i class="fa fa-plus"></i> 新建</a></li>
                    </ul>
                </div>
                <div class="box-body">
                    <table class="table">
                        <thead>
                        <tr>
                            <th width="200">科室名称</th>
                            <th width="200">负责人</th>
                            <th>#</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${departmentList}" var="department">
                            <tr>
                                <th>${department.name}</th>
                                <th>${department.admin}</th>
                                <th>
                                    <a id="a-editdepartment" index="${department.id}" href="javascript:;">修改</a>
                                    <a id="a-deldepartment" href="javascript:;" index="${department.id}">删除</a>
                                </th>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>


        </div>

    </div>
</div>

<div class="modal fade" id="newCustomer_Modal">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                        aria-hidden="true">&times;</span></button>
                <h4 class="modal-title"><i class="fa fa-plus"></i> 编辑用户</h4>
            </div>
            <div class="modal-body">
                <form action="/set/departmentadd" id="form-exitdepartment" method="post">
                    <input type="hidden" id="input-id" name="department.id">
                    <div class="form-group">
                        <label>客户名称</label>
                        <input id="input-name" type="text" class="form-control" name="department.name" placeholder="客户名称">
                    </div>
                    <div class="form-group">
                        <label>联系人</label>
                        <input id="input-admin" type="text" class="form-control" name="department.admin" placeholder="联系人姓名">
                    </div>

                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                <button id="btn-save-department" type="button" class="btn btn-primary">保存</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div><!-- /.modal -->


<script src="http://cdn.staticfile.org/jquery/1.11.1/jquery.min.js"></script>
<script src="http://cdn.staticfile.org/twitter-bootstrap/3.0.0/js/bootstrap.min.js"></script>
<script src="/statics/js/jquery.validate.js"></script>
<script>
    $(function () {

        $("#a-editdepartment").click(function () {
            var id = $(this).attr("index");
            $.ajax({
                url: "/set/departmentjson?id=" + id,
                type: "post",
                success: function (json) {
                    if (json.status == "error") {
                        alert("服务器异常,请稍后再试!");
                    } else {
                        $("#newCustomer_Modal").modal("show");
                        $("#input-id").val(json.id);
                        $("#input-name").val(json.name);
                        $("#input-admin").val(json.admin);
                    }
                },
                error: function () {
                    alert("服务器异常,请稍后再试!")
                }
            });

            $("#form-exitdepartment").validate({
                errorElement:"span",
                errorClass:"text-error",
                rules:{
                    "department.name":{
                        required:true
                    },
                    "department.admin":{
                        required:true
                    }
                },
                messages:{
                    "department.name":{
                        required:"请输入科室名"
                    },
                    "department.admin":{
                        required:"请输入负责人姓名"
                    }
                }
            })

            $("#btn-save-department").click(function () {
                $("#form-exitdepartment").submit();
            })

            $("#a-deldepartment").click(function () {
                var id = $(this).attr("index");
                if(confirm("确定要删除吗？")){
                    window.location.href = "/set/departmentdel?id=" + id;
                }
            })

        })


    })


</script>
</body>
</html>