<#assign map=bean.hiddenRequestMap />
<#list map?keys as nameKey>
    <input type="hidden" name="${nameKey}" value="${map[nameKey]}" /> <#rt/>
</#list>
