<%--
  Created by IntelliJ IDEA.
  User: 海涛
  Date: 2016/5/20
  Time: 15:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title></title>
    <link rel="stylesheet" href="http://cdn.staticfile.org/twitter-bootstrap/2.3.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="http://cdn.staticfile.org/font-awesome/4.1.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="http://cdn.staticfile.org/select2/3.4.8/select2.css">
    <link rel="stylesheet" href="http://cdn.staticfile.org/select2/3.4.8/select2-bootstrap.css">
    <link rel="stylesheet" href="/statics/css/style.css">
</head>
<body>

<%@include file="../../public/public.jsp" %>

<div class="container-fluid">
    <div class="row-fluid">
        <div class="span12">

            <div class="box">
                <div class="box-header">
                    <span class="title"><i class="fa fa-search"></i> 搜索</span>
                </div>
                <div class="box-body search-box">
                    <form action="" class="form-search">
                        <input type="text" placeholder="疾病名称">
                        <select id="ks">
                            <option value=""></option>
                            <c:forEach items="${departmentList}" var="department">
                                <option value="${department.id}">${department.name}</option>
                            </c:forEach>
                        </select>
                        <button class="button button-pill button-flat-primary"><i class="fa fa-search"></i> 搜索</button>
                    </form>

                </div>
            </div>


            <div class="box">
                <div class="box-header">
                    <span class="title"><i class="fa fa-medkit"></i> 病种列表</span>
                    <ul class="unstyled inline pull-right">
                        <li><a href="/set/illnessset"><i class="fa fa-plus"></i> 新建</a></li>
                    </ul>
                </div>
                <div class="box-body">
                    <table class="table">
                        <thead>
                        <tr>
                            <th width="200">疾病名称</th>
                            <th width="200">所属科室</th>
                            <th>#</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${illnessList}" var="illness">
                            <tr>
                                <th>${illness.name}</th>
                                <th>${illness.department.name}</th>
                                <th>
                                    <a class="a-exitillness" index="${illness.id}" href="javaScript:;">修改</a>
                                    <a class="a-delillness" index="${illness.id}" href="javaScript:;">删除</a>
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
<%--修改疾病及科室弹框--%>
<div class="modal hide fade" id="newDepartment_Modal">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                        aria-hidden="true">&times;</span></button>
                <h4 class="modal-title"><i class="fa fa-plus"></i> 编辑疾病</h4>
            </div>
            <div class="modal-body">
                <form action="/set/illnessadd" id="form-editdepartment" method="post">
                    <input type="hidden" id="input-id" name="illness.id">
                    <div class="form-group">
                        <label>疾病名称</label>
                        <input id="input-name" type="text" class="form-control" name="illness.name"
                               placeholder="疾病名称">
                    </div>
                    <div class="form-group">
                        <select name="id" id="kss">
                            <option value=""></option>
                            <c:forEach items="${departmentList}" var="department">
                                <option value="${department.id}">${department.name}</option>
                            </c:forEach>
                        </select>
                    </div>

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
<script src="http://cdn.staticfile.org/select2/3.4.8/select2.min.js"></script>
<script src="/statics/js/jquery.validate.js"></script>
<script>
    $(function () {

        //删除记录
        $(".a-delillness").click(function () {
            var id = $(this).attr("index");
            if (confirm("确定要删除吗？")) {
                window.location.href = "/set/illnessdel?id=" + id;
            }
        });

        $("#ks").select2({
            placeholder: "请选择科室",
            width: '200px'
        });

        $("#kss").select2({
            placeholder: "请选择科室",
            width: '200px'
        });


        $(".a-exitillness").click(function () {
            var id = $(this).attr("index");
            $.ajax({
                url: "/set/illnessjson?id=" + id,
                type: "post",
                success: function (json) {
                    if (json.status == "error") {
                        alert("服务器异常,请稍后再试!");
                    } else {
                        $("#newDepartment_Modal").modal("show");

                        $("#input-id").val(json.id);
                        $("#input-name").val(json.name);
                    }
                },
                error: function () {
                    alert("服务器异常,请稍后再试!")
                }
            });
        });


        $("#form-editdepartment").validate({
            errorElement:"span",
            errorClass:"text-error",
            rules:{
                "illness.name":{
                    required:true
                },
                id:{
                    min:1
                }
            },
            messages:{
                "illness.name":{
                    required:"请输入疾病名称"
                },
                "id":{
                    min:"请选择所属科室"
                }
            }
        })

        $("#btn-save-illness").click(function () {
            $("#form-exitdepartment").submit();
        })

    });


</script>

</body>
</html>
</html>
