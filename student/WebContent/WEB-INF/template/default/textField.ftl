<input type="text" onfocus="$(this).select()
<#if bean.onfocus??>
;${bean.onfocus}
</#if>

"<#rt/>
 name="${bean.name?default("")?html}"<#rt/>
<#if bean.value??>
 value="${bean.value?html}"<#rt/>
</#if>
 class="ipt <#rt/>
<#if bean.cssClass??>
${bean.cssClass} <#rt/>
</#if>

<#if bean.validate??>
 validate[${bean.validate}] <#rt/>
</#if>
<#if bean.readonly?? && bean.readonly=="true">
 readonly <#rt/>
</#if>
"
<#if bean.readonly?? && bean.readonly=="true">
 readonly="readonly" <#rt/>
</#if>

<#if bean.id??>
 id="${bean.id}" <#rt/>
</#if>

<#if bean.maxlength??>
 maxlength="${bean.maxlength}" <#rt/>
</#if>
<#if bean.cssStyle??>
  style="${bean.cssStyle}" <#rt/>
</#if>
<#if bean.disabled?? && bean.disabled=="true">
  disabled="true" <#rt/>
</#if>

<#if bean.onclick??>
  onclick="${bean.onclick}" <#rt/>
</#if>

<#if bean.onchange??>
  onchange="${bean.onchange}" <#rt/>
</#if>

<#if bean.onblur??>
  onblur="${bean.onblur}" <#rt/>
</#if>

<#if bean.onkeydown??>
  onkeydown="${bean.onkeydown}" <#rt/>
</#if>

<#if bean.onkeyup??>
  onkeyup="${bean.onkeyup}" <#rt/>
</#if>

<#if bean.onmouseover??>
  onmouseover="${bean.onmouseover}" <#rt/>
</#if>

<#if bean.onmouseout??>
  onmouseout="${bean.onmouseout}" <#rt/>
</#if>
/> <#rt/>
 