<#if bean.label??>
    ${bean.label} <#rt/>
</#if>

<input type="text" onfocus="this.select()"<#rt/>
 name="${bean.name?default("")?html}" <#rt/>
<#if bean.maxlength??>
 maxlength="${bean.maxlength?html}"<#rt/>
</#if>
<#if bean.nameValue??>
 value="${bean.nameValue}"<#rt/>
</#if>
<#if bean.disabled?? && bean.disabled=="true">
 disabled="disabled"<#rt/>
</#if>
<#if bean.id??>
 id="${bean.id?html}"<#rt/>
</#if>
<#if bean.title??>
 title="${bean.title?html}"<#rt/>
</#if>
<#if bean.format??>
 format="${bean.format?html}"<#rt/>
</#if>

<#if bean.diffYear??>
 diffYear="${bean.diffYear?html}"<#rt/>
</#if>
<#if bean.diffMonth??>
 diffMonth="${bean.diffMonth?html}"<#rt/>
</#if>
<#if bean.diffDay??>
 diffDay="${bean.diffDay?html}"<#rt/>
</#if>

<#if bean.validate??>
  class="validate[${bean.validate}] cal" <#rt/>
<#else>
  class="cal"<#rt/>
</#if>
<#if bean.value??>
  value="${bean.value}" <#rt/>
</#if>
 calendar="calendar" readonly="readonly"<#rt/>
/><script type="text/javascript">$("#${bean.id}").datepicker();</script><#rt/>