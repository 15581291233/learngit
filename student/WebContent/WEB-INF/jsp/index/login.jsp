<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="${ctxPath}/css/login.css">
<title></title>
</head>
<body>
    <div class="layadmin-tabspage-none" id="LAY_app">
        <div class="layadmin-user-login layadmin-user-display-show">
            <div class="layadmin-user-login-main">
                <div class="layadmin-user-login-box layadmin-user-login-header">
                    <h2>Admin</h2>
                    <p>三河市教育和体育局报名系统</p>
                </div>
                <div class="layadmin-user-login-box layadmin-user-login-body layui-form">
                    <div class="layui-form-item">
                        <label class="layadmin-user-login-icon layui-icon layui-icon-username"></label>
                        <input type="text" name="user.username" lay-verify="required" placeholder="用户名" class="layui-input">
                    </div>
                    <div class="layui-form-item">
                        <label class="layadmin-user-login-icon layui-icon layui-icon-password"></label>
                        <input type="password" name="user.password" lay-verify="required" placeholder="密码" class="layui-input">
                    </div>
                    <div class="layui-form-item">
                        <button class="layui-btn layui-btn-fluid" lay-submit lay-filter="login-submit">登 入</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script type="text/javascript">
    layui.use(['layer', 'form'], function(){
        var layer = layui.layer,
        form = layui.form;
        
        form.on('submit(login-submit)', function(obj){
            var that = $(this);
            that.text('登录中..');
            that.attr('disabled', 'disabled');
            $.ajax({
                type: 'POST',
                url: '/app/doLogin',
                data: obj.field,
                dataType: "json",
                success: function(res){
                    if(res.code == 0){
                        that.text('登录成功');
                        location.href = '/app/admin';
                    }else{
                        that.text('登 入');
                        that.attr('disabled', false);
                        layer.msg(res.desc, {icon: 2});
                    }
                },
                error: function(){
                    that.text('登 入');
                    that.attr('disabled', false);
                    layer.msg('网络错误', {icon: 0});
                }
            });
        });
    });
    </script>
</body>
</html>