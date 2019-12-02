<script type="text/javascript" src="${bean.params.contextPath}/js/sjs/sjs.dg.js?20141226"></script>
<#setting number_format="#">

<#-- define variables -->
<#assign i18n=bean.params.i18n![] />
<#assign chkType=bean.chkType />
<#assign pk=bean.pk />
<#assign pi=bean.pl />
<#assign data=bean.dataList![] />
<#assign cols=bean.cols />
<#assign orderBy=pi.orderBy />

<#if bean.addRow??>
	<#assign addRow=bean.addRow />
</#if>

<#-- output content begin -->
<div id="${bean.id}" class="grid-tab-wrapper"<#if bean.style??> style="${bean.style}"</#if>>
<table id='${bean.id}_tab' class='grid-tab' cellpadding='0' style='width:<#if bean.fixed>100%<#else>${bean.resolution}px</#if>' cellspacing='1'><#rt/>

<#-- prepare table header -->
<#assign header="<thead><tr>" />
<#assign qbe="" />

<#if chkType=1>

<#if bean.selectorEnabled && bean.selectorSelectAll>
<#assign header=header+"<th class='sltcol'><img title='${bean.i18n('lbl.dg.selectAll')}' src='${bean.params.contextPath}/images/add_all.png'" />
<#assign header=header+" onclick=\"$.rs.selectAll(this, '${bean.id}');\" /></th>" />
<#else>
<#assign header=header+"<th class='sltcol'>&nbsp;</th>" />
</#if>

</#if>

<#if chkType=2>
<#assign header=header+"<th class='sltcol'><input type='checkbox' class='chk-all' id='${bean.id}_cb'" />
<#assign header=header+" onclick=\"$.dg.checkAll(this, '${bean.id}', '${bean.chkName}', ${data?size});" />
<#if bean.onChkAll??><#assign header=header+"${bean.onChkAll}" /></#if>
<#assign header=header+"\" /></th>" />
</#if>
<#list cols as col>
<#assign header=header+"<th name='${col.name}'" />
<#if col.width??>
<#assign header=header+" width='${col.width}'" />
</#if>
<#if col.hdAttr??>
<#assign header=header+" ${col.hdAttr}" />
</#if>
<#assign header=header+">" />
<#if col.name?? && col.sortable=true && data?size!=0>
<#assign so=col.getSortOrder(pi.sortName![], pi.sortOrder![], col.name) />
<#assign header=header+"<span onmouseover=\"$.dg.sortHover(this, 0,'${so[1]}')\"" />
<#assign header=header+" onmouseout=\"$.dg.sortHover(this, 1,'${so[1]}')\"" />
<#assign header=header+" onclick=\"${bean.sortHandler!'$.dg.sort'}(this, '${bean.id}', '${col.name}','${so[1]}')\"" />
<#assign header=header+" class='sort" />
<#if so[1]='desc'>
<#assign header=header+" sort-asc" />
<#elseif so[1]=''>
<#assign header=header+" sort-desc" />
</#if>
<#assign header=header+"'> ${col.label!' '}</span>" />
<#if so[0]!=''>
<#assign header=header+"<span class='sort-seq'>(${so[0]})</span>" />
</#if>
<#else>
<#assign header=header+"${col.label!' '}"/>
</#if>
<#assign header=header+"</th>" />
</#list>
<#assign header=header+"</tr></thead>" />
${header}<#rt/>

<tbody><#rt/>

<#-- prepare table QBE -->
<#if bean.showQbe!false=true>
<#assign qbe=qbe+"<tr class='qbe'>" />
<#if chkType=1 || chkType=2>
<#assign qbe=qbe+"<td>&nbsp;</td>" />
</#if>
<#assign qo=pi.qo!{} />
<#list cols as col>
<#assign qbe=qbe+"<td>" />
<#if col.qbe??>
<#if col.qbe='select'>
<#assign qbe=qbe+"<select  name='${bean.id}.${col.name}' id='${bean.id}_${col.name}'" />

<#if col.width??>
<#assign qbe=qbe+" style='width:" />
<#if col.width?index_of('%') lt 0>
<#assign qbe=qbe+"${col.width?number-5}px" />
<#else>
<#assign qbe=qbe+"${col.width}" />
</#if>
<#assign qbe=qbe+"'" />
</#if>

