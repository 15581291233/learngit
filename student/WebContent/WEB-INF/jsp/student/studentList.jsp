<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
</head>
<body>
    <div class="layadmin-tabsbody-item layui-show">
        <div class="layui-fluid">
            <div class="layui-card">
                <div class="layui-form layui-card-header layuiadmin-card-header-auto">
                    <div class="layui-form-item">
                        <div class="layui-inline">
                            <label class="layui-form-label">学生姓名</label>
                            <div class="layui-input-inline">
                                <input type="text" class="layui-input" placeholder="学生姓名" name="name">
                            </div>
                        </div>
                        <div class="layui-inline">
                            <label class="layui-form-label">学生电话</label>
                            <div class="layui-input-inline">
                                <input type="text" class="layui-input" placeholder="学生电话" name="phone">
                            </div>
                        </div>
                        <div class="layui-inline">
                            <label class="layui-form-label">身份证号</label>
                            <div class="layui-input-inline">
                                <input type="text" class="layui-input" placeholder="身份证号" name="idCard">
                            </div>
                        </div>
                        <div class="layui-inline">
                            <label class="layui-form-label">报名日期</label>
                            <div class="layui-input-inline">
                                <input type="text" class="layui-input" placeholder="报名起始日期" id="signDate" name="signDate">
                            </div>
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <div class="layui-inline">
                            <label class="layui-form-label"></label>
                            <div class="layui-input-inline">
                                <a class="layui-btn layui-btn-primary" href="javascript: excel()">导出</a>
                                <button class="layui-btn" type="button" id="btnSelect">
                                    <i class="layui-icon layui-icon-search layuiadmin-button-btn"></i>
                                </button>
                            </div>
                            <div class="layui-input-inline" style="position: fixed;right: 0;">
                                <a class="layui-btn layui-btn-danger" href="javascript:emptyList()">清空</a>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="layui-card-body">
                    <table class="layui-table admin-table" id="tbSale"></table>
                </div>
            </div>
        </div>
    </div>
<script type="text/javascript">
function loadData(){
    layui.use(['table', 'laydate'], function(){
        var table = layui.table,
        laydate = layui.laydate;
        
        laydate.render({
            elem: '#signDate'
            ,range: true
        });
        //执行一个 table 实例
        table.render({
            elem: '#tbSale'
            ,url: '/app/getStudentInfo' //数据接口
            ,where: {
                'signDate': $('[name="signDate"]').val(),
                'name': $('[name="name"]').val(),
                'phone': $('[name="phone"]').val(),
                'idCard': $('[name="idCard"]').val()
            }
            ,title: '学生列表'
            ,cols: [[ //表头
                {field: 'name', title: '姓名', fixed: 'left'}
                ,{field: 'sex', title: '性别'}
                ,{field: 'idCard', title: '身份证号'}
                ,{field: 'phone', title: '电话'}
                ,{field: 'school', title: '毕业学校'}
                ,{field: 'examType', title: '考试类型'}
                ,{field: 'examArea', title: '考区'}
                ,{field: 'guardianName', title: '监护人姓名'}
                ,{field: 'guardianPhone', title: '监护人电话'}
                ,{field: 'examDate', title: '报考年份'}
            ]]
        });
    });
}

$(function(){
    loadData()
    $('#btnSelect').click(function(){
        loadData();
    });
});

function excel(){
    var signDate = $('[name="signDate"]').val();
    var name = $('[name="name"]').val();
    var phone = $('[name="phone"]').val();
    var idCard = $('[name="idCard"]').val();
    location.href = "/app/excelStudentInfo?signDate="+signDate+"&name="+name+"&phone="+phone+"&idCard="+idCard;
}

function emptyList(){
    layui.use(['layer'], function(){
        var layer = layui.layer;
        layer.open({
            title: '提示',
            content: '清空后将不能再支持展示及导出，确定清空吗？',
            icon: 7,
            btn: ['确定', '取消'],
            yes: function(index){
                layer.close(index);
                var tip = layer.msg('清空中', {
                    icon: 16
                    ,shade: 0.01
                    ,time: 0
                });
                $.ajax({
                    type: 'POST',
                    url: '/app/emptyStudentList',
                    success: function(res){
                        layer.close(tip);
                        if(res.code == 0){
                            layer.msg('操作成功', {icon: 1, time: 1000}, function(){
                                loadData();
                            });
                        }else{
                            layer.msg(res.desc, {icon: 2});
                        }
                    },
                    error: function(){
                        layer.msg('网络错误', {icon: 2});
                    }
                });
            }
        });
    });
}
</script>
</body>
</html>