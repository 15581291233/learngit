<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>学生报名</title>
<style type="text/css">
    .layui-form {
        margin: 0 auto;
    }
    .layui-form-label {
        width: 100px;
    }
</style>
</head>
<body>
    <div class="layadmin-tabsbody-item layui-show" style="margin-bottom: 100px;">
        <div class="layui-fluid">
            <div class="layui-card">
                <div class="layui-card-header">报名</div>
                <div class="layui-card-body">
                    <form class="layui-form" id="myForm" action="javascript:;">
                        <div class="layui-form-item">
                            <div class="layui-inline">
                                <label class="layui-form-label">姓名</label>
                                <div class="layui-input-inline">
                                    <input type="text" name="student.name" lay-verify="required" autocomplete="off" placeholder="请输入姓名" class="layui-input">
                                </div>
                            </div>
                            <div class="layui-inline">
                                <label class="layui-form-label">性别</label>
                                <div class="layui-input-inline">
                                    <select name="student.sex" lay-verify="required">
                                        <option value="">请选择</option>
                                        <option value="男">男</option>
                                        <option value="女">女</option>
                                    </select>
                                </div>
                            </div>
                            <div class="layui-inline">
                                <label class="layui-form-label">身份证号</label>
                                <div class="layui-input-inline">
                                    <input type="text" name="student.idCard" lay-verify="required|identity" autocomplete="off" placeholder="请输入身份证号" class="layui-input">
                                </div>
                            </div>
                            <div class="layui-inline">
                                <label class="layui-form-label">联系电话</label>
                                <div class="layui-input-inline">
                                    <input type="text" name="student.phone" lay-verify="required|phone" autocomplete="off" placeholder="请输入联系电话" class="layui-input">
                                </div>
                            </div>
                            <div class="layui-inline">
                                <label class="layui-form-label">毕业学校</label>
                                <div class="layui-input-inline">
                                    <input type="text" name="student.school" lay-verify="required" autocomplete="off" placeholder="请输入毕业学校" class="layui-input">
                                </div>
                            </div>
                            <div class="layui-inline">
                                <label class="layui-form-label">考试类型</label>
                                <div class="layui-input-inline">
                                    <select name="student.examType" lay-verify="required">
                                        <option value="">请选择</option>
                                        <option value="统考">统考</option>
                                        <option value="对口">对口</option>
                                    </select>
                                </div>
                            </div>
                            <div class="layui-inline">
                                <label class="layui-form-label">考区</label>
                                <div class="layui-input-inline">
                                    <select name="student.examArea" lay-verify="required">
                                        <option value="">请选择</option>
                                        <option value="一中">一中</option>
                                        <option value="二中">二中</option>
                                    </select>
                                </div>
                            </div>
                            <div class="layui-inline">
                                <label class="layui-form-label">监护人姓名</label>
                                <div class="layui-input-inline">
                                    <input type="text" name="student.guardianName" lay-verify="required" autocomplete="off" placeholder="请输入监护人姓名" class="layui-input">
                                </div>
                            </div>
                            <div class="layui-inline">
                                <label class="layui-form-label">监护人电话</label>
                                <div class="layui-input-inline">
                                    <input type="text" name="student.guardianPhone" lay-verify="required|phone" autocomplete="off" placeholder="请输入监护人电话" class="layui-input">
                                </div>
                            </div>
                        </div>
                        <div class="layui-form-item">
                            <div class="layui-input-block" style="text-align: center;">
                                <button class="layui-btn" lay-submit lay-filter="submit">立即提交</button>
                                <button type="reset" class="layui-btn layui-btn-primary">重置</button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</body>
<script type="text/javascript">
layui.use(['layer', 'form'], function(){
    var layer = layui.layer,
    form = layui.form;

    var lock = true;
    form.on('submit(submit)', function(data){
        var that = $(this);
        layer.open({
            title: '提示',
            content: '信息确认无误且提交？',
            icon: 3,
            btn: ['确定提交', '我再看看'],
            yes: function(index){
                layer.close(index);
                if(!lock){
                    layer.msg('请勿重复提交');
                    return;
                }
                lock = false;
                that.text('提交中..');
                that.css({'background-color': 'gray'});
                $.ajax({
                    type: 'POST',
                    url: '/app/insertStudent',
                    data: data.field,
                    dataType: "json",
                    async : true,
                    success: function(res){
                        lock = true;
                        that.text('立即提交');
                        that.css({'background-color': '#009688'});
                        if(res.code == 0){
                            layer.msg('提交成功', {icon: 1});
                            $("#myForm")[0].reset();
                        }else{
                            layer.msg(res.desc, {icon: 2});
                        }
                    },
                    error: function(){
                        lock = true;
                        that.text('立即提交');
                        that.css({'background-color': '#009688'});
                        layer.msg('网络错误', {icon: 2});
                    }
                });
            }
        });
    });
});
</script>
</html>