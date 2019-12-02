</div>
<script type="text/javascript">
var dialog = $("#${bean.id}").dialog({
<#if bean.autoOpen?? && bean.autoOpen == "true">
autoOpen:true<#rt/>
<#else>
autoOpen:false<#rt/>
</#if>
<#if bean.appendTo??>
,appendTo:${bean.appendTo}<#rt/>
</#if>
<#if bean.closeOnEscape?? && bean.closeOnEscape == "true">
,closeOnEscape:true<#rt/>
<#else>
,closeOnEscape:false<#rt/>
</#if>
<#if bean.closeText??>
,closeText:${bean.closeText}<#rt/>
</#if>
<#if bean.dialogClass??>
,dialogClass:${bean.dialogClass}<#rt/>
</#if>
<#if bean.draggable?? && bean.draggable == "true">
,draggable:true<#rt/>
<#else>
,draggable:false<#rt/>
</#if>
<#if bean.height??>
,height:${bean.height}<#rt/>
</#if>
<#if bean.hide??>
,hide:"${bean.hide}"<#rt/>
</#if>
<#if bean.maxHeight??>
,maxHeight:${bean.maxHeight}<#rt/>
</#if>
<#if bean.maxWidth??>
,maxWidth:${bean.maxWidth}<#rt/>
</#if>
<#if bean.minHeight??>
,minHeight:${bean.minHeight}<#rt/>
</#if>
<#if bean.minWidth??>
,minWidth:${bean.minWidth}<#rt/>
</#if>
<#if bean.modal?? && bean.modal == "true">
,modal:true<#rt/>
<#else>
,modal:false<#rt/>
</#if>
<#if bean.position??>
,position:${bean.position}<#rt/>
</#if>
<#if bean.resizable?? && bean.resizable == "true">
,resizable:true<#rt/>
<#else>
,resizable:false<#rt/>
</#if>
<#if bean.show??>
,show:"${bean.show}"<#rt/>
</#if>
<#if bean.title??>
,title:"${bean.title}"<#rt/>
</#if>
<#if bean.width??>
,width:${bean.width}<#rt/>
</#if>
<#if bean.beforeClose??>
,beforeClose:${bean.beforeClose}<#rt/>
</#if>
<#if bean.close??>
,close:function(event, ui){
    $.data($("#test")[0],"dialog",$(this));
}<#rt/>
</#if>
<#if bean.create??>
,create:${bean.create}<#rt/>
</#if>
<#if bean.drag??>
,drag:${bean.drag}<#rt/>
</#if>
<#if bean.dragStart??>
,dragStart:${bean.bdragStart}<#rt/>
</#if>
<#if bean.dragStop??>
,dragStop:${bean.dragStop}<#rt/>
</#if>
<#if bean.focus??>
,focus:${bean.focus}<#rt/>
</#if>
<#if bean.url??>
,open:function(ev, ui) {<#rt/>
<#if bean.iframeId??>
    $("#${bean.iframeId}").attr("src","${bean.url}");<#rt/>
<#else>
    $(this).load("${bean.url}",{oid:'1'}); <#rt/>
</#if>
}<#rt/>
</#if>

<#if bean.resize??>
,resize:${bean.resize}<#rt/>
</#if>
<#if bean.resizeStart??>
,resizeStart:${bean.resizeStart}<#rt/>
</#if>
<#if bean.resizeStop??>
,resizeStop:${bean.resizeStop}<#rt/>
</#if>
});

var dialogMap = {"${bean.id}":dialog};

</script>