<%@page pageEncoding="UTF-8" %>
<div class="header">
    <div class="banner"></div>
    <c:if test="${auskey!=null}">
    <div id="welcome" class="welcome"><span>欢迎, ${auskey.userId}!</span>[<a href="javascript:if(confirm('确认退出亿企管家管理中心？')){location.href='${ctxPath}/app/logout';}">退出</a>]</div>
    </c:if>
</div>