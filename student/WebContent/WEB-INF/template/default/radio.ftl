<#if bean.collection?exists>
<#list bean.collection as each>
<#assign itemValue=bean.getValue(each,'${bean.listKey}') />
<#assign itemLabel=bean.getValue(each,'${bean.listValue}') />
<#assign checkedFlag=bean.value?default("")==itemValue>
<label><#rt/> 
<input type="radio" name="${bean.name}" <#rt/>
  value="${itemValue}" <#rt/>
<#if checkedFlag>
  checked="true"<#rt/> 
</#if>
<#if bean.disabled?? && bean.disabled?string == "true">
  disabled="true"<#rt/>
</#if>
<#if bean.readonly?? && bean.readonly?string =="true">
  readonly="readonly"<#rt/>
</#if>
 />${itemLabel} <#rt/> 
</label> <#rt/>
<#if bean.readonly?? && bean.readonly?string =="true" && checkedFlag>
  <input type="hidden" value="${itemValue}" 
<#if bean.name??>
  name="${bean.name}" <#rt/>
</#if>
</#if>
</#list>
</#if>