<#assign qbe=qbe+" onchange=\"${bean.loadHandler!'$.dg.loadData'}(this)\">" />
<#assign qbe=qbe+"<option value=''>${col.getProp('msg.promptAll')}</option>" />
<#if col.udcList??>
<#list col.udcList as udc>

<#assign qbe=qbe+"<option title=\"${udc.udcValueDesc?xhtml}\" value='${udc.udcValue}'" />
<#assign val=qo[col.name]!'' />
<#if val?string=udc.udcValue>
<#assign qbe=qbe+" selected='true' "/>
</#if>
<#assign qbe=qbe+">${udc.udcValueDesc}</option>" />
</#list>
</#if>
<#assign qbe=qbe+"</select>" />
<#else>
<#assign qbe=qbe+"<input type='text' id='${bean.id}_${col.name}' onfocus='this.select()' maxlength='100'" />
<#if col.width??>
<#assign qbe=qbe+" style='width:"/>
<#if col.width?index_of('%') lt 0>
<#assign qbe=qbe+"${col.width?number-5}px" />
<#else>
<#assign qbe=qbe+"${col.width}" />
</#if>
<#assign qbe=qbe+"'" />
</#if>

<#if col.qbe='daterange'>
<#assign qbe=qbe+" readonly='readonly' class='validate[funcCall[$.util.validateDate]] cal' onclick=\"$.util.selectDate('Select Date', '${bean.id}_${col.name}')\""/>
</#if>
<#if col.qbe='date'>
<#assign qbe=qbe+" readonly='readonly' class='validate[funcCall[$.util.validateDate]] cal' calendar='calendar'" />
</#if>
<#assign qbe=qbe+" name='${bean.id}.${col.name}' id='${bean.id}_${col.name}' value='${col.getQbeValue()}' />" />
</#if>
<#if col.qbe='date'>
<#assign qbe=qbe+"<script type='text/javascript'>$('#${bean.id}_${col.name}').datepicker({});</script>" />
</#if>
<#else>
<#if col.readonlyQbe>
<#assign qbe=qbe+"<input type='text' readonly='readonly' class='readonly' maxlength='100'" />
<#if col.width??>
<#assign qbe=qbe+" style='width:" />
<#if col.width?index_of('%') lt 0>
<#assign qbe=qbe+"${col.width?number-5}px"/>
<#else>
<#assign qbe=qbe+"${col.width}"/>
</#if>
<#assign qbe=qbe+"'" />
</#if>
<#assign qbe=qbe+" />" />
<#else>
<#assign qbe=qbe+"&nbsp;" />
</#if>
</#if>
<#assign qbe=qbe+"</td>"/>
</#list>
<#assign qbe=qbe+"</tr>" />
</#if>

<#-- output table body -->
${qbe}
<#if data?size=0>
<tr class='odd nodata'><td colspan='<#if chkType=1||chkType=2>${cols?size+1}<#else>${cols?size}</#if>'>${i18n.noMsg}</td></tr><#rt/>
</#if>
<#list data as row>
<#assign selected=bean.getSelected(row[pk]!'') />
<tr class="<#rt/>
<#if row_index%2=0>odd<#else>even</#if><#if selected!false> row-selector-selected</#if><#rt/>
"<#rt/>
<#if bean.selectorEnabled>
 title="${bean.i18n('lbl.dg.dblclick')}" ondblclick="$.rs.click(this, '${bean.id}', '${row[pk]!''}', '${cols[0].getValue(row, bean.selectorRowContent!'')}')"
</#if>
<#if bean.genPk!false=true> id="${bean.id}_${row[pk]!''}"</#if><#rt/>
<#if bean.rowData??> rowdata="${cols[0].getValue(row,bean.rowData,true,true)}"</#if><#rt/>
<#if bean.rowClick??> onclick="${cols[0].getValue(row,bean.rowClick,true,true)}"</#if><#rt/>
><#rt/>
<#if chkType=1><td class="sltcol"><input type="radio" name="${bean.chkName}"<#rt/>
 onclick="$.dg.updChkedRows(this, '${bean.id}', ${chkType}, ${data?size});<#if bean.onRowChked??>${cols[0].getValue(row, bean.onRowChked, false,false)}</#if>" value="${row[pk]!''}" /></td></#if><#rt/>
