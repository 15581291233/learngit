<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="/tags/tiles" prefix="tiles" %>
<!DOCTYPE html>
<html>
<head>
	<meta name="renderer" content="webkit" />
	<meta name="description" content="overview & stats" />
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />
	<meta http-equiv="Content-Type" content="text/html;charset=utf-8" />
	<script src="${ctxPath}/js/jquery-1.11.1.js"></script>
	<script src="${ctxPath}/layui/layui.js?v=2.4.5"></script>
	<link rel="stylesheet" href="${ctxPath}/layui/css/layui.css?v=2.4.5">
    <link rel="stylesheet" href="${ctxPath}/dist/style/admin.css?v=1.0.1">
	<title>三河市教育和体育局报名系统</title>
	 
</head>
<style>
    html {
        overflow-y: hidden;
    }
    .layui-layout-admin .layui-body {
        height: 100%;
        min-width: 1200px;
        overflow: hidden;
    }
    .layui-table-page {
        text-align: center;
    }
    .layui-layout-body {
        overflow: auto;
    }
    .layui-layout-admin .layui-body .layadmin-tabsbody-item {
        padding-bottom: 50px;
    }
</style>
<body class="layui-layout-body">
    <div class="layadmin-tabspage-none">
	    <div class="layui-layout layui-layout-admin">
            <%-- <tiles:insertAttribute name="header" /> --%>
            <%-- <tiles:insertAttribute name="menu" /> --%>
            <!-- <div class="layui-body">
                <div class="layadmin-tabsbody-item layui-show"> -->
	                <tiles:insertAttribute name="body" />
                <!-- </div>
            </div> -->
        </div>
    </div>
</body>
</html>