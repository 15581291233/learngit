<%@ page pageEncoding="UTF-8" %><br/>
<div class="nav"><a href="${ctxPath}/app/home">首页</a> -&gt; 系统错误</div>
<div class="cnt-bd">
    <c:if test="${param['code']=='200'}">
    没有权限访问该功能！
    </c:if>
    
    <c:if test="${param['code']!='200'}">
    未知错误，请联系系统管理员！
    </c:if>
</div>