<#if chkType=2><td class="sltcol"><input type="checkbox" name="${bean.chkName}"<#rt/>
 onclick="$.dg.updChkedRows(this, '${bean.id}', ${chkType}, ${data?size});<#if bean.onRowChked??>${cols[0].getValue(row, bean.onRowChked, false,false)}</#if>" value="${row[pk]!''}" /></td></#if><#rt/>
<#list cols as col>
<#if col.bodyContent??>
<#assign val=col.getValue(row,col.bodyContent)/>
<#else>
<#if col.udcList??>
<#assign val=col.convertUdc(row[col.name])/>
<#else>
<#assign val=col.format(row[col.name])/>
</#if>
</#if>
<td<#rt/>
<#if col.align??> align="${col.align}"</#if><#rt/>
<#if col.bdAttr??> ${col.getValue(row, col.bdAttr)}</#if><#rt/>
<#if col.title!false=true> title="${val?replace('"','&quot;')}"</#if><#rt/>
><#rt/>
${val}<#rt/>
</td><#rt/>
</#list>
</tr>
</#list>

<#if addRow??>
	<#include "addRow-content.ftl">
</#if>

</tbody></table>
</div>

<#-- output fload table header -->
<div id="${bean.id}_hf" pid="${bean.id}" class="grid-tab-hf"><table class='grid-tab grid-tab-f' cellpadding='0' cellspacing='1'>${header}<tbody>${qbe}</tbody></table></div>

<#-- output float pagination -->
<#if pi.paging>
<#lt/><input type="hidden" id="${bean.id}_sn" name="${bean.id}.sortName" value="<@array2String a=pi.sortName![] />" />
<input type="hidden" id="${bean.id}_so" name="${bean.id}.sortOrder" value="<@array2String a=pi.sortOrder![] />" />
<#if bean.chgPs!true=true>
<#assign pager="<select id='${bean.id}_ps' name='${bean.id}.pageSize' onchange=\"${bean.loadHandler!'$.dg.loadData'}(this, '${bean.id}', $(this).val(), ${pi.currentPage})\">"/>
<#list bean.params.pages as p>
<#assign pager=pager+"<option value='${p}'"/>
<#if p=pi.pageSize?c><#assign pager=pager+" selected=\'true\'"/></#if>
<#assign pager=pager+">${p}</option>" />
</#list>
<#assign pager=pager+"</select>" />
<#else>
<#assign pager="<input type='text' id='${bean.id}_ps' readonly='readonly' style='width:35px' class='readonly' name='${bean.id}.pageSize' value='${pi.pageSize}' />" />
</#if>
<#assign pager=pager+" ${i18n.pageMsg} <span>|</span> " />
<#if pi.currentPage=1>
<#assign pager=pager+"<img src='${bean.params.contextPath}/images/page-first-d.gif' /><img src='${bean.params.contextPath}/images/page-prev-d.gif' />" />
<#else>
<#assign pager=pager+"<a onclick=\"${bean.loadHandler!'$.dg.loadData'}(this, '${bean.id}', ${pi.pageSize}, 1)\">" />
<#assign pager=pager+"<img src='${bean.params.contextPath}/images/page-first.gif' /></a>" />
<#assign pager=pager+"<a onclick=\"${bean.loadHandler!'$.dg.loadData'}(this, '${bean.id}', ${pi.pageSize}, ${pi.currentPage-1})\">" />
<#assign pager=pager+"<img src='${bean.params.contextPath}/images/page-prev.gif' /></a>" />
</#if>
<#assign pager=pager+" <span>|</span> " />
<#assign pager=pager+"<select id='${bean.id}_cp' name='${bean.id}.currentPage' onchange=\"${bean.loadHandler!'$.dg.loadData'}(this, '${bean.id}', ${pi.pageSize}, $(this).val())\">" />
<#if pi.pageCount=0>
<#assign pc=1 />
<#else>
<#assign pc=pi.pageCount />
</#if>
<#list 1..pc as i>
<#assign pager=pager+"<option value='${i}'"/>
<#if i=pi.currentPage>
<#assign pager=pager+" selected=\'true\'" />
</#if>
<#assign pager=pager+">${i}/${pc}</option>" />
</#list>
<#assign pager=pager+"</select> <span>|</span> " />
<#if pi.currentPage=pc>
<#assign pager=pager+"<img src='${bean.params.contextPath}/images/page-next-d.gif' /><img src='${bean.params.contextPath}/images/page-last-d.gif' />" />
<#else>
<#assign pager=pager+"<a onclick=\"${bean.loadHandler!'$.dg.loadData'}(this, '${bean.id}', ${pi.pageSize}, ${pi.currentPage+1})\">" />
<#assign pager=pager+"<img src='${bean.params.contextPath}/images/page-next.gif' /></a>"/>
<#assign pager=pager+"<a onclick=\"${bean.loadHandler!'$.dg.loadData'}(this, '${bean.id}', ${pi.pageSize}, ${pc})\">"/>
<#assign pager=pager+"<img src='${bean.params.contextPath}/images/page-last.gif' /></a>" />
</#if>
<#assign pager=pager+" <span>|</span> ${i18n.pageStat} "/>
<#if chkType=1 || chkType=2><#assign pager=pager+"<span>|</span> ${i18n.chkedInfo}: <span class='chked-rows'>0</span>" />

