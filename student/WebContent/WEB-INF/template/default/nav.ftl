<div class="nav">
    <div id="main_navigate_div"><#rt/>
<ul>
    <li class="nav-btn">
        <a href="${bean.params.contextPath}/app/home">
            <img src="${bean.params.contextPath}/images/home.png" />
        </a>
    </li>
    <li class="nav-btn" onclick="return $.util.showPopBlock(event,this,{o:$('#favo-menu-icon'),l:2}, {o:$('#favo-menu-list'),l:2, t:$('#favo-menu-icon').height()+2})">
        <img src="${bean.params.contextPath}/images/favo.png" />
    </li>
    <li class="nav-btn" onclick="return $.util.showPopBlock(event,this,{o:$('#menu-icon'),l:2},{o:$('#menu-list'), l:2, t:$('#menu-icon').height() + 2})">
        <img src="${bean.params.contextPath}/images/menu.png" />
    </li>
</ul>
</div><#rt/>
<div id="menu-icon" class="pop-menu-icon poped">
    <img src="${bean.params.contextPath}/images/menu.png">
</div>
<div id="menu-list" class="pop-menu-list poped shadow">
<#if bean.menuHtml??>
${bean.menuHtml}
</#if>
</div>

<ul><#rt/>
    <li class="nav-line">&nbsp;</li><#rt/>
    <li class="path">
        <#if bean.navNodes??>
        <#list bean.navNodes as nav>
        <#if nav_index == bean.navNodes?size - 1>
            ${nav.menuLabel}<#rt/>
        <#elseif nav_index == 0>
            ${nav.menuLabel} »<#rt/>
        <#else>
            <#if nav.url??>
                <a href="${nav.url}">${nav.menuLabel}</a> »<#rt/>
            <#else>
                ${nav.menuLabel} »<#rt/>
            </#if>
        </#if>
        </#list>
</#if>
    </li><#rt/></ul>
</ul>
</div>

<script type="text/javascript">
$(document).ready(function(){
    var $menuList = $("#menu-list");
    var zIndex_menuList = $menuList.css("z-index");

    $("#menu-list li").each(function(){
        var $this = $(this);
        var level = $this.attr("level");
        var zIndex = (parseInt(level))+1+parseInt(99);
        $this.closest("ul").css({"position":"relative","zIndex":zIndex});
    });

    $("#menu-list li").hover(function (){
        var $this = $(this);
        var left = $this.width();
        var top = -$this.height()-2;
        
        if($this.find("ul")){
            var $subUl = $this.find("ul:eq(0)");
            $subUl.css({display: "block", left: left, top:top});
        }
    }, function () {
        var $this = $(this);
        var $subUl = $this.find("ul:eq(0)");
        $subUl.hide();
    });
});
</script>