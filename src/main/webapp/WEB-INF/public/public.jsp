<%--
  Created by IntelliJ IDEA.
  User: 海涛
  Date: 2016/5/20
  Time: 13:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="navbar navbar-static-top">
    <div class="navbar-inner">
        <a class="brand" href="#">凯盛医疗</a>
        <ul class="nav">
            <li><a href="home.html"><i class="fa fa-home"></i> 首页</a></li>
            <li><a href="patient-list.html"><i class="fa fa-building"></i> 病人档案</a></li>
            <li><a href="#"><i class="fa fa-stethoscope"></i> 就诊记录</a></li>
            <li><a href="#"><i class="fa fa-bell-o"></i> 复诊提醒</a></li>
            <li><a href="#"><i class="fa fa-bar-chart-o"></i> 数据统计</a></li>
            <li class="dropdown active">
                <a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-cogs"></i> 系统设置 <b
                        class="caret"></b></a>
                <ul class="dropdown-menu">
                    <li><a href="/set/departmentlist"><i class="fa fa-sitemap"></i> 科室设置</a></li>
                    <li><a href="/set/illnesslist"><i class="fa fa-medkit"></i> 病种设置</a></li>
                    <li><a href="/set/insurancelist"><i class="fa fa-bars"></i> 医保类型设置</a></li>
                    <li><a href="/set/statelist"><i class="fa fa-child"></i> 患者状态设置</a></li>
                    <li class="dividerlist"></li>
                    <li><a href="/set/userlist"><i class="fa fa-user-md"></i> 账号设置</a></li>
                </ul>
            </li>
        </ul>
        <ul class="nav pull-right">
            <li class="divider-vertical"></li>
            <li><a href="#"><i class="fa fa-cog"></i> 个人设置</a></li>
        </ul>
    </div>
</div>