<#assign pager2="<select id='${bean.id}_ps' name='${bean.id}.pageSize' disabled='disabled' onchange=\"${bean.loadHandler!'$.dg.loadData'}(this, '${bean.id}', $(this).val(), ${pi.currentPage})\">"/>
<#list bean.params.pages as p>
<#assign pager2=pager2+"<option value='${p}'"/>
<#if p=pi.pageSize?c><#assign pager2=pager2+" selected=\'true\'"/></#if>
<#assign pager2=pager2+">${p}</option>" />
</#list>
<#assign pager2=pager2+"</select>" />
<#else>
<#assign pager2="<input type='text' id='${bean.id}_ps' disabled='disabled' readonly='readonly' style='width:35px' class='readonly' name='${bean.id}.pageSize' value='${pi.pageSize}' />" />
</#if>
<#assign pager2=pager2+" ${i18n.pageMsg} <span>|</span> " />
<#if pi.currentPage=1>
<#assign pager2=pager2+"<img src='${bean.params.contextPath}/images/page-first-d.gif' /><img src='${bean.params.contextPath}/images/page-prev-d.gif' />" />
<#else>
<#assign pager2=pager2+"<a onclick=\"${bean.loadHandler!'$.dg.loadData'}(this, '${bean.id}', ${pi.pageSize}, 1)\">" />
<#assign pager2=pager2+"<img src='${bean.params.contextPath}/images/page-first.gif' /></a>" />
<#assign pager2=pager2+"<a onclick=\"${bean.loadHandler!'$.dg.loadData'}(this, '${bean.id}', ${pi.pageSize}, ${pi.currentPage-1})\">" />
<#assign pager2=pager2+"<img src='${bean.params.contextPath}/images/page-prev.gif' /></a>" />
</#if>
<#assign pager2=pager2+" <span>|</span> " />
<#assign pager2=pager2+"<select id='${bean.id}_cp' disabled='disabled' name='${bean.id}.currentPage' onchange=\"${bean.loadHandler!'$.dg.loadData'}(this, '${bean.id}', ${pi.pageSize}, $(this).val())\">" />
<#if pi.pageCount=0>
<#assign pc=1 />
<#else>
<#assign pc=pi.pageCount />
</#if>
<#list 1..pc as i>
<#assign pager2=pager2+"<option value='${i}'"/>
<#if i=pi.currentPage>
<#assign pager2=pager2+" selected=\'true\'" />
</#if>
<#assign pager2=pager2+">${i}/${pc}</option>" />
</#list>
<#assign pager2=pager2+"</select> <span>|</span> " />
<#if pi.currentPage=pc>
<#assign pager2=pager2+"<img src='${bean.params.contextPath}/images/page-next-d.gif' /><img src='${bean.params.contextPath}/images/page-last-d.gif' />" />
<#else>
<#assign pager2=pager2+"<a onclick=\"${bean.loadHandler!'$.dg.loadData'}(this, '${bean.id}', ${pi.pageSize}, ${pi.currentPage+1})\">" />
<#assign pager2=pager2+"<img src='${bean.params.contextPath}/images/page-next.gif' /></a>"/>
<#assign pager2=pager2+"<a onclick=\"${bean.loadHandler!'$.dg.loadData'}(this, '${bean.id}', ${pi.pageSize}, ${pc})\">"/>
<#assign pager2=pager2+"<img src='${bean.params.contextPath}/images/page-last.gif' /></a>" />
</#if>
<#assign pager2=pager2+" <span>|</span> ${i18n.pageStat} "/>
<#if chkType=1 || chkType=2><#assign pager2=pager2+"<span>|</span> ${i18n.chkedInfo}: <span class='chked-rows'>0</span>" />
</#if>
<div id='${bean.id}_pg' class='pager'>${pager}</div><#rt/>
<div id="${bean.id}_ff" pid="${bean.id}" class="grid-tab-ff"><#rt/>
<div class="scroll-box"><div class="scroll-bar">&nbsp;</div></div><#rt/>
<div class='pager'>${pager2}</div></div>
</#if>

