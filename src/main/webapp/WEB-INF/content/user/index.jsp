<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title></title>
    <link rel="stylesheet" href="/statics/css/bootstrap.min.css">
    <link rel="stylesheet" href="/statics/css/style.css">
</head>
<body>
<div class="container">

    <div class="login_warper">
        <form action="/user/login" id="loginForm" method="post">
            <legend>中国人民医院</legend>
            <label>账号</label>
            <input type="text" name="user.username">
            <label>密码</label>
            <input type="password" name="user.password">
            <div class="form-actions">
                <button class="button button-flat-action" id="loginBtn">进入系统</button>
            </div>
        </form>
    </div>

</div>


<script src="/statics/js/simditor/scripts/js/jquery.min.js"></script>
<script src="/statics/js/bootstrap.min.js"></script>
<script src="/statics/js/jquery.validate.js"></script>



</body>
</html>