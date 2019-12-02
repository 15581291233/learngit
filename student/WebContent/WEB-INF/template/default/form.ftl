<#if (bean.validate)?? && bean.validate?string =="true">
<#assign ctx=bean.contextPath/>
<link rel='stylesheet' type='text/css' href='${ctx}/theme/validationEngine.jquery.css' />
<script src="${ctx}/js/jquery/plugins/jquery.validationEngine.js" type="text/javascript"></script>
<script src="${ctx}/js/jquery/plugins/jquery.validationEngine-rules.js" type="text/javascript"></script>
<script type="text/javascript">
$(document).ready(function(){

<#if bean.focusId??>
    $("#${bean.focusId}").focus(); <#rt/>
</#if>

    setTimeout(function(){      
      initValidationEngine("${bean.id?html}");
    },500);
});
</script>
</#if>

<form<#rt/>
<#if bean.prefix??>
 prefix="${bean.prefix?html}"<#rt/>
</#if>


<#if (bean.validate)?? && bean.validate?string =="true">
  validate="true" <#rt/>
</#if>

<#if bean.id??>
 id="${bean.id?html}"<#rt/>
</#if>
<#if bean.name??>
 name="${bean.name?html}"<#rt/>
</#if>
<#if bean.onsubmit??>
 onsubmit="${bean.onsubmit?html}"<#rt/>
</#if>
<#if bean.onkeydown??>
 onkeydown="submitForm(this, event, ${bean.onkeydown})"<#rt/>
</#if>
<#if bean.onreset??>
 onreset="${bean.onreset?html}"<#rt/>
</#if>
<#if bean.action??>
 action="${bean.action?html}"<#rt/>
</#if>
<#if bean.target??>
 target="${bean.target?html}"<#rt/>
</#if>
<#if bean.method??>
 method="${bean.method?html}"<#rt/>
<#else>
 method="post"<#rt/>
</#if>
<#if bean.enctype??>
 enctype="${bean.enctype?html}"<#rt/>
</#if>
<#if bean.title??>
 title="${bean.title?html}"<#rt/>
</#if>
<#if bean.onreset??>
 onreset="${bean.onreset?html}"<#rt/>
</#if>
><#rt/>