<#-- output row selector -->
<#if bean.selectorEnabled>
<#assign selectedRows=bean.getSelectedRows() />
<div id="${bean.id}_rs" class="row-selector-s rad shadow">
<div class="selectedNum" title="${bean.i18n('lbl.dg.expand')}" onclick="javascript:$.rs.open('${bean.id}')">0</div>
</div>
<div id="${bean.id}_rs_full" class="row-selector-f rad shadow" style="
<#if bean.selectorWidth??>width:${bean.selectorWidth}px;</#if><#rt>
<#if bean.selectorHeight??>height:${bean.selectorHeight}px;</#if><#rt/>
"><#rt/>
<#if bean.selectorSelectAll!true>
<a href="javascript:$.rs.clear('${bean.id}')" title="${bean.i18n('lbl.dg.clearAll')}"><img src="${bean.params.contextPath}/images/clear.png" /></a>
</#if>

<#if bean.selectorButtons??>
<#list bean.selectorButtons as btn>
[<a 
<#if btn.id??>
 id="${btn.id}"<#rt/>
</#if>
<#if btn.title??>
 title="${bean.i18n(btn.title)}"<#rt/>
</#if>
<#if btn.style??>
 style="${btn.style}"<#rt/>
</#if>
 href="javascript:$.rs.trigger(${btn.onclick!''}, this, '${bean.id}')">${bean.i18n(btn.label!'')}</a>]&nbsp;
</#list>
</#if>
<div class="selectedNum" onclick="$.rs.close('${bean.id}')" title="${bean.i18n('lbl.dg.collapse')}" style="float:right;margin-right:3px;">0</div>

<div class="row-selector-list" style="
<#if bean.selectorHeight??>height:${bean.selectorHeight?number-30}px;</#if><#rt/>
"><#rt/>
<ul id="${bean.id}_rs_ul">
<#list selectedRows as row>
<li id="${bean.id}_rs_li_${row.key}"><a href="javascript:$.rs.deleteFromPool('${bean.id}','${row.key}')"><img src="${bean.params.contextPath}/images/delete.png" align="middle" /></a> ${row.value!''}</li>
</#list>
</ul>
</div>
</div>
</#if>
<script type="text/javascript">setTimeout(function(){$.dg.init('${bean.id}');<#if bean.selectorEnabled>$.rs.init('${bean.id}', ${bean.getSelectedCount(bean.id)});</#if>},1000);</script>

<#macro array2String a>
<#list a as i>
<#lt/>${i}<#if i_has_next>,</#if><#rt/>
</#list>
</#macro>

<#macro genSort sn so name>
<#list sn as i>
<#if i=name>
<#if so[i_index]!'asc'='asc'>desc<#else>asc</#if>
<#else>asc</#if>
</#list>
</#macro>
