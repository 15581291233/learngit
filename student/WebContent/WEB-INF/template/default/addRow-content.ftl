<tr class="<#if (data?size)%2=0>odd<#else>even</#if>"><#rt/>
	<td colspan="${cols?size+1}">
		<input type="text" id="${bean.id}_newRow" <#if addRow.cssClass??> class="${addRow.cssClass}" </#if> style="width:180px;"/>
		<input type="hidden" id="${bean.id}_pk_hide"/> 
	</td><#rt/>
</tr><#rt/>

<script type="text/javascript">
    $("document").ready(function(){
        var opts = {
            urlOrData:"${addRow.urlOrData}",
			<#if addRow.propertyMapping??>
				propertyMapping:${addRow.propertyMapping},
			</#if>
            labelProp:"${addRow.labelProp}",
			<#if addRow.reloadUrl??>
				reloadUrl:"${bean.params.contextPath}/${addRow.reloadUrl}",
			</#if>
            inputId:"${bean.id}_newRow",
            repeatTip:"${addRow.repeatTip}",
            tableId:"${bean.id}"
			<#if addRow.addToSelector>
			,addToSelector:true
			<#else>
			,addToSelector:false
			</#if>
			,reloadMethod:${bean.id}_reload
			<#if addRow.beforeAdd??>
			,beforeAdd:${addRow.beforeAdd}
			</#if>
			<#if addRow.beforeChange??>
			,beforeChange:${addRow.beforeChange}
			</#if>
            <#if addRow.afterAdd??>
            ,afterAdd:${addRow.afterAdd}
            </#if>
            <#if addRow.afterChange??>
            ,afterChange:${addRow.afterChange}
            </#if>
        };

        $("#${bean.id}_newRow").addRow(opts);
});
	
</script>