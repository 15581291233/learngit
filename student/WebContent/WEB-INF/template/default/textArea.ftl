<#if bean.label??>
   ${bean.label}<#rt/> 
</#if>
<textarea onfocus="$(this).select();
<#if bean.onfocus??>
${bean.onfocus} <#rt/>
</#if>
" <#rt/>
<#if bean.name??>
  name="${bean.name}"<#rt/>
</#if>
<#if bean.maxlength??>
  maxLength="${bean.maxlength?html}"<#rt/>
</#if>
<#if bean.disabled?? && disabled=="true">
  disabled="disabled" <#rt/>
</#if>
 class=" <#rt/>
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
  id="${bean.id?html}"<#rt/>
</#if>
<#if bean.title??>
 title="${bean.title}"<#rt/>
</#if>

<#if bean.cssStyle??>
  style="${bean.cssStyle}"<#rt/>
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
  onmmouseout="${bean.onmouseout}" <#rt/>
</#if>

><#rt/>
<#if bean.value??>
${bean.value}<#rt/>
</#if>
</textarea> <#rt/>
