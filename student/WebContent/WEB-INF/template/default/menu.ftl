<#if bean.layout?? && bean.layout=="line">
<script type="text/javascript" src="${bean.params.contextPath}/js/plugins/menu/menu.js"></script>
<link rel='stylesheet' type='text/css' href='${bean.params.contextPath}/js/plugins/menu/menu.css' />
<div id="menu_horizontal">
${bean.horizontalHtml}
</div>
<script type="text/javascript">
$(document).ready(function(){
    $("div.main").css({
        margin:"0px auto"
    });
});

</script>

<#else>
<link rel="stylesheet" type="text/css" href="${bean.params.contextPath}/theme/zTree/zTreeStyle.css" />
<script src='${bean.params.contextPath}/js/jquery/plugins/jquery.ztree.core-3.5.js'></script>
<div class="menu">
<div class="menu-main">
    <div class="menu-main-txt">Main Menu</div>
    <div id="colAll" class="col-all">&nbsp;</div>
    <div id="expAll" class="exp-all">&nbsp;</div>
</div>
<ul id="${bean.id}" class="ztree"></ul>
</div>
<script type="text/javascript">
        var menuTreeSettign = {
            view: {
                showLine: false
                ,showIcon: true
                ,selectedMulti: false
                ,dblClickExpand: false
                ,addDiyDom: addDiyDom
            },
            data: {
                key:{
                    name:"menuLabel",
                    title:"menuLabel"
                },
                simpleData: {
                    enable: true,
                    idKey: "oid",
                    pIdKey: "parentOid"
                }
            },
            callback: {
                beforeClick: beforeClick,
                onExpand:onExpand,
                onCollapse:onCollapse
            }
        };
        
        function deleteCookie(objName){
            var date = new Date();
            date.setTime(date.getTime()-10000);
            document.cookie = objName + "=a; expires="+date.toGMTString();
        }
        
        function onExpand(event, treeId, treeNode){
            var id = treeNode.tId;
            
            $("#"+id+"_a").css({"border-bottom":"1px solid #ccc"});
        
            var zTree = $.fn.zTree.getZTreeObj("${bean.id}");
            var openedNodeArray = zTree.getNodesByParam("open",true,null);
            
            var openedIdArray = [];
            for(var i=0; i < openedNodeArray.length; i++){
                openedIdArray.push(openedNodeArray[i].tId);
            }
            
            $.util.setCookie("opendNodeArray",openedIdArray);
        }

        function onCollapse(event, treeId, treeNode){
            var id = treeNode.tId;
            
            $("#"+id+"_a").css({"border-bottom":"0"});
        
            var zTree = $.fn.zTree.getZTreeObj("${bean.id}");
            var openedNodeArray = zTree.getNodesByParam("open",true,null);
            
            var openedIdArray = [];
            for(var i=0; i < openedNodeArray.length; i++){
                openedIdArray.push(openedNodeArray[i].tId);
            }
            
            $.util.setCookie("opendNodeArray",openedIdArray);
        }
        
        <#if bean.menuData??>
            var zNodes = eval('(${bean.menuData})');
        <#else>
            var zNodes=[];
        </#if>
           
        function addDiyDom(treeId, treeNode) {
            var spaceWidth = 10;
            var switchObj = $("#" + treeNode.tId + "_switch"),
            icoObj = $("#" + treeNode.tId + "_ico");
            switchObj.remove();
            var level = switchObj.attr("class");
            if(treeNode.level > 0){
                icoObj.before(switchObj);
            }else{
                icoObj.css({width:"0px",height:"0px", margin:"5px"});
            }
        }

        function beforeClick(treeId, treeNode) {
            var zTree = $.fn.zTree.getZTreeObj("${bean.id}");
            zTree.expandNode(treeNode,null,null,null,true);
            return false;
        }

        $(document).ready(function(){
            var treeObj = $("#${bean.id}");
            $.fn.zTree.init(treeObj, menuTreeSettign, zNodes);   
            var $menuTree = $.fn.zTree.getZTreeObj("${bean.id}");
    
            // get the firstNode, and expand it.
            var tmp = $.util.getCookie("opendNodeArray");
            if($.trim(tmp) != ""){
                var tIdArray = tmp.split(",");

                for(var i=0; i<tIdArray.length;i++){
                    var $node = $menuTree.getNodeByTId(tIdArray[i]);
                    $menuTree.expandNode($node,null,null,null,true);
                }
            }else{
                var allNodes = $menuTree.getNodes();
                $menuTree.expandNode(allNodes[0],null,null,null,true);
            }
            
            $("a.level0").each(function(){
                var aId = this.id;
                var tId = aId.substring(0,aId.length-2);
                var $node = $menuTree.getNodeByTId(tId);
                
                if(!$node.open){
                    $(this).css({"border-bottom":"0"});
                }
            });
        
            $("#expAll").click(function(){
                $menuTree.expandAll(true);
                
                $("a.level0").each(function(i){
                    $(this).css({"border-bottom":"1px solid #ccc"});
                });
            });
            
            $("#colAll").click(function(){
                $menuTree.expandAll(false);
                $("a.level0").each(function(i){
                    $(this).css({"border-bottom":"0px"});     
                });
            });
        });
</script>
</#if>
