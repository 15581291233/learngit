
<input id='${bean.id}_autocomplete'

<#if bean.cssClass??>
  class="${bean.cssClass}" <#rt/>
</#if>

<#if bean.cssStyle??>
  style="${bean.cssStyle}" <#rt/>
</#if>
/> <#rt/>

<script language='javascript'>
$().ready(function(){
    $('#${bean.id}_autocomplete').autocomplete(
	<#if bean.isAjax>
		"${bean.urlOrData}"
    <#else>
		${bean.urlOrData}
	</#if>
	,{
		id:'${bean.id}' <#rt/>
	<#if bean.minChars??>
		,minChars:${bean.minChars} <#rt/>
	</#if>
	<#if bean.width??>
		,width: ${bean.width} <#rt/>
	</#if>
	<#if bean.max??>
		,max:${bean.max} <#rt/>
	</#if>
	<#if bean.delay??>
		,max:${bean.delay} <#rt/>
	</#if>
	<#if bean.autoFill?? && bean.autoFill=="true">
		,autoFill:true
	<#else>
		,autoFill:false
	</#if>
	<#if bean.mustMatch?? && bean.mustMatch=="true">
		,mustMatch:true <#rt/>
	<#else>
		,mustMatch:false <#rt/>
	</#if>
	<#if bean.matchContains?? && bean.matchContains=="true" >
		,matchContains:true <#rt/>
	<#else>
		,matchContains:false <#rt/>
	</#if>
	<#if bean.selectFirst?? && bean.selectFirst == "true">
		,selectFirst:true <#rt/>
	<#else>
		,selectFirst:false <#rt/>
	</#if>
	<#if bean.cacheLength??>
		,cacheLength:${bean.cacheLength}  <#rt/>
	<#else>
		,cacheLength:10 <#rt/>
	</#if>
	<#if bean.matchCase?? && bean.matchCase == "true"> 
		,matchCase:true <#rt/>
	<#else>
		,matchCase:false <#rt/>
	</#if>
	<#if bean.multiple?? && bean.multiple == "true">
		,multiple:true <#rt/>
	<#else>
		,multiple:false <#rt/>
	</#if>
	<#if bean.multipleSeparator??>
		,multipleSeparator:${bean.multipleSeparator} <#rt/>
	<#else>
		,multipleSeparator:"," <#rt/>
	</#if>
	<#if bean.scroll?? && bean.scroll == "true">
		,scroll :true <#rt/>
	<#else>
		,scroll : false <#rt/>
	</#if>
	<#if bean.scrollHeight??>
		,scrollHeight:${bean.scrollHeight}<#rt/>
	</#if>	
	<#if bean.extraParams??>
		,extraParams :${bean.extraParams}<#rt/>
	</#if>
	<#if bean.result??>
		,result:${bean.result}<#rt/>
	</#if>
	<#if bean.max??>
		,max:${bean.max}<#rt/>
	</#if>
	<#if bean.max??>
		,max:${bean.max}<#rt/>
	</#if>
    <#if bean.matchProperty??>
        ,matchProperty:"${bean.matchProperty}"
    </#if>
    <#if bean.hideProperty??>
    	,hideProperty:"${bean.hideProperty}"
    </#if>

	<#if bean.formatItem??>
		,formatItem : function(row,i,max){
			return ${bean.formatItem}(row,i,max);
		}<#rt/>
	<#elseif bean.matchProperty??>
		,formatItem : function(row,i,max){
			return row["${bean.matchProperty}"];
		}<#rt/>
	</#if>
	<#if bean.formatResult??>
		,formatResult : function(row,i,max){
			return ${bean.formatResult}(row,i,max);
		}<#rt/>
	<#elseif bean.matchProperty??>
		,formatResult : function(row,i,max){		
			return row["${bean.matchProperty}"];
		}<#rt/>
	</#if>
	<#if bean.formatMatch ??>
		,formatMatch : function(row){
			return ${bean.formatMatch}(row);
		}<#rt/>
	<#elseif bean.matchProperty??>
		,formatMatch:function(row){
			return row["${bean.matchProperty}"];
		}<#rt/>
	</#if>

	<#if bean.name??>
		,name:"${bean.name}" <#rt/>
    </#if>

    <#if bean.value??>
        ,value:"${bean.value}" <#rt/>
    </#if>
   
	<#if bean.displayValue??>
		,displayValue:"${bean.displayValue}"<#rt/>
	</#if>

	<#if bean.displayName??>
		,displayName:"${bean.displayName}"<#rt/>
	</#if>

	<#if bean.allowRepeat?? && bean.allowRepeat=="true">
		,allowRepeat:true
	<#else>
		,allowRepeat:false
	</#if>
    <#if bean.disabled?? && bean.disabled=="true">
        ,disabled:true
    <#else>
        ,disabled:false
    </#if>
    <#if bean.readonly?? && bean.readonly=="true">
        ,readonly:true
    <#else>
        ,readonly:false
    </#if>
	});
});
</script>