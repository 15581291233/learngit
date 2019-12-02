<#if bean.collection??>
<#list bean.collection as each>
<#assign itemKey=bean.getValue(each,'${bean.listKey}') />
<#assign itemValue=bean.getValue(each,'${bean.listValue}') />

<#assign checkedFlag=false>
<#if bean.valueArray??>
    <#list bean.valueArray as sltValue>
        <#assign checkedFlag = (sltValue==itemKey)>
        <#if checkedFlag>
            <#break>
        </#if>
    </#list>
</#if>

<label>
<input type="checkbox" <#rt/>
  value="${itemKey}" <#rt/>
<#if bean.name??>
  name="${bean.name}" <#rt/>
</#if>
<#if bean.readonly?? && bean.readonly == "true">
  disabled="true"<#rt/>
</#if>
<#if bean.disabled?? && bean.disabled == "true">
  disabled="true"<#rt/>
</#if>
<#if bean.id??>
 id="${bean.id}" <#rt/>
</#if>
<#if checkedFlag>
 checked="true" <#rt/>
</#if>
 />${itemValue} <#rt/>
</label> <#rt/>
<#if bean.readonly?? && bean.readonly =="true" && checkedFlag>
  <input type="hidden" value="${itemKey}" 
<#if bean.name??>
  name="${bean.name}" <#rt/>
</#if>
 />
</#if>
</#list>
</#if>
