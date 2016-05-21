<%--
  Created by IntelliJ IDEA.
  User: 海涛
  Date: 2016/5/20
  Time: 14:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>添加疾病</title>
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
            <span class="title">
              <i class="fa fa-plus"></i>
              <a href="/set/illnesslist"> 病种列表</a>  /  新增疾病
            </span>
                </div>
                <div class="box-body form">
                    <form id="form-addillness" action="/set/illnessadd" method="post">
                        <label>疾病名称</label>
                        <input name="illness.name" type="text">
                        <label>所属科室</label>
                        <select name="id" id="ks">
                            <option value="0"></option>
                            <c:forEach items="${departmentList}" var="department">
                                <option value="${department.id}">${department.name}</option>
                            </c:forEach>
                        </select>
                        <div class="form-actions">
                            <button id="btn-submmit" type="button" class="button button-flat-action button-pill">保存</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>

    </div>
</div>


<script src="http://cdn.staticfile.org/jquery/1.11.1/jquery.min.js"></script>
<script src="http://cdn.staticfile.org/twitter-bootstrap/3.0.0/js/bootstrap.min.js"></script>
<script src="http://cdn.staticfile.org/select2/3.4.8/select2.min.js"></script>
<script src="/statics/js/jquery.validate.js"></script>
<script>
    $(function () {
        $("#ks").select2({
            placeholder: "请选择科室",
            width: '220px'
        });

        $("#form-addillness").validate({
            errorElement:"span",
            errorClass:"text-error",
            rules:{
                "illness.name":{
                    required:true
                },
                "id":{
                    min:1
                }
            },
            messages:{
                "illness.name":{
                    required:"请输入疾病名字"
                },
                "id":{
                    min:"请选择科室"
                }
            }
        });

        $("#btn-submmit").click(function () {
            $("#form-addillness").submit()
        })

    });
</script>

</body>
</html>