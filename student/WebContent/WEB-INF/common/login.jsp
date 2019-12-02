<%@ page pageEncoding="UTF-8" %>
<script type="text/javascript">
<!--
var ctxPath="${ctxPath}", host="";

var date=new Date(); 
var expiresDays=30; 
date.setTime(date.getTime() + expiresDays*24*3600*1000);
var cookieExp ="; expires="+date.toGMTString();

$(document).ready(function() {
    $('input').attr('data-prompt-position','topLeft');
    $('input').data('promptPosition','topLeft');
    
    document.cookie = "accountType=${accountType}" + cookieExp;
    var accountEmail = $.util.getCookie("adminEmail");
    var isRemember = $.util.getCookie("adminRemember");
    if (isRemember == 'true') {
        $("#email").val(accountEmail);
        $("#pwd").focus();
        $("#chkRememberUsername").attr("checked","checked"); 
    } else {
        $("#email").val('');
        $("#email").focus();
        $("#chkRememberUsername").removeAttr("checked"); 
    }
    
    $("#frm").bind("keydown", function(e) {
        if (e.keyCode == 13) {
            login();
        }
    });
});

function login(o) {
    var email = $("#email").val();
    $("#email").val(email);
    
    var pwd = $("#pwd").val();
    $("#pwd").val(pwd);
    
    $("#loginBtn").val("登录中...").attr("disabled", "disabled");
    
    $.ajax({
        url:'${ctxPath}/app/doLogin',
        type:'post',
        async:false, 
        dataType:'json', 
        cache:false,
        data: {
            'email':email,
            'pwd':pwd
        },
        success: function(data) {
            if (data.code == 0) {
                var d = "adminEmail=" + $("#email").val() + cookieExp;
                document.cookie = d;
                var backUrl = '${param.back_url}';
                top.location.href = (backUrl==''?'${ctxPath}/app/home':backUrl);
            } else {
                document.cookie = "JSESSIONID=" + data.data;
                showLoginErr(data.code, data.desc);
            }
        }, // end success
        complete: function() {
            $("#loginBtn").val("登录").removeAttr("disabled");
        }
    }); // end ajax
}

function showLoginErr(code, err) {
    // clear errors
    $("#valiEmail, #valiPwd").html('');
    
    // password error
    if (code > 12) {
        $("#valiPwd").html(err);
    } else {
        $("#valiEmail").html(err);
    }
}

function clickRemember() {
    if($("#chkRememberUsername").is(":checked")){
        document.cookie="adminRemember=true" + cookieExp;
    } else {
        document.cookie="adminRemember=false" + cookieExp;
    }
}
//-->
</script>
<div class="main">
<div class="login">
    <div class="login-box">
        <div class="login-hd"><h2>登录管理中心</h2><span class="msg-c"></span></div>
        <br>
        
        <div class="login-bd">
            <form method="post" id="frm">
            <input type="hidden" name="accountType" value="${accountType}"/>
                <div id="loginNameDiv" class="field">
                    <label for="email">账号或手机号码</label>
                    <input type="text" class="txt" tabindex="1" id="email" name="email" style="color: gray;" class="txt" maxlength="50" onfocus="this.select()">
                    <div id="valiEmail" class="login-err"></div>
                </div>
                
                <div id="loginPasswordDiv" class="field">
                    <label for="pwd">密码</label>
                    <a class="action" href="#">忘记密码?</a>
                    <input type="password" name="pwd" id="pwd" autocomplete="off" class="txt" maxlength="20" tabindex="2" onfocus="this.select()">
                    <div id="valiPwd" class="login-err"></div>
                </div>
                
                <div class="remember">
                    <input type="checkbox"  value="1" class="ckbx" onclick="clickRemember();" tabindex="4" id="chkRememberUsername"><label for="chkRememberUsername">记住我的账号</label>
                </div>
                
                <div class="actions">
                    <p class="btn-submit-warp"><input id="loginBtn" type="button" class="btn-submit" value="登录" tabindex="6" onclick="login(this)"></p>
                </div>
            </form>
        </div>
    </div>
</div>
</div>
