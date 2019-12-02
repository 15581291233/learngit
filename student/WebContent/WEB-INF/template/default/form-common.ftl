<#--
/*
 * $Id: form.ftl 590812 2007-10-31 20:32:54Z apetrelli $
 *
 * Licensed to the Apache Software Foundation (ASF) under one
 * or more contributor license agreements.  See the NOTICE file
 * distributed with this work for additional information
 * regarding copyright ownership.  The ASF licenses this file
 * to you under the Apache License, Version 2.0 (the
 * "License"); you may not use this file except in compliance
 * with the License.  You may obtain a copy of the License at
 *
 *  http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing,
 * software distributed under the License is distributed on an
 * "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
 * KIND, either express or implied.  See the License for the
 * specific language governing permissions and limitations
 * under the License.
 */
-->
<#if (bean.validate)?? && bean.validate?string =="true">
<#assign ctx=bean.contextPath/>
<script src="${ctx}/js/sjs/jquery.validationEngine.js" type="text/javascript"></script>
<script src="${ctx}/js/sjs/jquery.validationEngine-rules.js" type="text/javascript"></script>
<script type="text/javascript">
$(document).ready(function(){
    setTimeout(function(){  	
      initValidationEngine("${bean.id?html}");
    },500);
});
</script>
</#if>
<#if (bean.validate?default(false) == false)><#rt/>
    <#if bean.onsubmit??><#rt/>
        ${tag.addParameter('onsubmit', "${bean.onsubmit}") }
    </#if>
</#if>
<form<#rt/>

<#if bean.theme='dwz'>
  prefix="${bean.prefix}"
</#if>

<#if bean.theme='dwz'>
  class="required-validate"
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
<#if bean.acceptcharset??>
 accept-charset="${bean.acceptcharset?html}"<#rt/>
</#if>
