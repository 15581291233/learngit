<div
<#if bean.id??>
 id="${bean.id}"
</#if>
 class="
<#if bean.forTab?? && bean.forTab?string=="true">
tab-bd<#rt/>
<#else>
bd<#rt/>
</#if>
">