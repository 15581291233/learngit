<select<#rt/>
 name="${bean.name?default("")?html}"<#rt/>
<#if bean.disabled?? && bean.disabled=='true'>
 disabled="true"<#rt/>
</#if>
<#if bean.id??>
 id="${bean.id?html}"<#rt/>
</#if>
<#if bean.readonly?? && bean.readonly?string == "true">
 disabled="true"
</#if>
<#if bean.title??>
 title="${bean.title?html}"<#rt/>
</#if>
class="
<#if bean.validate??>
 validate[${bean.validate}] <#rt/>
</#if>
<#if bean.cssClass??>
  ${bean.cssClass} <#rt/>
</#if>
"<#rt/>
<#if bean.multiple?default(false)>
  multiple="multiple"<#rt/>
</#if>
<#if bean.cssStyle??>
  style="${bean.cssStyle}" <#rt/>
</#if>
<#if bean.onclick??>
  onclick="${bean.onclick}" <#rt/>
</#if>
<#if bean.onchange??>
  onchange="${bean.onchange}" <#rt/>
</#if>
<#if bean.onfocus??>
  onfocus="${bean.onfocus}" <#rt/>
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
>
<#if bean.collection?exists>
<#if bean.tip??>
  <option value="">${bean.tip}</option> <#rt/>
</#if>
<#list bean.collection as each>
<#assign optValue=bean.getValue(each,'${bean.listKey}')>
<#assign optLabel=bean.getValue(each,'${bean.listValue}')>
  <option value="${optValue}" <#rt/>
<#if bean.selectedIndex?? && (bean.selectedIndex?number < bean.collection?size && bean.selectedIndex?number > -1)>
   <#if bean.selectedIndex == ""+each_index>
     selected <#rt/>
   </#if>
<#else>
  <#if bean.value?? && bean.value==optValue>
   selected <#rt/>
  </#if>
</#if>
>${optLabel}</option> <#rt/>
</#list>
<#else>
    <option value="">${bean.noDataTip}</option> <#rt/>
</#if>
</select><#rt/>
<#if bean.readonly?? && bean.readonly?string == "true">
 <input type="hidden" name="${bean.name}" <#rt/>
<#if bean.value??>
 value="${bean.value}"<#rt/>
</#if>
/>
</#if>

