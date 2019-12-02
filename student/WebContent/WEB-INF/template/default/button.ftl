<#if bean.hasRight>
<li <#rt/>
<#if bean.id??>
 id="${bean.id}" <#rt/>
</#if>
 class="btn <#rt/>
<#if bean.disabled?? && bean.disabled=="true">
 btnDisabled" disable="true"<#rt/>
<#else>
"<#rt/>
</#if>
 onmouseover="$.util.hover(event)" <#rt/> 
 onmouseout="$.util.hover(event)" <#rt/>
<#if bean.btnValidate?default(false)=true>
 validate="true"<#rt/>
</#if>
><a class="${bean.icon?default("noIconBtn")}" <#rt/> 
<#if bean.onclick??>
 onclick="$.util.click(event,{callback:${bean.onclick}})" <#rt/>
</#if>
><span>${bean.label?default("")}</span></a></li><#rt/>
<#if bean.appendLine?default(false)=true>
<li class="line">line</li><#rt/>
</#if>
</#if>