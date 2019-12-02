<div 
<#if bean.id??>
 id="${bean.id}"
</#if>
 class=
<#if bean.forTab?? && bean.forTab?string=="true">
"tabs-hd"<#rt/>
<#else>
"hd inner rad"<#rt/>
</#if>
><#rt/>
<#if bean.outputUl?? && bean.outputUl?string=="true">
<ul class="toolBar">
</#if>